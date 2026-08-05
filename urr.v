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
    output reg         error,
    output wire        dir,   // Управляющий вывод для RE DE max487 

    input  wire       flag_crc,        // новый вход
    output reg  [31:0] crc_result      // финальное CRC (опционально)
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

    reg tx_busy_prev;
    reg        dir_reg;
    reg rx_pending;

    reg [31:0] crc_reg;
    wire [31:0] crc_out;


   crc u_crc (
    .crcIn (crc_reg),
    .data  (rx_data_latch),   // или data_in, если вы его используете
    .crcOut(crc_out)
    );



    // ---- Kombinacionnaya logika perehodov ----
    always @(*) begin
        next_state = state;
        case (state)
            IDLE: begin
                if (start)
                    next_state = TX_WAIT;
            end
            TX_WAIT: begin
                if (!tx_busy)//tx_busy_prev && 
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
        rx_data_latch <= rx_data;   // zashelkivaem v moment valid
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
            dir_reg      <= 1'b0;
            rx_pending <= 1'b0;
            crc_reg <= 32'hF5F5F5F5;   // начальное значение для CRC32
            crc_result <= 32'd0;
            //rx_data_latch <= 8'd0;
        end else begin
            // Sbros impulsnih vihodov po umolchaniu
            tx_start <= 1'b0;
            done     <= 1'b0;
            error    <= 1'b0;
            tx_busy_prev <= tx_busy;
            // ---- Защёлка rx_valid ----
            if (rx_valid) rx_pending <= 1'b1;

            // Deistvia v zavisimosti ot tekushego sostoyania
            case (state)
                IDLE: begin
                    if (start) begin
                        dir_reg <= 1'b1;
                        cmd_reg  <= cmd;
                        tx_data  <= cmd;
                        tx_start <= 1'b1;
                    end
                end

                TX_WAIT: begin
                    // Ogidaem osvobogdenia peredatchika
                end

                RX_WAIT: begin
                    dir_reg <= 1'b0;
                    // Sbros taimauta pri vhode v eto sostoyanie
                    if (next_state == RX_WAIT && state != RX_WAIT) begin
                        timeout_cnt <= 32'd0;
                        byte_cnt    <= 2'd0;   // сброс счётчика перед новым приёмом
                        rx_pending  <= 1'b0;   // готовимся к новому пакету
                        crc_reg <= 32'hF5F5F5F5;
                    end else begin
                        if (timeout_cnt < TIMEOUT_LIMIT)
                            timeout_cnt <= timeout_cnt + 1;
                    end
                end

                RX_DATA: begin
                    if (rx_pending) begin
                        // Sbros taimauta
                        timeout_cnt <= 32'd0;
                        if (flag_crc) begin
                              crc_reg <= crc_out;
                        end else begin
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
                            endcase
                        end
                        // Uvelichivaem schetchik, esli eto ne  4-i bait
                        // if (byte_cnt < 2'd3)
                        //     byte_cnt <= byte_cnt + 1;
                          rx_pending <= 1'b0;
                    end else begin
                        if (byte_cnt < 2'd3)
                            byte_cnt <= byte_cnt + 1;
                        // Schitaem timeout, esli net baita
                        if (timeout_cnt < TIMEOUT_LIMIT)
                            timeout_cnt <= timeout_cnt + 1;
                    end
                end

                DONE: begin
                    freq <= freq_reg;
                    done <= 1'b1;
                    if (flag_crc) begin
                    crc_result <= crc_reg ^ 32'hFFFFFFFF; //crc_result <= crc_reg;   // сохраняем CRC
                    // (или можно записать в отдельный регистр для чтения)
                    end
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

//     output reg  [23:0] freq,
//     output reg         done,
//     output reg         error,
//     output wire        dir   // Управляющий вывод для RE DE max487 
// );

//     localparam TIMEOUT_LIMIT = 250000; // 5 ms pri 50 Mhz

//     localparam IDLE     = 3'd0,
//                TX_WAIT  = 3'd1,
//                RX_WAIT  = 3'd2,
//                RX_DATA  = 3'd3,
//                DONE     = 3'd4,
//                ERROR_ST = 3'd5;

//     reg [2:0] state, next_state;

//     reg [7:0]  cmd_reg;
//     reg [23:0] freq_reg;
//     reg [1:0]  byte_cnt;
//     reg [31:0] timeout_cnt;
//     reg [7:0] rx_data_latch;

//     reg tx_busy_prev;
//     reg        dir_reg;
//     reg rx_pending;

//     // ---- Kombinacionnaya logika perehodov ----
//     always @(*) begin
//         next_state = state;
//         case (state)
//             IDLE: begin
//                 if (start)
//                     next_state = TX_WAIT;
//             end
//             TX_WAIT: begin
//                 if (!tx_busy)//tx_busy_prev && 
//                     next_state = RX_WAIT;
//             end
//             RX_WAIT: begin
//                 //if (rx_valid && !rx_error)
//                 if (rx_valid)
//                     next_state = RX_DATA;
//                  if (timeout_cnt >= TIMEOUT_LIMIT)
//                       next_state = ERROR_ST;
//             end
//             RX_DATA: begin
//                  if (byte_cnt == 2'd3)
//                   next_state = DONE;
//                  else
//                   next_state = RX_DATA;
//                  if (timeout_cnt >= TIMEOUT_LIMIT)
//                   next_state = ERROR_ST;
// end
//             DONE: begin
//                 next_state = IDLE;
//             end
//             ERROR_ST: begin
//                 next_state = IDLE;
//             end
//             default: next_state = IDLE;
//         endcase
//     end

// always @(posedge clk or negedge rst_n) begin
//     if (!rst_n) begin
//         rx_data_latch <= 8'd0;
//     end else if (rx_valid) begin
//         rx_data_latch <= rx_data;   // zashelkivaem v moment valid
//     end
// end






//     // ---- Sinhronnaya logika (po tekushemu sostoyaniu) ----
//     always @(posedge clk or negedge rst_n) begin
//         if (!rst_n) begin
//             state        <= IDLE;
//             cmd_reg      <= 8'd0;
//             freq_reg     <= 24'd0;//32'd0;
//             byte_cnt     <= 2'd0;
//             timeout_cnt  <= 32'd0;
//             tx_start     <= 1'b0;
//             tx_data      <= 8'd0;
//             freq         <= 24'd0;
//             done         <= 1'b0;
//             error        <= 1'b0;
//             dir_reg      <= 1'b0;
//             rx_pending <= 1'b0;
//             //rx_data_latch <= 8'd0;
//         end else begin
//             // Sbros impulsnih vihodov po umolchaniu
//             tx_start <= 1'b0;
//             done     <= 1'b0;
//             error    <= 1'b0;
//             tx_busy_prev <= tx_busy;
//             // ---- Защёлка rx_valid ----
//             if (rx_valid) rx_pending <= 1'b1;

//             // Deistvia v zavisimosti ot tekushego sostoyania
//             case (state)
//                 IDLE: begin
//                     if (start) begin
//                         dir_reg <= 1'b1;
//                         cmd_reg  <= cmd;
//                         tx_data  <= cmd;
//                         tx_start <= 1'b1;
//                     end
//                 end

//                 TX_WAIT: begin
//                     // Ogidaem osvobogdenia peredatchika
//                 end

//                 RX_WAIT: begin
//                     dir_reg <= 1'b0;
//                     // Sbros taimauta pri vhode v eto sostoyanie
//                     if (next_state == RX_WAIT && state != RX_WAIT) begin
//                         timeout_cnt <= 32'd0;
//                         byte_cnt    <= 2'd0;   // сброс счётчика перед новым приёмом
//                         rx_pending  <= 1'b0;   // готовимся к новому пакету
//                     end else begin
//                         if (timeout_cnt < TIMEOUT_LIMIT)
//                             timeout_cnt <= timeout_cnt + 1;
//                     end
//                 end

//                 RX_DATA: begin
//                     if (rx_pending) begin
//                         // Sbros taimauta
//                         timeout_cnt <= 32'd0;
//                         // Sohranaem bait v freq_reg (MSB first)
//                         case (byte_cnt)
//                             2'd0: begin
//                                   if(byte_cnt == rx_data_latch[7:6]) freq_reg[5:0]   <= rx_data_latch[5:0]; else error <= 1'b1; 
//                                   //$display("byte_cnt == %2b, rx_data_latch[7:0] = %08b", byte_cnt, rx_data_latch);
//                                   end
//                             2'd1: begin
//                                   if(byte_cnt == rx_data_latch[7:6]) freq_reg[11:6]  <= rx_data_latch[5:0]; else error <= 1'b1;
//                                   //$display("byte_cnt == %2b, rx_data_latch[7:0] = %08b", byte_cnt, rx_data_latch);
//                                   end
//                             2'd2: begin
//                                   if(byte_cnt == rx_data_latch[7:6]) freq_reg[17:12] <= rx_data_latch[5:0]; else error <= 1'b1;
//                                   //$display("byte_cnt == %2b, rx_data_latch[7:0] = %08b", byte_cnt, rx_data_latch);
//                                   end
//                             2'd3: begin
//                                   if(byte_cnt == rx_data_latch[7:6]) freq_reg[23:18] <= rx_data_latch[5:0]; else error <= 1'b1;
//                                  // $display("byte_cnt == %2b, rx_data_latch[7:0] = %08b", byte_cnt, rx_data_latch);
//                                   end
//                         endcase
//                         // Uvelichivaem schetchik, esli eto ne  4-i bait
//                         // if (byte_cnt < 2'd3)
//                         //     byte_cnt <= byte_cnt + 1;
//                           rx_pending <= 1'b0;
//                     end else begin
//                         if (byte_cnt < 2'd3)
//                             byte_cnt <= byte_cnt + 1;
//                         // Schitaem timeout, esli net baita
//                         if (timeout_cnt < TIMEOUT_LIMIT)
//                             timeout_cnt <= timeout_cnt + 1;
//                     end
//                 end

//                 DONE: begin
//                     freq <= freq_reg;
//                     done <= 1'b1;
//                     // Sbros registrov dla sledujuchego zapuska
//                     byte_cnt    <= 2'd0;
//                     freq_reg    <= 32'd0;
//                     timeout_cnt <= 32'd0;
//                 end

//                 ERROR_ST: begin
//                     error <= 1'b1;
//                     byte_cnt    <= 2'd0;
//                     freq_reg    <= 32'd0;
//                     timeout_cnt <= 32'd0;
//                 end

//                 default: ;
//             endcase

//             // Perehod v sledujushee sostoyanie
//             state <= next_state;
//         end
//     end

// endmodule

