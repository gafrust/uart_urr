module urr_uart_rx (
    input  wire       clk,
    input  wire       rst_i,
   (* DONT_TOUCH = "yes" *)  (* IOB = "TRUE" *) input  wire       rx,
   (* DONT_TOUCH = "yes" *)  (* IOB = "TRUE" *) input  wire       busy,
   (* DONT_TOUCH = "yes" *)  output reg  [7:0] data,
   (* DONT_TOUCH = "yes" *)  output wire       valid,
   (* DONT_TOUCH = "yes" *)  output wire        error
);

    localparam BAUD_RATE = 115200;
    localparam CLK_FREQ  = 60_000_000;
    localparam BAUD_CNT  = CLK_FREQ / BAUD_RATE;

   (* DONT_TOUCH = "yes" *)  reg [15:0] baud_cnt;
   (* DONT_TOUCH = "yes" *)  reg [3:0]  bit_cnt;
   (* DONT_TOUCH = "yes" *)  reg [8:0]  shift_reg;
   (* DONT_TOUCH = "yes" *)  reg rx_sync1, rx_sync2;
   (* DONT_TOUCH = "yes" *)  reg rx_falling;
   (* DONT_TOUCH = "yes" *)  reg receiving;
   (* DONT_TOUCH = "yes" *)  (* SRL_STYLE = "register" *) reg valid_reg;
   (* DONT_TOUCH = "yes" *)  reg error_reg;
   (* DONT_TOUCH = "yes" *)  reg fft_rx;
   (* DONT_TOUCH = "yes" *)  reg busy_d;   // NEW: zaderganii busy for settling

    assign valid = valid_reg;
    assign error = error_reg;

    // Pervii triger sinhronizatora (IOB)
    always @(posedge clk) begin
        fft_rx <= rx;
    end

    // NEW: zaderganii busy - ispolzuetsa for settling posle snatia TX
    always @(posedge clk) begin
        if (rst_i) busy_d <= 1'b0;
        else       busy_d <= busy;
    end

    // MOD: sinhronizator rabotaet vsegda 
   
    always @(posedge clk) begin
        if (rst_i) begin
            rx_sync1   <= 1'b1;
            rx_sync2   <= 1'b1;
            rx_falling <= 1'b0;
        end else begin
            rx_sync1 <= fft_rx;
            rx_sync2 <= rx_sync1;

            // Front detektiruetsa tolko kogda TX tochno zavershen +1 takt 
            if (busy_d) begin
                rx_falling <= 1'b0;
            end else begin
                rx_falling <= rx_sync2 & ~rx_sync1;   // 1→0
            end
        end
    end

    // Priemnik baita
    always @(posedge clk) begin
        if (rst_i) begin
            receiving <= 0;
            baud_cnt <= 0; 
            bit_cnt <= 0;
            shift_reg <= 0; 
            valid_reg <= 0; 
            error_reg <= 0;
            data <= 0; 
        end else begin
            valid_reg <= 0;
            if (!receiving) begin
                if (rx_falling) begin
                    receiving <= 1; 
                    baud_cnt <= 0; 
                    bit_cnt <= 0;
                    error_reg <= 0; 
                end
            end else begin
                baud_cnt <= baud_cnt + 1;
                if (baud_cnt == BAUD_CNT/2) begin
                    if (bit_cnt >= 1 && bit_cnt <= 8)
                        shift_reg <= {rx_sync2, shift_reg[8:1]};
                    else if (bit_cnt == 9) begin
                               // even parity, как в TX
                         if (rx_sync2 != ^shift_reg[8:1])
                                error_reg <= 1'b1;
                         end
                            else if (bit_cnt == 10) begin
                         if (rx_sync2 == 1 && !error_reg) begin
                            data      <= shift_reg[8:1];
                            valid_reg <= 1;
                         end else begin
                            error_reg <= 1;
                         end
                        receiving <= 0;
                    end
                    bit_cnt <= bit_cnt + 1;
                end
                if (baud_cnt == BAUD_CNT-1) baud_cnt <= 0;
            end
        end
    end
endmodule







