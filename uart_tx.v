module uart_tx (
    input  wire       clk,
    input  wire       rst_n,
    input  wire       start,      // impuls na otpravku
    input  wire [7:0] data,       // bait dla otpravki
    output wire       busy,       // 1 – idet peredacha
    (* IOB = "TRUE" *) output wire       tx
);

    localparam BAUD_RATE = 115200;
    localparam CLK_FREQ  = 50_000_000;
    localparam BAUD_CNT  = CLK_FREQ / BAUD_RATE; // ≈ 434

    reg [15:0] baud_cnt;
    reg [3:0] bit_cnt;
    reg [7:0] shift_reg;
    (* IOB = "TRUE" *) reg tx_reg;
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
                tx_reg <= 0;          // startovii bit
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
                        // startovii bit uge otpravlen, dalshe dannie
                        tx_reg <= shift_reg[0];
                        shift_reg <= shift_reg >> 1;
                    end else if (bit_cnt >= 1 && bit_cnt <= 8) begin
                        // биты данных
                        tx_reg <= shift_reg[0];
                        shift_reg <= shift_reg >> 1;
                    end else if (bit_cnt == 9) begin
                        tx_reg <= parity; // bit pariteta
                    end else if (bit_cnt == 10) begin
                        tx_reg <= 1; // стоп-бит
                    end else if (bit_cnt == 11) begin
                        busy_reg <= 0; // zaversheno
                    end
                end
            end
        end
    end
endmodule