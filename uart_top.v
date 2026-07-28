module uart_top (
    input  wire       clk,        // 50 Mhz
    input  wire       rst_n,      // sbros, aktivnii 0
    input  wire       start,      // zapusk obmena (izvne)
    input  wire [7:0] cmd,        // komanda dla otpravki

    output wire       tx,         // vihod UART (k pinu)
    input  wire       rx,         // vhod UART (s pina)

    output wire [23:0] freq,      // poluchennaya chastota
    output wire        done,      // uspeshnoe zavershenie
    output wire        error      // oshibka
);

    // ---- Vnutrennie signali dla soedinenia ----
    wire        tx_busy;
    wire        tx_start;    // ot urr k uart_tx
    wire [7:0]  tx_data;

    wire        rx_valid;
    wire [7:0]  rx_data;
    wire        rx_error;

    // ---- Instans peredatchika ----
    uart_tx u_tx (
        .clk   (clk),
        .rst_n (rst_n),
        .start (tx_start),   // ot urr
        .data  (tx_data),    // ot urr
        .busy  (tx_busy),    // k urr
        .tx    (tx)          // na vneshii vivod
    );

    // ---- Instans priemnika ----
    uart_rx u_rx (
        .clk   (clk),
        .rst_n (rst_n),
        .rx    (rx),         // s vneshnego vivoda
        .data  (rx_data),    // k urr
        .valid (rx_valid),   // k urr
        .error (rx_error)    // k urr
    );

    // ---- Instans upravlaushego modula ----
    urr u_urr (
        .clk      (clk),
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
        .error    (error)
    );

endmodule