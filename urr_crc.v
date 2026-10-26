module urr_crc (
    input  wire        clk,
    input  wire        rst_n,
   (* DONT_TOUCH = "yes" *)input  wire        start_crc,          // zapusk vsego processa
   //(* DONT_TOUCH = "yes" *) input  wire [31:0] expected_crc,       // etalonnoe crc
   (* DONT_TOUCH = "yes" *) input  wire        rx_valid,
   (* DONT_TOUCH = "yes" *) input  wire [7:0]  rx_data,
   (* DONT_TOUCH = "yes" *) input  wire        rx_error,
   (* DONT_TOUCH = "yes" *) input  wire        tx_busy,
   (* DONT_TOUCH = "yes" *) input  wire        urr_error,
   (* DONT_TOUCH = "yes" *) output reg         start_urr,
   (* DONT_TOUCH = "yes" *) output reg  [7:0]  cmd_urr,
   (* DONT_TOUCH = "yes" *) output reg  [31:0] crc_result,         // vicheslennoe CRC (invertirovannoe)
   (* DONT_TOUCH = "yes" *)  output reg         crc_done,          // zavershenie vsego processa
   (* DONT_TOUCH = "yes" *) output wire        crc_running,
   (* DONT_TOUCH = "yes" *) output reg         crc_match           // 1 – esli vichislennoe CRC sovpadaet s prinatim
);


    // ------------------------------------------------------------
    // Sostoyaniya konechnogo avtomata
    // ------------------------------------------------------------
    localparam IDLE        = 4'd0,
               SEND        = 4'd1,
               WAIT_RX     = 4'd2,
               COLLECT     = 4'd3,
               SEND_255    = 4'd4,
               WAIT_RX_255 = 4'd5,
               COMPARE     = 4'd6,
               DONE_ST     = 4'd7,
               ERROR_ST    = 4'd8;

    (* dont_touch = "true" *)
    (* keep = "true" *)
    (* fsm_encoding = "one_hot" *)
    (* use_clock_enable = "false" *)
    reg [3:0] state, next_state;

    // ---- Schetchiki i registri dla osnovnogo processa----
   (* DONT_TOUCH = "yes" *)(* use_clock_enable = "false" *) reg [5:0]  cmd_cnt;          // 1..50
   (* DONT_TOUCH = "yes" *) reg [1:0]  byte_cnt;         // 0..3 dla priema otvetov na komandi 1..50
   (* DONT_TOUCH = "yes" *) reg [7:0]  read_cnt;         // kolichestvo bait prochitannih iz FIFO (0..199)
   (* DONT_TOUCH = "yes" *) reg [31:0] crc_reg;          // tekushee vichislaemoe CRC (neinvertirovannoe)
    wire [31:0] crc_out;
    wire [5:0] cmd_cnt_d;

    // ---- Schetchiki i registri dla proverochnoi komandi 0xFF ----
   (* DONT_TOUCH = "yes" *) reg [1:0]  byte_cnt_255;     // 0..3 dla priema otveta na 0xFF
   (* DONT_TOUCH = "yes" *) reg [31:0] crc_received;     // sobrannoe CRC iz 4 bait (uge invertirovannoe)

    // ---- FIFO signali ----
     (* DONT_TOUCH = "yes" *) wire        fifo_wr_en;
     (* DONT_TOUCH = "yes" *) wire [7:0]  fifo_wr_data;
     (* DONT_TOUCH = "yes" *) wire        fifo_rd_en;
     (* DONT_TOUCH = "yes" *) wire [7:0]  fifo_rd_data;
     (* DONT_TOUCH = "yes" *) wire        fifo_empty;
     (* DONT_TOUCH = "yes" *) wire        fifo_full;
     (* DONT_TOUCH = "yes" *) wire [7:0]  fifo_count;

    // ---- Signali dla upravlenia chteniem iz FIFO ----
      (* DONT_TOUCH = "yes" *) reg         fifo_rd_en_st;          // vnutrennii strob chtenia
      (* DONT_TOUCH = "yes" *) reg         crc_update_pending;     // flag, chto bait zashelknut i nugno obnovit CRC
      (* DONT_TOUCH = "yes" *) reg [7:0]   fifo_rd_data_reg;       // zashelknutii bait iz FIFO
      (* DONT_TOUCH = "yes" *) reg [21:0] send_delay;   // zadergka megdu baitami

    // ---- Instans FIFO ----
    urr_fifo_200 #(.DATA_WIDTH(8), .DEPTH(200)) u_fifo (
        .clk    (clk),
        .rst    (rst_n),
        .wr_en  (fifo_wr_en),
        .wr_data(fifo_wr_data),
        .rd_en  (fifo_rd_en),
        .rd_data(fifo_rd_data),
        .full   (fifo_full),
        .empty  (fifo_empty),
        .count  (fifo_count)
    );

    // ---- Instans obertki CRC (vkluchartsa po fifo_rd_en_st) ----
    urr_crc_wrapper u_crc_wrap (
        .enable (fifo_rd_en_st),//(fifo_rd_en_st),
        .crcIn  (crc_reg),
        .data   (fifo_rd_data),//(fifo_rd_data_reg),
        .crcOut (crc_out)
    );


