`timescale 1ns / 1ps

module tb_uart_top;

    localparam CLK_PERIOD = 20;
    localparam BAUD_CNT   = 50_000_000 / 115200; // 434

    logic        sys_clk, rst_n, start, led;
    logic [7:0]  cmd;
    logic        tx, rx;
    wire [23:0] freq, freq_;
    logic [23:0] freq_expected; 
    logic        done, error;

    uart_top u_top (.*);

    // ---- Massiv ogidaemih otvetov ----
    reg [31:0] expected_resp [0:255];
    reg [23:0] expected_frequency [0:255];
    integer    num_cmds;

    // ---- Generator taktov ----
    initial begin
        sys_clk = 0;
        forever #(CLK_PERIOD/2) sys_clk = ~sys_clk;
    end

    // ---- Chtenie iz faila  fscanf (po odnomu 32-bitnomu hex-chislu) ----
    initial begin
        integer file;
        integer idx;
        reg [31:0] val;
        file = $fopen("../verilog/test_array_urr.txt", "r");
         if (file == 0) begin
                $display("ERROR: Cannot open test_array_urr.txt");
                $finish;
         end
       // end
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

    // ---- Zadacha otpravki baita ----
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





    // // ---- Отладка приёма ----
    // always @(posedge clk) begin
    //     if (u_top.u_rx.valid) begin
    //         $display("RX byte: 0x%02h at time %t", u_top.u_rx.data, $time);
    //     end
    // end



       always @(posedge sys_clk) begin
        if (done) begin 
               $display("done detected at %t, freq= %d", $time, freq);
              end
       end


    // ---- Основной тест ----
    initial begin
        integer cmd_idx, timeout;

        rst_n = 0;
        start = 0;
        cmd   = 8'd0;
        rx    = 1;
        #100;
        rst_n = 1;
        #100;


    for (cmd_idx = 0; cmd_idx < num_cmds; cmd_idx = cmd_idx + 1) begin
    cmd = cmd_idx + 1;
    @(posedge sys_clk);
    start = 1;
    @(posedge sys_clk);
    start = 0;

    wait (u_top.u_tx.busy == 0);
    repeat (10) @(posedge sys_clk);//#(CLK_PERIOD * 10);

    send_byte(expected_resp[cmd_idx][31:24]);
    send_byte(expected_resp[cmd_idx][23:16]);
    send_byte(expected_resp[cmd_idx][15:8]);
    send_byte(expected_resp[cmd_idx][7:0]);
    @(posedge sys_clk);
  

    #(CLK_PERIOD * 100000);
     end



        
        $display("ALL TESTS PASSED");
        $finish;
    end

    always @(posedge sys_clk) begin
        if (error) $display("Error at time %t", $time);
    end

    initial begin
        $dumpfile("tb_uart_top.vcd");
        $dumpvars(0, tb_uart_top);
    end

endmodule