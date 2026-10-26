module urr (
    input  wire       clk_60_i,      // 60 Mhz
    input  wire       rst_i,
    (* DONT_TOUCH = "yes" *) output wire rs_tx_o,           // UART TX
    (* DONT_TOUCH = "yes" *) input  wire rs_rx_i,           // UART RX
    (* DONT_TOUCH = "yes" *) input       urr_connected_i, 
    (* DONT_TOUCH = "yes" *) input wire  en_i,
    (* DONT_TOUCH = "yes" *) input wire  [7:0] addr_i,
    (* DONT_TOUCH = "yes" *) input wire  crc_check_i,
    (* DONT_TOUCH = "yes" *) output wire rs_dir_o,
    (* DONT_TOUCH = "yes" *) output wire irq_con_o,
    (* DONT_TOUCH = "yes" *) output wire irq_o,
    (* DONT_TOUCH = "yes" *) output wire vd_o,
    (* DONT_TOUCH = "yes" *) output wire [31:0] freq_code_o,
    (* DONT_TOUCH = "yes" *) output wire err_freq_code_o,
    
    (* DONT_TOUCH = "yes" *) output wire vd_crc_o,
    (* DONT_TOUCH = "yes" *) output wire crc_result_o,
    (* DONT_TOUCH = "yes" *) output wire [31:0] crc_out_o,
    (* DONT_TOUCH = "yes" *) output wire rdy_o,
    (* DONT_TOUCH = "yes" *) output reg  is_connected_o
);

    // ---- Vnutrennie signali ----
    (* DONT_TOUCH = "yes" *) wire       tx_busy;
    (* DONT_TOUCH = "yes" *) wire       tx_start;
    (* DONT_TOUCH = "yes" *) wire [7:0] tx_data;
    (* DONT_TOUCH = "yes" *) wire       rx_valid;
    (* DONT_TOUCH = "yes" *) wire [7:0] rx_data;
    (* DONT_TOUCH = "yes" *) wire       rx_error;
    (* DONT_TOUCH = "yes" *) wire       module_enable;
    (* DONT_TOUCH = "yes" *) wire [23:0]freq;

    // Signali
   (* DONT_TOUCH = "yes" *) wire        start;
   (* DONT_TOUCH = "yes" *) wire [7:0]  cmd;
   (* DONT_TOUCH = "yes" *) wire        done;
   (* DONT_TOUCH = "yes" *) wire        error;
   (* DONT_TOUCH = "yes" *) reg is_con_1, is_con_2;
   (* DONT_TOUCH = "yes" *) wire in_rising, in_descending;

      
   (* DONT_TOUCH = "yes" *) wire        start_bram, start_urr, start_crc_impulse ;
   (* DONT_TOUCH = "yes" *) wire [7:0]  cmd_bram, cmd_urr;
   (* DONT_TOUCH = "yes" *) wire [31:0] crc_result;
   (* DONT_TOUCH = "yes" *) wire        crc_done;
   (* DONT_TOUCH = "yes" *) wire        crc_running;
   (* DONT_TOUCH = "yes" *) wire        crc_match;
   (* DONT_TOUCH = "yes" *) wire        crc_check_ii;


                            wire rst;

    (* DONT_TOUCH = "yes" *) wire err_freq_code_latch, crc_result_latch, crc_result_from_urr_crc, err_freq_from_urr;
    (* DONT_TOUCH = "yes" *) wire vd_o_urr,vd_o_force_o, vd_urr_crc, vd_crc_o_force_o;
    //Vkluchenie
   
   //assign rst = (urr_connected_i /*| (!rdy_o)*/)? rst_i : 1'b1; //module_enable
    assign rst = rst_i;
   
    (* DONT_TOUCH = "yes" *) reg rx_valid_delayed;
    (* DONT_TOUCH = "yes" *) reg [7:0] rx_data_delayed;


   (* DONT_TOUCH = "yes" *) wire        rx_valid_to_urr;
   (* DONT_TOUCH = "yes" *) wire [7:0]  rx_data_to_urr;
   (* DONT_TOUCH = "yes" *) wire        rx_error_to_urr;

   (* DONT_TOUCH = "yes" *) wire        rx_valid_to_urr_crc;
   (* DONT_TOUCH = "yes" *) wire [7:0]  rx_data_to_urr_crc;

    // assign rx_valid_to_urr = crc_running ? 1'b0 : rx_valid;
    // assign rx_data_to_urr  = crc_running ? 8'd0  : rx_data;
    // assign rx_error_to_urr = crc_running ? 1'b0 : rx_error;

    // assign rx_valid_to_urr_crc = crc_running ? rx_valid : 1'b0;
    // assign rx_data_to_urr_crc  = crc_running ? rx_data  : 8'd0;

    // Multiplexer for urr:
    assign start = crc_running ? start_urr : (rdy_o ? en_i : 1'b0);
    assign cmd   = crc_running ? cmd_urr   : addr_i;

    assign crc_check_ii = rdy_o ? crc_check_i : 1'b0;
    


    urr_pulse_stretcher pulse_irq_con_o(
                .clk(clk_60_i),          // 60 МГц
                .rst(rst_i),
                .imp_i(urr_connected_i),  // короткий импульс (8 нс)
                .imp_out(irq_con_o) // растянутый импульс (100 нс)
    );

    urr_pulse_stretcher pulse_irq_o(
                .clk(clk_60_i),          // 60 МГц
                .rst(rst_i),
                .imp_i(vd_o),//(done),  // короткий импульс (8 нс)
                .imp_out(irq_o) // растянутый импульс (100 нс)
    );

    // ---- Instansi modulei ----
    urr_uart_tx u_tx (
        .clk   (clk_60_i),
        .rst_n (rst),
        .start (tx_start),
        .data  (tx_data),
        .busy  (tx_busy),
        .tx    (rs_tx_o)
    );

    urr_uart_rx u_rx (
        .clk   (clk_60_i),
        .rst_n (rst),
        .rx    (rs_rx_i),
        .data  (rx_data),
        .valid (rx_valid),
        .error (rx_error)
    );


        // Instans urr_crc
    urr_crc u_urr_crc (
        .clk       (clk_60_i),
        .rst_n     (rst),
        .start_crc  (crc_check_ii),
       // .crc_enable(crc_mode_enable),   // из bram (бит 2 reg_ctrl)
        .rx_valid  (rx_valid), //(rx_valid_to_urr_crc),
        .rx_data   (rx_data), //(rx_data_to_urr_crc),
        .rx_error  (rx_error),
        .tx_busy   (tx_busy),
        .urr_error (err_freq_from_urr),
        .start_urr (start_urr),
        .cmd_urr   (cmd_urr),
        .crc_result(crc_out_o),
        .crc_done  (vd_urr_crc),
        .crc_running(crc_running),
        .crc_match(crc_result_from_urr_crc)           // 1 – если вычисленное CRC совпадает с принятым
    );




    urr_osn u_urr_osn (
        .clk      (clk_60_i),
        .rst_n    (rst),
        .start    (start),
        .cmd      (cmd),
        .tx_busy  (tx_busy),
        .tx_start (tx_start),
        .tx_data  (tx_data),
        .rx_valid (rx_valid),
        .rx_data  (rx_data),
        .rx_error (rx_error_to_urr),
        .freq     (freq),
        .done     (vd_o_urr),
        .error    (err_freq_from_urr),
        .dir      (rs_dir_o)
        // .flag_crc(),
        // .crc_result()
    );

    assign err_freq_code_o = (err_freq_from_urr && (!crc_running)) || err_freq_code_latch;
    assign crc_result_o = crc_result_from_urr_crc || crc_result_latch;
    assign vd_crc_o = vd_urr_crc || vd_crc_o_force_o;
    assign vd_o = vd_o_force_o || vd_o_urr;
    assign freq_code_o = {0,0,0,0,0,0,0,0,freq};
    
   

    urr_rdy_ctrl_simple rdy_ctrl_simple (
         .clk(clk_60_i),
         .rst_i(rst),

    // Внешние сигналы
         .urr_connected_i(urr_connected_i),
         .en_i(en_i),
         .crc_check_i(crc_check_i),

    // От рабочих модулей
         .vd_o(vd_o_urr),           // завершение freq-операции (от u_urr)
         .vd_crc_o(vd_urr_crc),       // завершение CRC-операции (от u_urr_crc)
         .crc_match_i(crc_result_from_urr_crc),    // crc_result_o от u_urr_crc

    // Выходы
         .rdy_o(rdy_o),
         .err_freq_code_latch_o(err_freq_code_latch),   // защёлка ошибки freq
         .crc_result_latch_o(crc_result_latch),      // защёлка ошибки crc
         .vd_o_force_o(vd_o_force_o),   // форс-импульс при отключении (freq)
         .vd_crc_o_force_o(vd_crc_o_force_o) // форс-импульс при отключении (crc)
);
   

   
assign in_rising = is_con_1 && (!is_con_2);
assign in_descending = is_con_2 && (!is_con_1);

always @(posedge clk_60_i ) begin
        if (rst_i) begin
            is_con_1 <= 1'b0;
            is_con_2 <= 1'b0;
        end else begin
            is_con_1 <= urr_connected_i;
            is_con_2 <= is_con_1;
        end
    end

always @(posedge clk_60_i ) begin
        if (rst_i) begin
            is_connected_o <= 1'b0;
        end else begin
            if(in_rising || in_descending && !urr_connected_i) is_connected_o <= 1'b1; 
            else if(in_rising || in_descending && urr_connected_i) is_connected_o <= 1'b0;
        end 
    end


endmodule
