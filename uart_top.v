module uart_top (
    input  wire       sys_clk,      // 50 МГц
    input  wire       rst_n,
    output wire       tx,           // UART TX
    input  wire       rx,           // UART RX
    output wire       led,          // светодиод

    // AXI BRAM interface (подключение к bram_interface_urr)
    input  wire        axi_en_i,
    input  wire [31:0] axi_data_i,
    input  wire        axi_we_i,
    input  wire [31:0] axi_addr_i,
    output wire        axi_vd_o,
    output wire [31:0] axi_data_o
);

    // ---- Внутренние сигналы ----
    wire       tx_busy;
    wire       tx_start;
    wire [7:0] tx_data;
    wire       rx_valid;
    wire [7:0] rx_data;
    wire       rx_error;

    // Сигналы между bram_interface_urr и urr
    wire        start;
    wire [7:0]  cmd;
    wire        done;
    wire        error;
    wire [23:0] freq;

    // ---- Светодиод ----
    reg [31:0] led_cnt;
    reg        led_reg;
    assign led = led_reg;

    // ---- ILA clock divider (не используется, оставлен для совместимости) ----
    reg [31:0] clk_div_cnt;
    reg        ila_clk;
    localparam DIV_FACTOR = 50;

    // ---- Инстансы модулей ----
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

    urr u_urr (
        .clk      (sys_clk),
        .rst_n    (rst_n),
        .start    (start),
        .cmd      (cmd),
        .tx_busy  (tx_busy),
        .tx_start (tx_start),
        .tx_data  (tx_data),
        .rx_valid (rx_valid),
        .rx_data  (rx_data),
        .rx_error (rx_error),
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
        .uart_start (start),
        .uart_cmd   (cmd),
        .uart_done  (done),
        .uart_error (error),
        .uart_freq  (freq),
        
        .module_enable ()
        
    );

    // ---- Генерация ila_clk (не используется, но оставлено) ----
    always @(posedge sys_clk or negedge rst_n) begin
        if (!rst_n) begin
            clk_div_cnt <= 0;
            ila_clk     <= 0;
        end else begin
            if (clk_div_cnt < DIV_FACTOR/2 - 1) begin
                clk_div_cnt <= clk_div_cnt + 1;
            end else begin
                clk_div_cnt <= 0;
                ila_clk     <= ~ila_clk;
            end
        end
    end

    // ---- Мигание светодиода ----
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










// module uart_top (
//     input  wire       sys_clk,      // 50 МГц
//     input  wire       rst_n,
//     output wire       tx,           // UART TX
//     input  wire       rx,           // UART RX
//     output wire       led,           // светодиод для индикации работы

//     input wire axi_en_i,
//     input wire [0:7] axi_data_i,
//     input wire axi_we_i,
//     input wire [0:7] axi_addr_i,
//     output reg axi_vd_o,
//     output reg [0:7] axi_data_o
// );

//     // ---- Внутренние сигналы ----
//     wire       tx_busy;
//     wire      tx_start;
//     wire [7:0] tx_data;
//     wire       rx_valid;
//     wire [7:0] rx_data;
//     wire       rx_error;

//     reg [5:0]  cmd_cnt;          // 0..5
//     reg [31:0] timer_cnt;
//    // reg        start_internal;
//     reg [7:0]  cmd_byte;
//     reg timer_done;
//     reg tx_busy_prev;

//     wire [23:0] freq;
//     wire        done;
//     wire        error;

//     // ---- Светодиод ----
//     reg [31:0] led_cnt;
//     reg        led_reg;
//     assign led = led_reg;

//     // ---- Пониженная частота для ILA (1 МГц) ----
//     reg [31:0] clk_div_cnt;
//     reg        ila_clk;
//     localparam DIV_FACTOR = 50;   // 50_000_000 / 50 = 1_000_000 Гц

//     // ---- Инстансы модулей ----
//     uart_tx u_tx (
//         .clk   (sys_clk),
//         .rst_n (rst_n),
//         .start (tx_start),
//         .data  (tx_data),
//         .busy  (tx_busy),
//         .tx    (tx)
//     );

//     uart_rx u_rx (
//         .clk   (sys_clk),
//         .rst_n (rst_n),
//         .rx    (rx),
//         .data  (rx_data),
//         .valid (rx_valid),
//         .error (rx_error)
//     );

//     urr u_urr (
//         .clk      (sys_clk),
//         .rst_n    (rst_n),
//         .start    (start),
//         .cmd      (cmd),
//         .tx_busy  (tx_busy),
//         .tx_start (tx_start),
//         .tx_data  (tx_data),
//         .rx_valid (rx_valid),
//         .rx_data  (rx_data),
//         .rx_error (rx_error),
//         .freq     (freq),
//         .done     (done),
//         .error    (error)
//     );

// bram_interface_urr bram (
//     .clk_i           (sys_clk),
//     .rst_i           (rst_n),        
    
//     // AXI 
//      .axi_en_i(axi_en_i),
//      .axi_data_i(axi_data_i),
//      .axi_we_i(axi_we_i),
//      .axi_addr_i(axi_addr_i),
//      .axi_vd_o(axi_vd_o),
//      .axi_data_o(axi_data_o),
     


//     .uart_start      (start),
//     .uart_cmd        (cmd),
//     .uart_done       (done),
//     .uart_error      (error),
//     .uart_freq       (freq)
// );

//     // ---- Генерация ila_clk (1 МГц) ----
//     always @(posedge sys_clk or negedge rst_n) begin
//         if (!rst_n) begin
//             clk_div_cnt <= 0;
//             ila_clk     <= 0;
//         end else begin
//             if (clk_div_cnt < DIV_FACTOR/2 - 1) begin
//                 clk_div_cnt <= clk_div_cnt + 1;
//             end else begin
//                 clk_div_cnt <= 0;
//                 ila_clk     <= ~ila_clk;
//             end
//         end
//     end


// always @(posedge sys_clk or negedge rst_n) begin
//     if (!rst_n) begin
//         // cmd_cnt     <= 6'd0;
//         // timer_cnt   <= 32'd0;
//         // timer_done  <= 1'b0;
//         // tx_start    <= 1'b0;
//         // tx_data     <= 8'd0;
//         // tx_busy_prev <= 1'b0;
//         led_cnt     <= 32'd0;
//         led_reg     <= 1'b0;
//     end else begin
      
//         if (led_cnt < 50_000_000 - 1) begin
//             led_cnt <= led_cnt + 1;
//         end else begin
//             led_cnt <= 32'd0;
//             led_reg <= ~led_reg;
//         end
//     end
// end

// endmodule
