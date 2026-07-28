module urr (
    input  wire       clk,
    input  wire       rst_n,
    input  wire       start,
    input  wire [7:0] cmd,

    input  wire       tx_busy,
    output reg        tx_start,
    output reg  [7:0] tx_data,

    input  wire       rx_valid,
    input  wire [7:0] rx_data,
    input  wire       rx_error,

    output reg  [23:0] freq,
    output reg         done,
    output reg         error
);

    localparam TIMEOUT_LIMIT = 250000; // 5 ms pri 50 Mhz

    localparam IDLE     = 3'd0,
               TX_WAIT  = 3'd1,
               RX_WAIT  = 3'd2,
               RX_DATA  = 3'd3,
               DONE     = 3'd4,
               ERROR_ST = 3'd5;

    reg [2:0] state, next_state;

    reg [7:0]  cmd_reg;
    reg [23:0] freq_reg;
    reg [1:0]  byte_cnt;
    reg [31:0] timeout_cnt;
    reg [7:0] rx_data_latch;

    // ---- Kombinacionnaya logika perehodov ----
    always @(*) begin
        next_state = state;
        case (state)
            IDLE: begin
                if (start)
                    next_state = TX_WAIT;
            end
            TX_WAIT: begin
                if (!tx_busy)
                    next_state = RX_WAIT;
            end
            RX_WAIT: begin
                //if (rx_valid && !rx_error)
                if (rx_valid)
                    next_state = RX_DATA;
                 if (timeout_cnt >= TIMEOUT_LIMIT)
                      next_state = ERROR_ST;
            end
            RX_DATA: begin
                 if (byte_cnt == 2'd3)
                  next_state = DONE;
                 else
                  next_state = RX_DATA;
                 if (timeout_cnt >= TIMEOUT_LIMIT)
                  next_state = ERROR_ST;
end
            DONE: begin
                next_state = IDLE;
            end
            ERROR_ST: begin
                next_state = IDLE;
            end
            default: next_state = IDLE;
        endcase
    end

always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        rx_data_latch <= 8'd0;
    end else if (rx_valid) begin
        rx_data_latch <= rx_data;   // защёлкиваем данные в момент valid
    end
end






    // ---- Sinhronnaya logika (po tekushemu sostoyaniu) ----
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            state        <= IDLE;
            cmd_reg      <= 8'd0;
            freq_reg     <= 24'd0;//32'd0;
            byte_cnt     <= 2'd0;
            timeout_cnt  <= 32'd0;
            tx_start     <= 1'b0;
            tx_data      <= 8'd0;
            freq         <= 24'd0;
            done         <= 1'b0;
            error        <= 1'b0;
            //rx_data_latch <= 8'd0;
        end else begin
            // Sbros impulsnih vihodov po umolchaniu
            tx_start <= 1'b0;
            done     <= 1'b0;
            error    <= 1'b0;

            // Deistvia v zavisimosti ot tekushego sostoyania
            case (state)
                IDLE: begin
                    if (start) begin
                        cmd_reg  <= cmd;
                        tx_data  <= cmd;
                        tx_start <= 1'b1;
                    end
                end

                TX_WAIT: begin
                    // Ogidaem osvobogdenia peredatchika
                end

                RX_WAIT: begin
                    // Sbros taimauta pri vhode v eto sostoyanie
                    if (next_state == RX_WAIT && state != RX_WAIT) begin
                        timeout_cnt <= 32'd0;
                    end else begin
                        if (timeout_cnt < TIMEOUT_LIMIT)
                            timeout_cnt <= timeout_cnt + 1;
                    end
                end

                RX_DATA: begin
                    if (rx_valid) begin
                        // Sbros taimauta
                        timeout_cnt <= 32'd0;
                        // Sohranaem bait v freq_reg (MSB first)
                        case (byte_cnt)
                            2'd0: begin
                                  if(byte_cnt == rx_data_latch[7:6]) freq_reg[5:0]   <= rx_data_latch[5:0]; else error <= 1'b1; 
                                  //$display("byte_cnt == %2b, rx_data_latch[7:0] = %08b", byte_cnt, rx_data_latch);
                                  end
                            2'd1: begin
                                  if(byte_cnt == rx_data_latch[7:6]) freq_reg[11:6]  <= rx_data_latch[5:0]; else error <= 1'b1;
                                  //$display("byte_cnt == %2b, rx_data_latch[7:0] = %08b", byte_cnt, rx_data_latch);
                                  end
                            2'd2: begin
                                  if(byte_cnt == rx_data_latch[7:6]) freq_reg[17:12] <= rx_data_latch[5:0]; else error <= 1'b1;
                                  //$display("byte_cnt == %2b, rx_data_latch[7:0] = %08b", byte_cnt, rx_data_latch);
                                  end
                            2'd3: begin
                                  if(byte_cnt == rx_data_latch[7:6]) freq_reg[23:18] <= rx_data_latch[5:0]; else error <= 1'b1;
                                 // $display("byte_cnt == %2b, rx_data_latch[7:0] = %08b", byte_cnt, rx_data_latch);
                                  end
                            // 2'd0: freq_reg[31:24] <= rx_data;
                            // 2'd1: freq_reg[23:16] <= rx_data;
                            // 2'd2: freq_reg[15:8]  <= rx_data;
                            // 2'd3: freq_reg[7:0]   <= rx_data;
                        endcase
                        // Uvelichivaem schetchik, esli eto ne  4-i bait
                        if (byte_cnt < 2'd3)
                            byte_cnt <= byte_cnt + 1;
                    end else begin
                        // Schitaem timeout, esli net baita
                        if (timeout_cnt < TIMEOUT_LIMIT)
                            timeout_cnt <= timeout_cnt + 1;
                    end
                end

                DONE: begin
                    freq <= freq_reg;
                    done <= 1'b1;
                    // Sbros registrov dla sledujuchego zapuska
                    byte_cnt    <= 2'd0;
                    freq_reg    <= 32'd0;
                    timeout_cnt <= 32'd0;
                end

                ERROR_ST: begin
                    error <= 1'b1;
                    byte_cnt    <= 2'd0;
                    freq_reg    <= 32'd0;
                    timeout_cnt <= 32'd0;
                end

                default: ;
            endcase

            // Perehod v sledujushee sostoyanie
            state <= next_state;
        end
    end

endmodule








// module urr (
//     input  wire       clk,
//     input  wire       rst_n,
//     input  wire       start,
//     input  wire [7:0] cmd,

//     input  wire       tx_busy,
//     output reg        tx_start,
//     output reg  [7:0] tx_data,

//     input  wire       rx_valid,
//     input  wire [7:0] rx_data,
//     input  wire       rx_error,

//     output reg  [31:0] freq,
//     output reg         done,
//     output reg         error
// );

//     // ---- Параметры таймаутов ----
//     // 5 мс при 50 МГц = 250 000 тактов
//     localparam TIMEOUT_LIMIT = 250000;
//     // Для межбайтового таймаута можно использовать тот же лимит,
//     // либо меньше, например 1 мс = 50 000
//     // Для простоты используем общий таймаут, сбрасываемый при каждом приёме.

//     // ---- Состояния ----
//     localparam IDLE     = 3'd0;
//     localparam TX_WAIT  = 3'd1;
//     localparam RX_WAIT  = 3'd2;
//     localparam RX_DATA  = 3'd3;
//     localparam DONE     = 3'd4;
//     localparam ERROR_ST = 3'd5;

//     reg [2:0] state, next_state;

//     // ---- Внутренние регистры ----
//     reg [7:0]  cmd_reg;         // сохранённая команда
//     reg [31:0] freq_reg;        // накопление принятых байт
//     reg [1:0]  byte_cnt;        // счётчик принятых байт (0..3)
//     reg [31:0] timeout_cnt;     // счётчик таймаута
//     reg        tx_start_reg;    // формирование импульса
//     reg        done_reg, error_reg;

//     // ---- Комбинационная логика для next_state ----
//     always @(*) begin
//         next_state = state;
//         case (state)
//             IDLE: begin
//                 if (start)
//                     next_state = TX_WAIT;
//             end
//             TX_WAIT: begin
//                 if (!tx_busy)       // передатчик освободился
//                     next_state = RX_WAIT;
//             end
//             RX_WAIT: begin
//                 if (rx_valid) //&& !rx_error)
//                     next_state = RX_DATA;
//                 else if (timeout_cnt >= TIMEOUT_LIMIT)
//                     next_state = ERROR_ST;
//             end
//             RX_DATA: begin
//                 if (rx_error)
//                     next_state = ERROR_ST;
//                 else if (rx_valid) begin
//                     if (byte_cnt == 3)  // это был 4-й байт (byte_cnt считаем 0..3)
//                         next_state = DONE;
//                     else
//                         next_state = RX_DATA; // остаёмся ждать следующий
//                 end else if (timeout_cnt >= TIMEOUT_LIMIT) begin
//                     next_state = ERROR_ST;   // межбайтовый таймаут
//                 end
//             end
//             DONE: begin
//                 next_state = IDLE;
//             end
//             ERROR_ST: begin
//                 next_state = IDLE;
//             end
//             default: next_state = IDLE;
//         endcase
//     end

//     // ---- Синхронная логика (регистры) ----
//     always @(posedge clk or negedge rst_n) begin
//         if (!rst_n) begin
//             state        <= IDLE;
//             cmd_reg      <= 8'd0;
//             freq_reg     <= 32'd0;
//             byte_cnt     <= 2'd0;
//             timeout_cnt  <= 32'd0;
//             tx_start_reg <= 1'b0;
//             done_reg     <= 1'b0;
//             error_reg    <= 1'b0;
//             tx_data      <= 8'd0;
//             tx_start     <= 1'b0;
//             freq         <= 32'd0;
//             done         <= 1'b0;
//             error        <= 1'b0;
//         end else begin
//             // Сброс выходных импульсов по умолчанию
//             tx_start <= 1'b0;
//             done     <= 1'b0;
//             error    <= 1'b0;

//             // Переход состояния
//             state <= next_state;

//             case (next_state)
//                 IDLE: begin
//                     // Ничего не делаем, ждём start
//                     if (state == DONE) begin
//                         // завершили успешно
//                         done_reg <= 1'b1;
//                     end else if (state == ERROR_ST) begin
//                         error_reg <= 1'b1;
//                     end
//                 end

//                 TX_WAIT: begin
//                     // Сохраняем команду и запускаем передачу (один такт)
//                     if (state == IDLE && start) begin
//                         cmd_reg  <= cmd;
//                         tx_data  <= cmd;
//                         tx_start <= 1'b1;   // импульс
//                     end
//                 end

//                 RX_WAIT: begin
//                     // При переходе из TX_WAIT в RX_WAIT сбрасываем счётчик таймаута
//                     if (state == TX_WAIT && !tx_busy) begin
//                         timeout_cnt <= 32'd0;
//                     end else begin
//                         // считаем таймаут
//                         if (timeout_cnt < TIMEOUT_LIMIT)
//                             timeout_cnt <= timeout_cnt + 1;
//                     end
//                     // При приёме байта переходим в RX_DATA, там обработаем
//                 end

//                 RX_DATA: begin
//                     // Если пришёл байт и нет ошибки
//                     //if (rx_valid && !rx_error) begin
//                     if (rx_valid) begin
//                         // Сбрасываем таймаут
//                         timeout_cnt <= 32'd0;
//                         // Сохраняем байт в freq_reg (первый байт – старший)
//                         case (byte_cnt)
//                             2'd0: freq_reg[31:24] <= rx_data;
//                             2'd1: freq_reg[23:16] <= rx_data;
//                             2'd2: freq_reg[15:8]  <= rx_data;
//                             2'd3: freq_reg[7:0]   <= rx_data;
//                         endcase
//                         // Увеличиваем счётчик, если не последний
//                         if (byte_cnt < 2'd3)
//                             byte_cnt <= byte_cnt + 1;
//                         // если последний – перейдём в DONE по состоянию
//                     end else begin
//                         // Если не пришёл байт – считаем таймаут
//                         if (timeout_cnt < TIMEOUT_LIMIT)
//                             timeout_cnt <= timeout_cnt + 1;
//                     end
//                 end

//                 DONE: begin
//                     // Выдаём результат и импульс done
//                     freq  <= freq_reg;
//                     done  <= 1'b1;
//                     // Сбросим счётчики для следующего запуска
//                     byte_cnt    <= 2'd0;
//                     freq_reg    <= 32'd0;
//                     timeout_cnt <= 32'd0;
//                 end

//                 ERROR_ST: begin
//                     error <= 1'b1;
//                     // Сброс внутренних регистров
//                     byte_cnt    <= 2'd0;
//                     freq_reg    <= 32'd0;
//                     timeout_cnt <= 32'd0;
//                 end

//                 default: ;
//             endcase
//         end
//     end

// endmodule