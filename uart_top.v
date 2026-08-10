module uart_top (
    input  wire       sys_clk,      // 50 Mhz
    input  wire       rst_n,
    output wire       tx,           // UART TX
    input  wire       rx,           // UART RX
    output wire       led,          // svetodiod

    // AXI BRAM interface (podkluchenie k bram_interface_urr)
    input  wire        axi_en_i,
    input  wire [31:0] axi_data_i,
    input  wire        axi_we_i,
    input  wire [31:0] axi_addr_i,
    output wire        axi_vd_o,
    output wire [31:0] axi_data_o
);

    // ---- Vnutrennie signali ----
    wire       tx_busy;
    wire       tx_start;
    wire [7:0] tx_data;
    wire       rx_valid;
    wire [7:0] rx_data;
    wire       rx_error;

    // Signali megdu bram_interface_urr и urr
    wire        start;
    wire [7:0]  cmd;
    wire        done;
    wire        error;
    wire [23:0] freq;

      
    wire        start_bram, start_urr, start_crc_impulse ;
    wire [7:0]  cmd_bram, cmd_urr;
    wire [31:0] crc_result;
    wire        crc_done;
    wire        crc_running;
   


    // ---- Svetodiot ----
    reg [31:0] led_cnt;
    reg        led_reg;
    assign led = led_reg;

     reg rx_valid_delayed;
     reg [7:0] rx_data_delayed;





    // ---- Signali for urr (maskiruyotsa v  CRC-regime) ----
    wire        rx_valid_to_urr;
    wire [7:0]  rx_data_to_urr;
    wire        rx_error_to_urr;

    assign rx_valid_to_urr = crc_running ? 1'b0 : rx_valid;
    assign rx_data_to_urr  = crc_running ? 8'd0  : rx_data;
    assign rx_error_to_urr = crc_running ? 1'b0 : rx_error;

    // Multiplexer for urr:
    assign start = crc_running ? start_urr : start_bram;   // start_bram из bram
    assign cmd   = crc_running ? cmd_urr   : cmd_bram;     // cmd_bram из bram

    // ---- Instansi modulei ----
    uart_tx u_tx (
        .clk   (sys_clk),
        .rst_n (rst_n),
        .start (tx_start),
        .data  (tx_data),
        .busy  (tx_busy),
        .tx    (tx)
    );

    uart_rx u_rx (
        .clk   (sys_clk),
        .rst_n (rst_n),
        .rx    (rx),
        .data  (rx_data),
        .valid (rx_valid),
        .error (rx_error)
    );


        // Instans urr_crc
    urr_crc u_urr_crc (
        .clk       (sys_clk),
        .rst_n     (rst_n),
        .start_crc  (start_crc_impulse),
       // .crc_enable(crc_mode_enable),   // из bram (бит 2 reg_ctrl)
        .rx_valid  (rx_valid),
        .rx_data   (rx_data),
        .rx_error  (rx_error),
        .tx_busy   (tx_busy),
        .urr_done  (done),
        .urr_error (error),
        .start_urr (start_urr),
        .cmd_urr   (cmd_urr),
        .crc_result(crc_result),
        .crc_done  (crc_done),
        .crc_running(crc_running)
    );




    urr u_urr (
        .clk      (sys_clk),
        .rst_n    (rst_n),
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
        .flag_crc(),
        .crc_result()
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
        
        .module_enable (),
        .start_crc(start_crc_impulse),   // vihod impulsa

        .crc_result_i(crc_result),   // от urr_crc
        .crc_done_i(crc_done)    // от urr_crc
    
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