// module urr_uart_rx (
//     input  wire       clk,
//     input  wire       rst_i,
//    (* DONT_TOUCH = "yes" *)  (* IOB = "TRUE" *) input  wire       rx,
//    (* DONT_TOUCH = "yes" *)  (* IOB = "TRUE" *) input  wire       busy,
//    (* DONT_TOUCH = "yes" *)  output reg  [7:0] data,
//    (* DONT_TOUCH = "yes" *)  output wire       valid,
//    (* DONT_TOUCH = "yes" *)  output reg        error
// );

//     localparam BAUD_RATE = 115200;
//     localparam CLK_FREQ  = 60_000_000;
//     localparam BAUD_CNT  = CLK_FREQ / BAUD_RATE;

//    (* DONT_TOUCH = "yes" *)  reg [15:0] baud_cnt;
//    (* DONT_TOUCH = "yes" *)  reg [3:0]  bit_cnt;
//    (* DONT_TOUCH = "yes" *)  reg [8:0]  shift_reg;
//    (* DONT_TOUCH = "yes" *)  reg rx_sync1, rx_sync2;
//    (* DONT_TOUCH = "yes" *)  reg rx_falling;
//    (* DONT_TOUCH = "yes" *)  reg receiving;
//    (* DONT_TOUCH = "yes" *)  (* SRL_STYLE = "register" *) reg valid_reg;
//    (* DONT_TOUCH = "yes" *)  reg error_reg;
//    (* DONT_TOUCH = "yes" *)  reg parity;
//    (* DONT_TOUCH = "yes" *)  reg fft_rx;
//    (* DONT_TOUCH = "yes" *)  reg busy_d;   // NEW: zaderganii busy for settling

//     assign valid = valid_reg;

//     // Pervii triger sinhronizatora (IOB)
//     always @(posedge clk) begin
//         fft_rx <= rx;
//     end

//     // NEW: zaderganii busy - ispolzuetsa for settling posle snatia TX
//     always @(posedge clk) begin
//         if (rst_i) busy_d <= 1'b0;
//         else       busy_d <= busy;
//     end

//     // MOD: sinhronizator rabotaet vsegda 
   
//     always @(posedge clk) begin
//         if (rst_i) begin
//             rx_sync1   <= 1'b1;
//             rx_sync2   <= 1'b1;
//             rx_falling <= 1'b0;
//         end else begin
//             rx_sync1 <= fft_rx;
//             rx_sync2 <= rx_sync1;

//             // Front detektiruetsa tolko kogda TX tochno zavershen +1 takt 
//             if (busy_d) begin
//                 rx_falling <= 1'b0;
//             end else begin
//                 rx_falling <= rx_sync2 & ~rx_sync1;   // 1→0
//             end
//         end
//     end

//     // Priemnik baita
//     always @(posedge clk) begin
//         if (rst_i) begin
//             receiving <= 0;
//             baud_cnt <= 0; 
//             bit_cnt <= 0;
//             shift_reg <= 0; 
//             valid_reg <= 0; 
//             error_reg <= 0;
//             data <= 0; 
//             parity <= 1;
//         end else begin
//             valid_reg <= 0;
//             if (!receiving) begin
//                 if (rx_falling) begin
//                     receiving <= 1; 
//                     baud_cnt <= 0; 
//                     bit_cnt <= 0;
//                 end
//             end else begin
//                 baud_cnt <= baud_cnt + 1;
//                 if (baud_cnt == BAUD_CNT/2) begin
//                     if (bit_cnt >= 1 && bit_cnt <= 8)
//                         shift_reg <= {rx_sync2, shift_reg[8:1]};
//                     else if (bit_cnt == 10) begin
//                         if (rx_sync2 == 1) begin
//                             data <= shift_reg[8:1]; 
//                             valid_reg <= 1;
//                         end else  error_reg <= 1;
//                         receiving <= 0;
//                     end
//                     bit_cnt <= bit_cnt + 1;
//                 end
//                 if (baud_cnt == BAUD_CNT) baud_cnt <= 0;
//             end
//         end
//     end
// endmodule