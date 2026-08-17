module uart_rx (
    input  wire       clk,
    input  wire       rst_n,
   (* IOB = "TRUE" *) input  wire       rx,
    output reg  [7:0] data,
    output wire       valid,       // impuls pri prieme baita
    output reg        error        // oshibka stop bita (ne ispolzuem)
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

    // Sinhronizacia i detektor spada
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            rx_sync1 <= 1;
            rx_sync2 <= 1;
            rx_falling <= 0;
            parity <= 1;
        end else begin
            rx_sync1 <= rx;
            rx_sync2 <= rx_sync1;
            rx_falling <= rx_sync2 & ~rx_sync1; // detektor 1→0
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
            valid_reg <= 0; // impuls na odin takt

            if (!receiving) begin
                if (rx_falling) begin
                    receiving <= 1;
                    baud_cnt <= 0;
                    bit_cnt <= 0;
                end
            end else begin
                baud_cnt <= baud_cnt + 1;
                if (baud_cnt == BAUD_CNT/2) begin
                    // seredina bita — viborka
                    if (bit_cnt == 0) begin
                        // startovii bit – dolgen bit 0, ne proveraem
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