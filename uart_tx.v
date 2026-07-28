module uart_tx (
    input  wire       clk,
    input  wire       rst_n,
    input  wire       start,      // импульс на отправку
    input  wire [7:0] data,       // байт для отправки
    output wire       busy,       // 1 – идёт передача
    output wire       tx
);

    localparam BAUD_RATE = 115200;
    localparam CLK_FREQ  = 50_000_000;
    localparam BAUD_CNT  = CLK_FREQ / BAUD_RATE; // ≈ 434

    reg [15:0] baud_cnt;
    reg [3:0] bit_cnt;
    reg [7:0] shift_reg;
    reg tx_reg;
    reg busy_reg;
    reg parity;

    assign tx = tx_reg;
    assign busy = busy_reg;

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            tx_reg <= 1;
            busy_reg <= 0;
            baud_cnt <= 0;
            bit_cnt <= 0;
        end else begin
            if (start && !busy_reg) begin
                busy_reg <= 1;
                tx_reg <= 0;          // стартовый бит
                shift_reg <= data;
                parity <= ^data;
                bit_cnt <= 0;
                baud_cnt <= 0;
            end else if (busy_reg) begin
                baud_cnt <= baud_cnt + 1;
                if (baud_cnt == BAUD_CNT - 1) begin
                    baud_cnt <= 0;
                    bit_cnt <= bit_cnt + 1;
                    if (bit_cnt == 0) begin
                        // стартовый бит уже отправлен, дальше данные
                        tx_reg <= shift_reg[0];
                        shift_reg <= shift_reg >> 1;
                    end else if (bit_cnt >= 1 && bit_cnt <= 8) begin
                        // биты данных
                        tx_reg <= shift_reg[0];
                        shift_reg <= shift_reg >> 1;
                    end else if (bit_cnt == 9) begin
                        tx_reg <= parity; // бит паритета
                    end else if (bit_cnt == 10) begin
                        tx_reg <= 1; // стоп-бит
                    end else if (bit_cnt == 11) begin
                        busy_reg <= 0; // завершено
                    end
                end
            end
        end
    end
endmodule