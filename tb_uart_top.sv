`timescale 1ns / 1ps

module tb_uart_top;

    localparam CLK_PERIOD = 20;
    localparam BAUD_CNT   = 50_000_000 / 115200; // 434

    // ---- Сигналы тестбенча ----
    logic        sys_clk;
    logic        rst_n;
    logic        tx, rx;
    wire         led;

    // ---- AXI BRAM signals ----
    logic        axi_en_i;
    logic [31:0] axi_data_i;
    logic        axi_we_i;
    logic [31:0] axi_addr_i;
    wire         axi_vd_o;
    wire [31:0]  axi_data_o;

    // ---- UART internal signals (from top) ----
    wire [23:0] freq;
    wire        done;
    wire        error;

    // ---- Expected responses ----
    reg [31:0] expected_resp [0:255];
    reg [23:0] expected_frequency [0:255];
    integer    num_cmds;

    // ---- Instance of DUT ----
    uart_top u_top (
        .sys_clk   (sys_clk),
        .rst_n     (rst_n),
        .tx        (tx),
        .rx        (rx),
        .led       (led),
        .axi_en_i  (axi_en_i),
        .axi_data_i(axi_data_i),
        .axi_we_i  (axi_we_i),
        .axi_addr_i(axi_addr_i),
        .axi_vd_o  (axi_vd_o),
        .axi_data_o(axi_data_o)
    );

    // ---- Clock generator ----
    initial begin
        sys_clk = 0;
        forever #(CLK_PERIOD/2) sys_clk = ~sys_clk;
    end

    // ---- Read test data from file ----
    initial begin
        integer file, idx;
        reg [31:0] val;
        file = $fopen("../verilog/test_array_urr.txt", "r");
        if (file == 0) begin
            $display("ERROR: Cannot open test_array_urr.txt");
            $finish;
        end
        idx = 0;
        

          while (!$feof(file)) begin
                // Chitaem 8 hex-simvolov kak chislo, ignoriruya vse ostalnoe
                if ($fscanf(file, "%h", val) == 1) begin
                 expected_resp[idx] = val;
                 expected_frequency[idx] = {val[5:0],val[13:8],val[21:16],val[29:24]};//{val[29:24],val[21:16],val[13:8],val[5:0]};                         
                $display("Read[%0d] = 0x%08h, expected_frequency = %8d", idx, val, expected_frequency[idx]);
                 idx = idx + 1;
                end
           end


        $fclose(file);
        num_cmds = idx;
        $display("Total commands: %0d", num_cmds);
        if (num_cmds == 0) begin
            $display("ERROR: No data read");
            $finish;
        end
    end

    // ---- Task: send one UART byte ----
    task send_byte(input [7:0] data);
        reg parity;
        integer i;
        parity = ^data;
        rx = 0;
        #(CLK_PERIOD * BAUD_CNT);
        for (i = 0; i < 8; i = i + 1) begin
            rx = data[i];
            #(CLK_PERIOD * BAUD_CNT);
        end
        rx = parity;
        #(CLK_PERIOD * BAUD_CNT);
        rx = 1;
        #(CLK_PERIOD * BAUD_CNT);
    endtask

    // ---- Monitor done/error ----
    always @(posedge sys_clk) begin
        if (u_top.done)  $display("done detected at %t, freq = %d", $time, u_top.freq);
        if (u_top.error) $display("error detected at %t", $time);
    end

    // ---- Main test ----
    initial begin
        integer cmd_idx;
        integer timeout;

        // Reset
        rst_n = 0;
        axi_en_i = 0;
        axi_we_i = 0;
        axi_addr_i = 0;
        axi_data_i = 0;
        rx = 1;
        #100;
        rst_n = 1;
        #100;

        // Loop through all commands
        for (cmd_idx = 0; cmd_idx < num_cmds; cmd_idx = cmd_idx + 1) begin
            // ---- 1. Write command to ADDR_CMD (0x08) ----
            @(posedge sys_clk);
            axi_en_i   = 1;
            axi_we_i   = 1;
            axi_addr_i = 32'h00000008;
            axi_data_i = {24'b0, 8'(cmd_idx + 1)};  // команда = номер
            @(posedge sys_clk);
            axi_en_i   = 0;
            axi_we_i   = 0;

            // ---- 2. Wait for UART to finish TX (optional, but we'll wait for busy) ----
            wait (u_top.u_tx.busy == 0);
            #(CLK_PERIOD * 10);

            // ---- 3. Send 4-byte response (as before) ----
            send_byte(expected_resp[cmd_idx][31:24]);
            send_byte(expected_resp[cmd_idx][23:16]);
            send_byte(expected_resp[cmd_idx][15:8]);
            send_byte(expected_resp[cmd_idx][7:0]);

            // ---- 4. Wait for done or error ----
            timeout = 0;
            // while (!u_top.done && !u_top.error) begin
            //     @(posedge sys_clk);
            //     timeout++;
            //     if (timeout > 4_000_000) begin
            //         $display("ERROR: Timeout for cmd %0d", cmd_idx+1);
            //         $finish;
            //     end
            // end
            //$display("time1 at %t", $time);
            // ---- 5. Read result from ADDR_UART_RESULT (0x0C) ----
            @(posedge sys_clk);
            axi_en_i   = 1;
            axi_we_i   = 0;
            axi_addr_i = 32'h0000000C;
            //@(posedge sys_clk);
            //$display("time2 at %t", $time);
            // data on axi_data_o is valid when axi_vd_o=1
            @(posedge sys_clk);
            if (axi_vd_o) begin
                $display("axi_data_o[23:0] = %0d, expected_frequency[cmd_idx] = 0x%06h", axi_data_o[23:0], expected_frequency[cmd_idx]);
                if (axi_data_o[23:0] == expected_frequency[cmd_idx]) begin
                    $display("PASS: cmd %0d, freq = 0x%06h", cmd_idx+1, axi_data_o[23:0]);
                end else begin
                    $display("FAIL: cmd %0d, expected 0x%06h, got 0x%06h",
                             cmd_idx+1, expected_frequency[cmd_idx], axi_data_o[23:0]);
                    $finish;
                end
            end
            axi_en_i = 0;

            // ---- 6. Wait before next command ----
            #(CLK_PERIOD * 1000);
        end
       // $display("time3 at %t", $time);
        $display("ALL TESTS PASSED");
        $finish;
    end

    // ---- Save waveform ----
    initial begin
        $dumpfile("tb_uart_top.vcd");
        $dumpvars(0, tb_uart_top);
    end

endmodule










// `timescale 1ns / 1ps

