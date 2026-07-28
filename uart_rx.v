module uart_rx (
    input  wire       clk,
    input  wire       rst_n,
    input  wire       rx,
    output reg  [7:0] data,
    output wire       valid,       // импульс при приёме байта
    output reg        error        // ошибка стоп-бита (не используется)
);

    localparam BAUD_RATE = 115200;
    localparam CLK_FREQ  = 50_000_000;
    localparam BAUD_CNT  = CLK_FREQ / BAUD_RATE;

    reg [15:0] baud_cnt;
    reg [3:0] bit_cnt;
    reg [8:0] shift_reg;
    reg rx_sync1, rx_sync2;
    reg rx_falling;
    reg receiving;
    reg valid_reg;
    reg error_reg;
    reg parity;

    assign valid = valid_reg;

    // Синхронизация и детектор спада
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            rx_sync1 <= 1;
            rx_sync2 <= 1;
            rx_falling <= 0;
            parity <= 1;
        end else begin
            rx_sync1 <= rx;
            rx_sync2 <= rx_sync1;
            rx_falling <= rx_sync2 & ~rx_sync1; // детектор 1→0
        end
    end

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            receiving <= 0;
            baud_cnt <= 0;
            bit_cnt <= 0;
            shift_reg <= 0;
            valid_reg <= 0;
            error_reg <= 0;
            data <= 0;
        end else begin
            valid_reg <= 0; // импульс на один такт

            if (!receiving) begin
                if (rx_falling) begin
                    receiving <= 1;
                    baud_cnt <= 0;
                    bit_cnt <= 0;
                end
            end else begin
                baud_cnt <= baud_cnt + 1;
                if (baud_cnt == BAUD_CNT/2) begin
                    // середина бита — выборка
                    if (bit_cnt == 0) begin
                        // стартовый бит – должен быть 0, не проверяем
                    end else if (bit_cnt >= 1 && bit_cnt <= 8) begin
                        shift_reg <= {rx_sync2, shift_reg[8:1]};
                       // parity <= rx_sync2;
                    end else if (bit_cnt == 9) begin
                          //parity <= rx_sync2;
                    end else  if (bit_cnt == 10) begin 
                        // стоп-бит
                        if (rx_sync2 == 1) begin
                            data <= shift_reg[8:1];
                            valid_reg <= 1;
                        end else begin
                            error_reg <= 1;
                        end
                        receiving <= 0;
                    end
                    bit_cnt <= bit_cnt + 1;
                end
                if (baud_cnt == (BAUD_CNT/2)+30) begin
                if (bit_cnt == 9) begin
                          parity <= rx_sync2;
                    end
                end
                if (baud_cnt == BAUD_CNT) begin
                    baud_cnt <= 0;
                end
            end
        end
    end
endmodule