//-----------------------------------------------------------------
// Novii always blok for ustranenia ostanovki cmd_cnt
//-----------------------------------------------------------------

// ---- Schetchik komand (vinesen v otdelnii blok) ----
always @(posedge clk) begin
    if (rst_n) begin
        cmd_cnt <= 6'd1;
    end else begin
        // Сброс в IDLE и DONE_ST
        if (state == IDLE || state == DONE_ST) begin
            cmd_cnt <= 6'd1;
        end
        // Inkrement tolko v WAIT_RX pri poluchenii poslednego baita otveta
        else if (state == WAIT_RX && rx_valid && byte_cnt == 2'd3 && cmd_cnt < 6'd50) begin
            cmd_cnt <= cmd_cnt + 1;
        end
    end
end




    // ------------------------------------------------------------
    // Kombinacionnaya logika perehodov
    // ------------------------------------------------------------
     (* full_case, parallel_case *)
    always @(*) begin
        next_state = state;
        case (state)
            IDLE: begin
                if (start_crc) next_state = SEND;
                else next_state = IDLE; 
            end

            SEND: begin
                //if (!tx_busy && send_delay == 3000000) next_state = WAIT_RX;
                if (!tx_busy) next_state = WAIT_RX;
                else next_state = SEND; 
            end

            WAIT_RX: begin
                //if (rx_error)
                   // next_state = ERROR_ST;
               /* else*/ if (rx_valid) begin
                      if (byte_cnt == 2'd3) begin
                          if (cmd_cnt == 6'd50)
                              next_state = COLLECT;
                          else
                              next_state = SEND;
                      end else
                        next_state = WAIT_RX;
                end
                else
                    next_state = WAIT_RX; 
            end

            COLLECT: begin
                if (read_cnt == 8'd200) next_state = SEND_255;
                else next_state = COLLECT; // Явно
            end

            SEND_255: begin
               // if (!tx_busy && send_delay == 3000000) next_state = WAIT_RX_255;
                  if (!tx_busy) next_state = WAIT_RX_255;
                else next_state = SEND_255; // Явно
            end

            WAIT_RX_255: begin
              //  if (rx_error)
              //      next_state = ERROR_ST;
               /* else*/ if (rx_valid) begin
                    if (byte_cnt_255 == 2'd3)
                        next_state = COMPARE;
                    else
                        next_state = WAIT_RX_255;
                end
                else
                    next_state = WAIT_RX_255; 
            end

            COMPARE: next_state = DONE_ST;

            DONE_ST: next_state = IDLE;

            ERROR_ST: next_state = IDLE;

            default: next_state = IDLE; 
        endcase
    end





    // ------------------------------------------------------------
    // Синхронная логика
    // ------------------------------------------------------------
    always @(posedge clk) begin
        if (rst_n) begin
            state        <= IDLE;
          //  cmd_cnt_d      <= 6'd1;
            byte_cnt     <= 2'd0;
            byte_cnt_255 <= 2'd0;
            read_cnt     <= 8'd0;
            crc_reg      <= 32'hF5F5F5F5;
            crc_received <= 32'd0;
            crc_result   <= 32'd0;
            start_urr    <= 1'b0;
            cmd_urr      <= 8'd0;
            crc_done     <= 1'b0;
            crc_match    <= 1'b0;
            fifo_rd_en_st <= 1'b0;
            crc_update_pending <= 1'b0;
            fifo_rd_data_reg <= 8'd0;
            send_delay <= 22'd0;
        end else begin
            start_urr <= 1'b0;
            crc_done  <= 1'b0;
            crc_match <= 1'b0;
            

            // ---- Защёлка данных при чтении из FIFO ----
            if (fifo_rd_en) begin
                fifo_rd_data_reg <= fifo_rd_data;
                crc_update_pending <= 1'b1;
                fifo_rd_en_st <= 1'b1;
            end

            // Сброс send_delay при переходе в SEND из другого состояния
             if (next_state == SEND && state != SEND) begin
                 send_delay <= 22'd0;
             end

             // Сброс send_delay при переходе в SEND_255 из другого состояния
             if (next_state == SEND_255 && state != SEND_255) begin
                 send_delay <= 22'd0;
             end

            case (state)
                IDLE: begin
                    if (start_crc) begin
                       // cmd_cnt_d      <= 6'd1;
                        byte_cnt     <= 2'd0;
                        byte_cnt_255 <= 2'd0;
                        read_cnt     <= 8'd0;
                        crc_reg      <= 32'hF5F5F5F5;
                        crc_received <= 32'd0;
                        fifo_rd_en_st <= 1'b0;
                        crc_update_pending <= 1'b0;
                        send_delay <= 22'd0;
                    end
                end

                SEND: begin
                    //  if (send_delay < 3000000) begin
                    //     send_delay <= send_delay + 1;
                    //   end

                    //if (send_delay == 3000000 && !tx_busy) begin
                   if (!tx_busy) begin
                        start_urr <= 1'b1;
                        cmd_urr   <= cmd_cnt_d;
                        byte_cnt  <= 2'd0;
                    end
                end

                WAIT_RX: begin
                    //if (rx_error) begin
                        // обработка ошибки
     /* end else */ if (rx_valid) begin
                        if (byte_cnt == 2'd3) begin
                            byte_cnt <= 2'd0;
                            // if (cmd_cnt < 6'd50) begin
                            //     cmd_cnt <= cmd_cnt + 1;
                            // end
                            end else begin
                            byte_cnt <= byte_cnt + 1;
                        end
                    end
                end

                COLLECT: begin
                    crc_reg      <= 32'hF5F5F5F5;
                   
                    $display("COLLECT: read_cnt=%0d, data=0x%02h, crc_in=0x%08h, crc_out=0x%08h", read_cnt, fifo_rd_data, crc_reg, crc_out);
                    read_cnt <= read_cnt + 1;
                    crc_reg  <= crc_out;
                    crc_update_pending <= 1'b0;
                    send_delay <= 22'd0;
                    
                end

                SEND_255: begin
                    // if (send_delay < 3000000) begin
                    //     send_delay <= send_delay + 1;
                    //  end

                    fifo_rd_en_st <= 1'b0;
                    //if (send_delay == 3000000 && !tx_busy) begin
                    if (!tx_busy) begin
                        start_urr <= 1'b1;
                        cmd_urr   <= 8'hFF;
                        byte_cnt_255 <= 2'd0;
                    end
                end

                WAIT_RX_255: begin
                  //  if (rx_error) begin
                        // ошибка
                    /*end else*/ if (rx_valid) begin
                        case (byte_cnt_255)
                            2'd0: crc_received[31:24] <= rx_data;
                            2'd1: crc_received[23:16] <= rx_data;
                            2'd2: crc_received[15:8]  <= rx_data;
                            2'd3: crc_received[7:0]   <= rx_data;
                        endcase
                        if (byte_cnt_255 < 2'd3)
                            byte_cnt_255 <= byte_cnt_255 + 1;
                    end
                end

                COMPARE: begin
                    // Инвертируем вычисленное CRC и сравниваем с принятым
                    crc_result <= crc_reg ^ 32'hFFFFFFFF;
                    crc_match  <= !((crc_reg ^ 32'hFFFFFFFF) == crc_received);
                end

                DONE_ST: begin
                    // Завершаем процесс
                    crc_done   <= 1'b1;
                    // сброс регистров
                   // cmd_cnt      <= 6'd1;
                    byte_cnt     <= 2'd0;
                    byte_cnt_255 <= 2'd0;
                    read_cnt     <= 8'd0;
                    fifo_rd_en_st <= 1'b0;
                    crc_update_pending <= 1'b0;
                    send_delay <= 22'd0;
                end

                ERROR_ST: begin
                    // флаг ошибки
                end

                default: ;
            endcase

            state <= next_state;
        end
    end

    // ------------------------------------------------------------
    // Выходные комбинационные сигналы
    // ------------------------------------------------------------
    assign fifo_wr_en   = (state == WAIT_RX) && rx_valid && !fifo_full;
    assign fifo_wr_data = rx_data;
    assign fifo_rd_en   = (state == COLLECT);//&& !fifo_empty && (read_cnt < 8'd200);
    assign crc_running  = (state != IDLE) && (state != DONE_ST) && (state != ERROR_ST);
    assign cmd_cnt_d = cmd_cnt;
    //assign fifo_rd_en_st = 1'b1;

endmodule
