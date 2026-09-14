// module uart_tx (
//     input  wire       clk,
//     input  wire       rst_n,
//     (* DONT_TOUCH = "yes" *) input  wire       start,      // импульс на отправку
//     (* DONT_TOUCH = "yes" *)input  wire [7:0] data,       // байт для отправки
//     (* DONT_TOUCH = "yes" *)output wire       busy,       // 1 – идёт передача
//     (* DONT_TOUCH = "yes" *)  (* IOB = "TRUE" *) output wire       tx
// );

//     localparam BAUD_RATE = 115200;
//     localparam CLK_FREQ  = 50_000_000;
//     localparam BAUD_CNT  = CLK_FREQ / BAUD_RATE; // ≈ 434

//     // Состояния
//     localparam IDLE   = 3'd0,
//                START_BIT = 3'd1,
//                DATA_BITS = 3'd2,
//                PARITY_BIT = 3'd3,
//                STOP_BIT = 3'd4;

//     (* DONT_TOUCH = "yes" *)reg [2:0] state, next_state;
//    (* DONT_TOUCH = "yes" *) reg [15:0] baud_cnt;
//    (* DONT_TOUCH = "yes" *) reg [2:0] bit_idx;        // 0..7
//    (* DONT_TOUCH = "yes" *) reg [7:0] shift_reg;
//     (* DONT_TOUCH = "yes" *)  (* IOB = "TRUE" *) reg       tx_reg;
//    (* DONT_TOUCH = "yes" *) reg       busy_reg;
//     (* DONT_TOUCH = "yes" *)reg       parity_bit;     // вычисленный бит чётности (even)

//     assign tx   = tx_reg;
//     assign busy = busy_reg;

//     // Чётная чётность: XOR всех бит данных
//     //reg even_parity = ^data;

//     // Комбинационная логика переходов
//     always @(*) begin
//         next_state = state;
//         case (state)
//             IDLE:       if (start) next_state = START_BIT;
//             START_BIT:  if (baud_cnt == BAUD_CNT - 1) next_state = DATA_BITS;
//             DATA_BITS:  if (baud_cnt == BAUD_CNT - 1) begin
//                             if (bit_idx == 3'd7) next_state = PARITY_BIT;
//                             else next_state = DATA_BITS;
//                         end
//             PARITY_BIT: if (baud_cnt == BAUD_CNT - 1) next_state = STOP_BIT;
//             STOP_BIT:   if (baud_cnt == BAUD_CNT - 1) next_state = IDLE;
//             default:    next_state = IDLE;
//         endcase
//     end

//     // Синхронная логика
//     always @(posedge clk or negedge rst_n) begin
//         if (!rst_n) begin
//             state      <= IDLE;
//             tx_reg     <= 1'b1;
//             busy_reg   <= 1'b0;
//             baud_cnt   <= 16'd0;
//             bit_idx    <= 3'd0;
//             shift_reg  <= 8'd0;
//             parity_bit <= 1'b0;
//         end else begin
            

//             // Управление счётчиком бодовой частоты
//             if (state != IDLE) begin
//                 if (baud_cnt == BAUD_CNT - 1) baud_cnt <= 16'd0;
//                 else baud_cnt <= baud_cnt + 1'b1;
//             end else begin
//                 baud_cnt <= 16'd0;
//             end

             

//             // Основная логика состояний
//             case (state)
//                 IDLE: begin
//                     tx_reg   <= 1'b1;
//                     busy_reg <= 1'b0;
//                     if (start) begin
//                         shift_reg  <= data;
//                         parity_bit <= ^data;//even_parity;
//                         bit_idx    <= 3'd0;
//                         busy_reg   <= 1'b1;
//                         tx_reg     <= 1'b0; // стартовый бит
//                     end
//                 end

//                 START_BIT: begin
//                     // Стартовый бит уже установлен, ждём окончания периода
//                     if (baud_cnt == BAUD_CNT - 1) begin
//                         // Переход к данным
//                     end
//                 end

//                 DATA_BITS: begin
//                     if (baud_cnt == BAUD_CNT - 1) begin
//                         tx_reg <= shift_reg[bit_idx]; // младший бит первым
//                         if (bit_idx == 3'd7) begin
//                             // все биты отправлены
//                         end else begin
//                             bit_idx <= bit_idx + 1'b1;
//                         end
//                     end
//                 end

//                 PARITY_BIT: begin
//                     if (baud_cnt == BAUD_CNT - 1) begin
//                         tx_reg <= parity_bit; // бит чётности
//                     end
//                 end

//                 STOP_BIT: begin
//                     if (baud_cnt == BAUD_CNT - 1) begin
//                         tx_reg   <= 1'b1;
//                         busy_reg <= 1'b0;
//                     end
//                 end
//             endcase

//             state <= next_state;
//         end
//     end
// endmodule









module uart_tx (
    input  wire       clk,
    input  wire       rst_n,
   (* DONT_TOUCH = "yes" *)  input  wire       start,      // impuls na otpravku
   (* DONT_TOUCH = "yes" *)  input  wire [7:0] data,       // bait dla otpravki
   (* DONT_TOUCH = "yes" *)  output wire       busy,       // 1 – idet peredacha
   (* DONT_TOUCH = "yes" *)  (* IOB = "TRUE" *) output wire       tx
);

    localparam BAUD_RATE = 115200;
    localparam CLK_FREQ  = /*50_000_000*/ 120_000_000;
    localparam BAUD_CNT  = CLK_FREQ / BAUD_RATE; // ≈ 434

   (* DONT_TOUCH = "yes" *)  reg [15:0] baud_cnt;
   (* DONT_TOUCH = "yes" *)  reg [3:0] bit_cnt;
   (* DONT_TOUCH = "yes" *)  reg [7:0] shift_reg;
   (* DONT_TOUCH = "yes" *)  (* IOB = "TRUE" *) reg tx_reg;
   (* DONT_TOUCH = "yes" *)  (* SRL_STYLE = "register" *) reg busy_reg;
   (* DONT_TOUCH = "yes" *)  reg parity;

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
                    end else if (bit_cnt == 8) begin
                        tx_reg <= parity; // bit pariteta
                    end else if (bit_cnt == 9) begin
                        tx_reg <= 1; // стоп-бит
                    end else if (bit_cnt == 10) begin
                        busy_reg <= 0; // zaversheno
                    end
                end
            end
        end
    end
endmodule