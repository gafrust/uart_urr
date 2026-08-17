module uart_top (
    input  wire       sys_clk,      // 50 Mhz
    input  wire       rst_n,
   (* IOB = "TRUE" *) output wire       tx,           // UART TX
   (* IOB = "TRUE" *) input  wire       rx,           // UART RX
   (* DONT_TOUCH = "yes" *) output wire       led,          // svetodiod

    // AXI BRAM interface (podkluchenie k bram_interface_urr)
    (* DONT_TOUCH = "yes" *) input  wire        axi_en_i,
    (* DONT_TOUCH = "yes" *) input  wire [31:0] axi_data_i,
    (* DONT_TOUCH = "yes" *) input  wire        axi_we_i,
    (* DONT_TOUCH = "yes" *) input  wire [31:0] axi_addr_i,
   (* DONT_TOUCH = "yes" *)  output wire        axi_vd_o,
    (* DONT_TOUCH = "yes" *) output wire [31:0] axi_data_o,
    (* DONT_TOUCH = "yes" *) output wire  dir
);

    // ---- Vnutrennie signali ----
    (* DONT_TOUCH = "yes" *) wire       tx_busy;
    (* DONT_TOUCH = "yes" *) wire       tx_start;
    (* DONT_TOUCH = "yes" *) wire [7:0] tx_data;
    (* DONT_TOUCH = "yes" *) wire       rx_valid;
    (* DONT_TOUCH = "yes" *) wire [7:0] rx_data;
    (* DONT_TOUCH = "yes" *) wire       rx_error;
    wire       rst;
    (* DONT_TOUCH = "yes" *) wire       module_enable;

    // Signali megdu bram_interface_urr и urr
   (* DONT_TOUCH = "yes" *) wire        start;
   (* DONT_TOUCH = "yes" *) wire [7:0]  cmd;
   (* DONT_TOUCH = "yes" *) wire        done;
   (* DONT_TOUCH = "yes" *) wire        error;
   (* DONT_TOUCH = "yes" *) wire [23:0] freq;

      
   (* DONT_TOUCH = "yes" *) wire        start_bram, start_urr, start_crc_impulse ;
   (* DONT_TOUCH = "yes" *) wire [7:0]  cmd_bram, cmd_urr;
   (* DONT_TOUCH = "yes" *) wire [31:0] crc_result;
   (* DONT_TOUCH = "yes" *) wire        crc_done;
   (* DONT_TOUCH = "yes" *) wire        crc_running;
   (* DONT_TOUCH = "yes" *) wire        crc_match;
   
    //Vkluchenie
   // assign rst = module_enable? rst_n : 1'b1; //module_enable

    // ---- Svetodiot ----
    (* DONT_TOUCH = "yes" *) reg [31:0] led_cnt;
    (* DONT_TOUCH = "yes" *) reg        led_reg;
    assign led = led_reg;

    (* DONT_TOUCH = "yes" *) reg rx_valid_delayed;
    (* DONT_TOUCH = "yes" *) reg [7:0] rx_data_delayed;





    // ---- Signali for urr (maskiruyotsa v  CRC-regime) ----
   (* DONT_TOUCH = "yes" *) wire        rx_valid_to_urr;
   (* DONT_TOUCH = "yes" *) wire [7:0]  rx_data_to_urr;
   (* DONT_TOUCH = "yes" *) wire        rx_error_to_urr;

    assign rx_valid_to_urr = crc_running ? 1'b0 : rx_valid;
    assign rx_data_to_urr  = crc_running ? 8'd0  : rx_data;
    assign rx_error_to_urr = crc_running ? 1'b0 : rx_error;

    // Multiplexer for urr:
    assign start = crc_running ? start_urr : start_bram;   // start_bram из bram
    assign cmd   = crc_running ? cmd_urr   : cmd_bram;     // cmd_bram из bram

    // ---- Instansi modulei ----
    uart_tx u_tx (
        .clk   (sys_clk),
        .rst_n (~rst_n),
        .start (tx_start),
        .data  (tx_data),
        .busy  (tx_busy),
        .tx    (tx)
    );

    uart_rx u_rx (
        .clk   (sys_clk),
        .rst_n (~rst_n),
        .rx    (rx),
        .data  (rx_data),
        .valid (rx_valid),
        .error (rx_error)
    );


        // Instans urr_crc
    urr_crc u_urr_crc (
        .clk       (sys_clk),
        .rst_n     (~rst_n),
        .start_crc  (start_crc_impulse),
       // .crc_enable(crc_mode_enable),   // из bram (бит 2 reg_ctrl)
        .rx_valid  (rx_valid),
        .rx_data   (rx_data),
        .rx_error  (rx_error),
        .tx_busy   (tx_busy),
        .urr_error (error),
        .start_urr (start_urr),
        .cmd_urr   (cmd_urr),
        .crc_result(crc_result),
        .crc_done  (crc_done),
        .crc_running(crc_running),
        .crc_match(crc_match)           // 1 – если вычисленное CRC совпадает с принятым
    );




    urr u_urr (
        .clk      (sys_clk),
        .rst_n    (~rst_n),
        .start    (start),
        .cmd      (cmd),
        .tx_busy  (tx_busy),
        .tx_start (tx_start),
        .tx_data  (tx_data),
        .rx_valid (rx_valid_to_urr),
        .rx_data  (rx_data_to_urr),
        .rx_error (rx_error_to_urr),
        .freq     (freq),
        .done     (done),
        .error    (error),
        .dir      (dir)
        // .flag_crc(),
        // .crc_result()
    );

    bram_interface_urr bram (
        .clk_i    (sys_clk),
        .rst_i    (~rst_n),          // если rst_i активен высоким уровнем
        // AXI
        .axi_en_i   (axi_en_i),
        .axi_data_i (axi_data_i),
        .axi_we_i   (axi_we_i),
        .axi_addr_i (axi_addr_i),
        .axi_vd_o   (axi_vd_o),
        .axi_data_o (axi_data_o),
        // UART
        .uart_start (start_bram),
        .uart_cmd   (cmd_bram),
        .uart_done  (done),
        .uart_error (error),
        .uart_freq  (freq),
        
        .module_enable (module_enable),
        .start_crc(start_crc_impulse),   // vihod impulsa

        .crc_result_i(crc_result),   // от urr_crc
        .crc_done_i(crc_done),    // от urr_crc
        .crc_match(crc_match)
    
    );


    // ---- Miganie svetodioda ----
    always @(posedge sys_clk or negedge rst_n) begin
        if (!rst_n) begin
            led_cnt <= 32'd0;
            led_reg <= 1'b0;
        end else begin
            if (led_cnt < 50_000_000 - 1) begin
                led_cnt <= led_cnt + 1;
            end else begin
                led_cnt <= 32'd0;
                led_reg <= ~led_reg;
            end
        end
    end

endmodule