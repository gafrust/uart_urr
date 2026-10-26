`timescale 1ns / 1ps

module tb_urr;

    localparam CLK_PERIOD = 16.66;//8.33/*20*/;
    localparam BAUD_CNT   = 60_000_000 / 115200;   //520  

    // ---- Сигналы тестбенча ----
    logic        sys_clk;
    logic        rst_p;
    logic        tx, rx, dir;
    wire         led;
    logic urr_connected_i;
    logic irq_con_o;
    logic irq_o;
    logic en_i ,vd_o, err_freq_code_o, crc_check_i,vd_crc_o,crc_result_o,rdy_o,is_connected_o;
    logic [7:0] addr_i;
    logic [31:0] freq_code_o;
    logic [31:0] crc_out_o;

    // ---- UART internal signals (from top) ----
    wire [23:0] freq;
    wire        done;
    wire        error;

    // ---- Expected responses ----
    reg [31:0] expected_resp [0:255];
    reg [23:0] expected_frequency [0:255];
    integer    num_cmds;

    // ---- Instance of DUT ----
    urr u_top (
        .clk_60_i   (sys_clk),
        .rst_i     (rst_p),
        .rs_tx_o        (tx),
        .rs_rx_i        (rx),
        .urr_connected_i(urr_connected_i),
        .irq_con_o(irq_con_o),
        .irq_o(irq_o),
        .rs_dir_o(dir),
        .en_i(en_i),
        .addr_i(addr_i),
        .vd_o(vd_o),
        .freq_code_o(freq_code_o),
        .err_freq_code_o(err_freq_code_o),
        .crc_check_i(crc_check_i),
        .vd_crc_o(vd_crc_o),
        .crc_result_o(crc_result_o),
        .crc_out_o(crc_out_o),
        .rdy_o(rdy_o),
        .is_connected_o(is_connected_o)
    );

    // ---- Clock generator ----
    initial begin
        sys_clk = 0;
        forever #(CLK_PERIOD/2) sys_clk = ~sys_clk;
    end

    // ---- Dopolnitelnie signali for CRC-tasta ----
    reg [31:0] crc_expected_reg;   // tekushee znachenie etalonnogo CRC
    wire [31:0] crc_expected_out;
    reg [7:0]  crc_byte;           // bait for podachi v etalonnoe CRC
    integer    crc_cmd_idx;        // indeks tekushei komandi pri otpravke otvetov
    reg        crc_test_active;    // flag aktivnosti  CRC-testa
    reg [31:0] crc_result_read;    // rezultat, prochitannii iz BRAM

    // ---- Instans etalonnogo CRC (takoi ge, kak v proekte) ----
    urr_crc_module u_crc_expected (
        .crcIn (crc_expected_reg),
        .data  (crc_byte),
        .crcOut(crc_expected_out)
    );

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
                //$display("Read[%0d] = 0x%08h, expected_frequency = %8d", idx, val, expected_frequency[idx]);
                ////$display("Read[%0d] = 0x%08h, expected_resp[idx] = 0x%08h", idx, val, expected_resp[idx]);
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

    // ---- Avtomaticheskaya zadacha for otpravki otveta po indeksu----
task automatic send_crc_response(input integer idx);
    begin
        send_byte(expected_resp[idx][31:24]);
        send_byte(expected_resp[idx][23:16]);
        send_byte(expected_resp[idx][15:8]);
        send_byte(expected_resp[idx][7:0]);
        //$display("CRC: sent response for command %0d", idx+1);
    end
endtask


    // // ---- Monitor done/error ----
    // always @(posedge sys_clk) begin
    //     if (u_top.done)  $display("done detected at %t, freq = %d", $time, u_top.freq);
    //     if (u_top.error) $display("error detected at %t", $time);
    // end


  


    // ---- Main test ----
    initial begin
        integer cmd_idx;
        integer timeout;
        integer cmd_idx_50;

        integer timeout_limit;
        integer start_time;
        reg crc_timeout_occurred;
        reg [31:0] expected_crc_value;
        @(posedge sys_clk);

        // Reset
        rst_p = 1;
        en_i = 0;
        addr_i =0;
        crc_check_i = 0;
       
        urr_connected_i = 1;
        crc_result_read <= 0;
        #100;
        rst_p = 0;
        

        rx = 1;
        #100;
       

        $display("Send one command");
        

        @(posedge sys_clk);
        en_i =1;
        addr_i = 8'd5;
        urr_connected_i = 0;

        @(posedge sys_clk);
        en_i = 0; 

         #(CLK_PERIOD);
        

       






     // 1 Vkluchaem modul (bit 0 registra 0x00)
        @(posedge sys_clk);
        urr_connected_i = 1;
        
        #(CLK_PERIOD*100);
       
        // ----- 2. Obichnii test odinochnih komand-----
        // Loop through all commands
        for (cmd_idx = 0; cmd_idx < num_cmds; cmd_idx = cmd_idx + 1) begin
            // ---- 1. Write command to ADDR_CMD (0x08) ----
            @(posedge sys_clk);
            en_i =1;//axi_en_i   = 1;
            addr_i = 8'(cmd_idx + 1);

            @(posedge sys_clk);
            en_i = 0; 

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
          //  @(posedge sys_clk);
          //  en_i   = 1;
            
            //@(posedge sys_clk);
            //$display("time2 at %t", $time);
            // data on axi_data_o is valid when axi_vd_o=1
            @(posedge sys_clk);
            if (vd_o) begin
                $display("freq_code_o[31:0] = %0d, expected_frequency[cmd_idx] = 0x%06h", freq_code_o, expected_frequency[cmd_idx]);
                if (freq_code_o == expected_frequency[cmd_idx]) begin
                    $display("PASS: cmd %0d, freq = 0x%06h", cmd_idx+1, freq_code_o);
                end else begin
                    $display("FAIL: cmd %0d, expected 0x%06h, got 0x%06h",
                             cmd_idx+1, expected_frequency[cmd_idx], freq_code_o);
                    $finish;
                end
            end
            en_i = 0;

            // ---- 6. Wait before next command ----
            #(CLK_PERIOD * 1000);
        end
       // $display("time3 at %t", $time);

        $display("Single command test completed");
        @(posedge sys_clk);
        en_i = 1;
        urr_connected_i = 0;
         #(CLK_PERIOD);
        

        @(posedge sys_clk); 
        en_i = 0;
        urr_connected_i = 1;
         #(CLK_PERIOD);
        



        // =============================================================
        // 3. CRC-ТЕСТ (автоматическая отправка 50 команд из urr_crc)
        // =============================================================
        $display("=== Starting CRC test ===");

        // 3.1 Вычисляем эталонное CRC, последовательно подавая все 200 байт
        crc_expected_reg = 32'hF5F5F5F5;   // начальное значение (совпадает с urr_crc)
        for (int i = 0; i < num_cmds; i = i + 1) begin
            crc_byte = expected_resp[i][31:24];
            @(posedge sys_clk); crc_expected_reg = crc_expected_out;
            crc_byte = expected_resp[i][23:16];
            @(posedge sys_clk); crc_expected_reg = crc_expected_out;
            crc_byte = expected_resp[i][15:8];
            @(posedge sys_clk); crc_expected_reg = crc_expected_out;
            crc_byte = expected_resp[i][7:0];
            @(posedge sys_clk); crc_expected_reg = crc_expected_out;
        end
        // Финальный XOR (как в urr_crc)
        expected_crc_value = crc_expected_reg ^ 32'hFFFFFFFF;
        $display("Expected CRC = 0x%08h", expected_crc_value);


        // 3.3 Zapuskaem CRC-process zapisiu v adres 0x20 (vuboe znachenie)
        @(posedge sys_clk);
        en_i = 1;
        crc_check_i = 1;
        
        @(posedge sys_clk);
        en_i = 0;
        crc_check_i = 0;
        #(CLK_PERIOD);

        // 3.4 Aktivizuruem avtomaticheskuy otpravku otvetov
       // crc_test_active = 1;
        crc_cmd_idx = 0;

        timeout_limit = 20000000;   // 20 мс
        start_time = $time;
        crc_timeout_occurred = 1'b0;

        // 3.5 Ogidaem zavershenia CRC-processa s taimautom
        while (!u_top.u_urr_crc.crc_done) begin
        @(posedge sys_clk);
    
           // Proverka taimauta
            if (($time - start_time) > timeout_limit) begin
                $display("WARNING: Timeout waiting for CRC done at %t", $time);
                crc_timeout_occurred = 1'b1;
                break;   // vihodim iz cicla
            end
    
            if (u_top.u_urr_crc.start_urr) begin
               // Opredelaem, kakaya komanda otpravlaetsa
               if (u_top.u_urr_crc.cmd_urr == 8'hFF) begin
                   send_byte(8'h93);
                   send_byte(8'h64);
                   send_byte(8'h20);
                   send_byte(8'hA8);
                   $display("CRC: sent response for command 255 (CRC = 0x936420a8)");
                   end else begin
                   cmd_idx = crc_cmd_idx;
                   crc_cmd_idx = crc_cmd_idx + 1;
                   fork
                       send_crc_response(cmd_idx);
                   join_none
               end
           end
       end


        // 3.6 Deaktiviruem otpravku otvetov
     //   crc_test_active = 0;
        //  wait(axi_vd_o);
        #(CLK_PERIOD );//* 1000);
        // 3.7 Читаем результат CRC из адреса 0x14
        @(posedge sys_clk);
        en_i = 1;
       
        @(posedge sys_clk);
        crc_result_read = crc_out_o;
        // $display("time4 at %t", $time);
        @(posedge sys_clk);
        if (crc_result_read == expected_crc_value) begin
            $display("CRC PASS: calculated CRC = 0x%08h matches expected", crc_result_read);
        end else begin
            $display("CRC FAIL: expected 0x%08h, got 0x%08h", expected_crc_value, crc_result_read);
            $finish;
        end


        $timeformat(-9, 3, " ns", 10); // nanosekundi
        $display("time4 at %t", $realtime);


        en_i = 0;
       // #(CLK_PERIOD);

        // 3.8 Chitaem status CRC iz adresa 0x1C (bit 0 = done, bit 1 = error)
        @(posedge sys_clk);
        en_i = 1;
       
      

        $timeformat(-9, 3, " ns", 10); // nanosekundi
        $display("time5 at %t", $realtime);
         @(posedge sys_clk);
        // if (axi_data_o[0] != 1) $display("WARNING: CRC status done bit not set!");
        // axi_en_i = 0;
        #(CLK_PERIOD);
        @(posedge sys_clk);
        urr_connected_i = 0;

    //     // Vtoroi cikl scheta crc s nepravinim znacheniem
    //      // 3.9 Zapuskaem  CRC-process zapisiu v adress 0x20 (luboe znachenie)
    //     @(posedge sys_clk);
    //     axi_en_i = 1;
    //     axi_we_i = 3'hF;
    //     axi_addr_i = 32'h00000020;
    //     axi_data_i = 32'h00000001;   // znachinie ne vagno
    //     @(posedge sys_clk);
    //     axi_en_i = 0;
    //     axi_we_i = 0;
    //     #(CLK_PERIOD);

    //     // 3.10 Aktiviziruem avtomaticheskuyu otpravku otvetov
    //    // crc_test_active = 1;
    //     crc_cmd_idx = 0;

    //     //timeout_limit = 50000000; //20000000;   // 20 мс
    //     start_time = $time;
    //     crc_timeout_occurred = 1'b0;

    //     // 3.11 Ogidaem zavershenia CRC-processa s taimautom
    //     while (!u_top.u_urr_crc.crc_done) begin
    //     @(posedge sys_clk);
    
    //        // Proverka taimauta
    //         if (($time - start_time) > timeout_limit) begin
    //             $display("WARNING: Timeout waiting for CRC done at %t", $time);
    //             crc_timeout_occurred = 1'b1;
    //             break;   // vihodim iz cikla
    //         end
    
    //        if (u_top.u_urr_crc.start_urr) begin
    //            // Opredelaem,kakaya komanda otpravlaetsa
    //            if (u_top.u_urr_crc.cmd_urr == 8'hFF) begin
    //                send_byte(8'h92); // specialno nepravino otpravlaem
    //                send_byte(8'h64);
    //                send_byte(8'h20);
    //                send_byte(8'hA8);
    //                $display("CRC: sent response for command 255 (CRC = 0x926420a8)");
    //            end else begin
    //                cmd_idx = crc_cmd_idx;
    //                crc_cmd_idx = crc_cmd_idx + 1;
    //                fork
    //                    send_crc_response(cmd_idx);
    //                join_none
    //            end
    //        end
    //    end

    // // Posle cikla
    // // if (!crc_timeout_occurred) begin
    // //     $display("CRC done detected");
    // //     // Здесь можно выполнить проверку результата
    // // end else begin
    // //     $display("CRC process timed out – skipping verification");
    // //     // Пропускаем проверку, но продолжаем тест
    // // end

    //     // 3.12 Deaktiviruem otpravku otvetov
    //    // crc_test_active = 0;
    //     //  wait(axi_vd_o);
    //     #(CLK_PERIOD );//* 1000);
    //     // 3.7 Читаем результат CRC из адреса 0x14
    //     @(posedge sys_clk);
    //     axi_en_i = 1;
    //     axi_we_i = 0;
    //     axi_addr_i = 32'h00000014;
    //     @(posedge sys_clk);
    //     crc_result_read = axi_data_o;
    //     // $display("time4 at %t", $time);
    //     @(posedge sys_clk);
    //     // if (crc_result_read == expected_crc_value) begin
    //     //     $display("CRC PASS: calculated CRC = 0x%08h matches expected", crc_result_read);
    //     // end else begin
    //     //     $display("CRC FAIL: expected 0x%08h, got 0x%08h", expected_crc_value, crc_result_read);
    //     //     $finish;
    //     // end


    //     $timeformat(-9, 3, " ns", 10); // nanosekundi
    //     $display("time4 at %t", $realtime);


    //     axi_en_i = 0;
    //    // #(CLK_PERIOD);

    //     // 3.13 Chitaem status CRC iz adresa 0x1C (bit= done, bit error)
    //     @(posedge sys_clk);
    //     axi_en_i = 1;
    //     axi_we_i = 0;
    //     axi_addr_i = 32'h0000001C;

    //     $timeformat(-9, 3, " ns", 10); // nanosekundi
    //     $display("time5 at %t", $realtime);
    //      @(posedge sys_clk);
    //     // if (axi_data_o[0] != 1) $display("WARNING: CRC status done bit not set!");
    //     // axi_en_i = 0;
    //     #(CLK_PERIOD);





        // 3.14 Sravnenie
        // if (crc_result_read == expected_crc_value) begin
        //     $display("CRC PASS: calculated CRC = 0x%08h matches expected", crc_result_read);
        // end else begin
        //     $display("CRC FAIL: expected 0x%08h, got 0x%08h", expected_crc_value, crc_result_read);
        //     $finish;
        // end

        $display("ALL TESTS PASSED (including CRC)");
        $finish;
    end

    // ---- Save waveform ----
    initial begin
        $dumpfile("tb_urr.vcd");
        $dumpvars(0, tb_urr);
    end
endmodule