// module tb_uart_top;

//     localparam CLK_PERIOD = 20;
//     localparam BAUD_CNT   = 50_000_000 / 115200; // 434

//     logic        sys_clk, rst_n, start, led;
//     logic [7:0]  cmd;
//     logic        tx, rx;
//     wire [23:0] freq, freq_;
//     logic [23:0] freq_expected; 
//     logic        done, error;

//     uart_top u_top (.*);

//     // ---- Massiv ogidaemih otvetov ----
//     reg [31:0] expected_resp [0:255];
//     reg [23:0] expected_frequency [0:255];
//     integer    num_cmds;

//     // ---- Generator taktov ----
//     initial begin
//         sys_clk = 0;
//         forever #(CLK_PERIOD/2) sys_clk = ~sys_clk;
//     end

//     // ---- Chtenie iz faila  fscanf (po odnomu 32-bitnomu hex-chislu) ----
//     initial begin
//         integer file;
//         integer idx;
//         reg [31:0] val;
//         file = $fopen("../verilog/test_array_urr.txt", "r");
//          if (file == 0) begin
//                 $display("ERROR: Cannot open test_array_urr.txt");
//                 $finish;
//          end
//        // end
//         idx = 0;
//         while (!$feof(file)) begin
//             // Chitaem 8 hex-simvolov kak chislo, ignoriruya vse ostalnoe
//             if ($fscanf(file, "%h", val) == 1) begin
//                 expected_resp[idx] = val;
//                 expected_frequency[idx] = {val[5:0],val[13:8],val[21:16],val[29:24]};//{val[29:24],val[21:16],val[13:8],val[5:0]};
                                          
//                 $display("Read[%0d] = 0x%08h, expected_frequency = %8d", idx, val, expected_frequency[idx]);
//                 idx = idx + 1;
//             end
//         end
//         $fclose(file);
//         num_cmds = idx;
//         $display("Total commands: %0d", num_cmds);
//         if (num_cmds == 0) begin
//             $display("ERROR: No data read");
//             $finish;
//         end
//     end

//     // ---- Zadacha otpravki baita ----
//     task send_byte(input [7:0] data);
//         reg parity;
//         integer i;
//         parity = ^data;
//         rx = 0;
//         #(CLK_PERIOD * BAUD_CNT);
//         for (i = 0; i < 8; i = i + 1) begin
//             rx = data[i];
//             #(CLK_PERIOD * BAUD_CNT);
//         end
//         rx = parity;
//         #(CLK_PERIOD * BAUD_CNT);
//         rx = 1;
//         #(CLK_PERIOD * BAUD_CNT);
//     endtask





//     // // ---- Отладка приёма ----
//     // always @(posedge clk) begin
//     //     if (u_top.u_rx.valid) begin
//     //         $display("RX byte: 0x%02h at time %t", u_top.u_rx.data, $time);
//     //     end
//     // end



//        always @(posedge sys_clk) begin
//         if (done) begin 
//                $display("done detected at %t, freq= %d", $time, freq);
//               end
//        end


//     // ---- Основной тест ----
//     initial begin
//         integer cmd_idx, timeout;

//         rst_n = 0;
//         start = 0;
//         cmd   = 8'd0;
//         rx    = 1;
//         #100;
//         rst_n = 1;
//         #100;


//     for (cmd_idx = 0; cmd_idx < num_cmds; cmd_idx = cmd_idx + 1) begin
//     cmd = cmd_idx + 1;
//     @(posedge sys_clk);
//     start = 1;
//     @(posedge sys_clk);
//     start = 0;

//     wait (u_top.u_tx.busy == 0);
//     repeat (10) @(posedge sys_clk);//#(CLK_PERIOD * 10);

//     send_byte(expected_resp[cmd_idx][31:24]);
//     send_byte(expected_resp[cmd_idx][23:16]);
//     send_byte(expected_resp[cmd_idx][15:8]);
//     send_byte(expected_resp[cmd_idx][7:0]);
//     @(posedge sys_clk);
  

//     #(CLK_PERIOD * 100000);
//      end



        
//         $display("ALL TESTS PASSED");
//         $finish;
//     end

//     always @(posedge sys_clk) begin
//         if (error) $display("Error at time %t", $time);
//     end

//     initial begin
//         $dumpfile("tb_uart_top.vcd");
//         $dumpvars(0, tb_uart_top);
//     end

// endmodule