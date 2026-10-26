module urr_uart_rx (
    input  wire       clk,
    input  wire       rst_n,
   (* DONT_TOUCH = "yes" *)  (* IOB = "TRUE" *) input  wire       rx,
   (* DONT_TOUCH = "yes" *)  output reg  [7:0] data,
   (* DONT_TOUCH = "yes" *)  output wire       valid,       // impuls pri prieme baita
   (* DONT_TOUCH = "yes" *)  output reg        error        // oshibka stop bita (ne ispolzuem)
);

    localparam BAUD_RATE = 115200;
    localparam CLK_FREQ  = 60_000_000; /*50_000_000*/  //120_000_000;
    localparam BAUD_CNT  = CLK_FREQ / BAUD_RATE;

   (* DONT_TOUCH = "yes" *)  reg [15:0] baud_cnt;
   (* DONT_TOUCH = "yes" *)  reg [3:0] bit_cnt;
   (* DONT_TOUCH = "yes" *)  reg [8:0] shift_reg;
   (* DONT_TOUCH = "yes" *) reg rx_sync1, rx_sync2;
   (* DONT_TOUCH = "yes" *)  reg rx_falling;
   (* DONT_TOUCH = "yes" *)  reg receiving;
   (* DONT_TOUCH = "yes" *)  (* SRL_STYLE = "register" *) reg valid_reg;
   (* DONT_TOUCH = "yes" *)  reg error_reg;
   (* DONT_TOUCH = "yes" *)   reg parity;

    assign valid = valid_reg;
   

    // Sinhronizacia i detektor spada
    //always @(posedge clk or negedge rst_n) begin
    always @(posedge clk) begin
        if (rst_n) begin
            rx_sync1 <= 1;
            rx_sync2 <= 1;
            rx_falling <= 0;
           // parity <= 1;
        end else begin
            rx_sync1 <= rx;
            rx_sync2 <= rx_sync1;
            rx_falling <= rx_sync2 & ~rx_sync1; // detektor 1→0
        end
    end

    //always @(posedge clk or negedge rst_n) begin
    always @(posedge clk) begin
        if (rst_n) begin
            receiving <= 0;
            baud_cnt <= 0;
            bit_cnt <= 0;
            shift_reg <= 0;
            valid_reg <= 0;
            error_reg <= 0;
            data <= 0;
            parity <= 1;
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
                        //shift_reg <= {rx, shift_reg[8:1]};
                       // parity <= rx_sync2;
                    end else if (bit_cnt == 9) begin
                          //parity <= rx_sync2;
                    end else  if (bit_cnt == 10) begin 
                        // стоп-бит
                        if (rx_sync2 == 1) begin
                       // if (rx == 1) begin
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
                          //parity <= rx;
                    end
                end
                if (baud_cnt == BAUD_CNT) begin
                    baud_cnt <= 0;
                end
            end
        end
    end
endmodule
