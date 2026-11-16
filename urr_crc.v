module urr_crc (
    input  wire        clk,
    input  wire        rst_i,
   (* DONT_TOUCH = "yes" *) input  wire        start_crc,
   (* DONT_TOUCH = "yes" *) input  wire        rx_valid,
   (* DONT_TOUCH = "yes" *) input  wire [7:0]  rx_data,
   (* DONT_TOUCH = "yes" *) input  wire        rx_error,
   (* DONT_TOUCH = "yes" *) input  wire        tx_busy,
   (* DONT_TOUCH = "yes" *) input  wire        urr_error,
   (* DONT_TOUCH = "yes" *) input  wire        blok_i,
   (* DONT_TOUCH = "yes" *) output reg         start_urr,
   (* DONT_TOUCH = "yes" *) output reg  [7:0]  cmd_urr,
   (* DONT_TOUCH = "yes" *) output reg  [31:0] crc_result,
   (* DONT_TOUCH = "yes" *) output reg         crc_done,
   (* DONT_TOUCH = "yes" *) output wire        crc_running,
   (* DONT_TOUCH = "yes" *) output reg         crc_match
);

    localparam IDLE=4'd0,
               SEND=4'd1,
               WAIT_RX=4'd2,
               COLLECT=4'd3,
               SEND_255=4'd4,
               WAIT_RX_255=4'd5,
               COMPARE=4'd6,
               DONE_ST=4'd7,
               ERROR_ST=4'd8;
    localparam CRC_TIMEOUT_LIMIT = 1_500_000;   //  ~8ms @60MHz
    localparam COLLECT_TIMEOUT   = 400_000;   // na sbor  FIFO

    localparam DONE_HOLD = 2'd2;          // 3 takta: 0,1,2

    (* DONT_TOUCH = "yes" *) reg [1:0] done_hold;
    (* DONT_TOUCH = "yes" *) reg       crc_match_lat;

    (* dont_touch = "true" *) (* keep = "true" *)
    (* fsm_encoding = "one_hot" *) (* use_clock_enable = "false" *)
    reg [3:0] state, next_state;

   (* DONT_TOUCH = "yes" *) reg [5:0]  cmd_cnt;
   (* DONT_TOUCH = "yes" *) reg [1:0]  byte_cnt;
   (* DONT_TOUCH = "yes" *) reg [7:0]  read_cnt;
   (* DONT_TOUCH = "yes" *) reg [31:0] crc_reg;
    wire [31:0] crc_out;
    wire [5:0] cmd_cnt_d;

   (* DONT_TOUCH = "yes" *) reg [1:0]  byte_cnt_255;
   (* DONT_TOUCH = "yes" *) reg [31:0] crc_received;
   (* DONT_TOUCH = "yes" *) reg [31:0] crc_timeout;   // NEW

   (* DONT_TOUCH = "yes" *) wire        fifo_wr_en;
   (* DONT_TOUCH = "yes" *) wire [7:0]  fifo_wr_data;
   (* DONT_TOUCH = "yes" *) wire        fifo_rd_en;
   (* DONT_TOUCH = "yes" *) wire [7:0]  fifo_rd_data;
   (* DONT_TOUCH = "yes" *) wire        fifo_empty, fifo_full;
   (* DONT_TOUCH = "yes" *) wire [7:0]  fifo_count;

   (* DONT_TOUCH = "yes" *) reg        fifo_rd_en_st;
   (* DONT_TOUCH = "yes" *) reg        crc_update_pending;
   (* DONT_TOUCH = "yes" *) reg [7:0]  fifo_rd_data_reg;
   (* DONT_TOUCH = "yes" *) reg [21:0] send_delay;

    urr_fifo_200 #(.DATA_WIDTH(8), .DEPTH(200)) u_fifo (
        .clk(clk), 
        .rst(rst_i),
        .wr_en(fifo_wr_en), 
        .wr_data(fifo_wr_data),
        .rd_en(fifo_rd_en), 
        .rd_data(fifo_rd_data),
        .full(fifo_full), 
        .empty(fifo_empty), 
        .count(fifo_count)
    );

    urr_crc_wrapper u_crc_wrap (
        .enable(fifo_rd_en_st), 
        .crcIn(crc_reg),
        .data(fifo_rd_data), 
        .crcOut(crc_out)
    );

    // ---- Schetchik komand ----
    always @(posedge clk) begin
        if (rst_i) cmd_cnt <= 6'd1;
        else begin
            if (state == IDLE || state == DONE_ST) cmd_cnt <= 6'd1;
            else if (state == WAIT_RX && rx_valid && byte_cnt == 2'd3 && cmd_cnt < 6'd50)
                cmd_cnt <= cmd_cnt + 1;
        end
    end

    // NEW:taimaut-schetchik s avtosbrosom pri lubom validnom sobitii
    always @(posedge clk) begin
        if (rst_i) crc_timeout <= 32'd0;
        else begin
            if (state == IDLE || state == DONE_ST || rx_valid ||
                (state == COLLECT && read_cnt == 8'd200)) begin
                crc_timeout <= 32'd0;
            end else if (crc_timeout < CRC_TIMEOUT_LIMIT) begin
                crc_timeout <= crc_timeout + 1'b1;
            end
        end
    end

    // ---- Kombinacionnaya logika perehodov----
     (* full_case, parallel_case *)
    always @(*) begin
        next_state = state;
        case (state)
            IDLE: if (start_crc) next_state = SEND;

            SEND: if (!tx_busy && send_delay == 15000) next_state = WAIT_RX;

           

            WAIT_RX: begin
            if (rx_error) begin
              next_state = ERROR_ST;                 // ошибка приёма — высший приоритет
              end
            else if (rx_valid) begin
              if (byte_cnt == 2'd3) begin
              if (cmd_cnt == 6'd50) next_state = COLLECT;
              else                    next_state = SEND;
              end
            else next_state = WAIT_RX;
              end
            else if (crc_timeout >= CRC_TIMEOUT_LIMIT)
             next_state = ERROR_ST;
            else
            next_state = WAIT_RX;
            end

            COLLECT: begin
                if (read_cnt == 8'd200) next_state = SEND_255;
                else if (crc_timeout >= COLLECT_TIMEOUT)
                    next_state = ERROR_ST;                 // NEW
                else next_state = COLLECT;
            end

            SEND_255: if (!tx_busy && send_delay == 15000) next_state = WAIT_RX_255;

            WAIT_RX_255: begin
                if (rx_valid) begin
                    if (byte_cnt_255 == 2'd3) next_state = COMPARE;
                    else next_state = WAIT_RX_255;
                end
                else if (crc_timeout >= CRC_TIMEOUT_LIMIT)
                    next_state = ERROR_ST;                 // NEW
                else next_state = WAIT_RX_255;
            end

            COMPARE: next_state = DONE_ST;
          //  DONE_ST: next_state = IDLE;
          DONE_ST: begin
               if (done_hold >= DONE_HOLD) next_state = IDLE;
                else                        next_state = DONE_ST;
          end

            ERROR_ST: next_state = IDLE;
            default: next_state = IDLE;
        endcase
    end

    // ----Sinhronnaya logika----
    always @(posedge clk) begin
        if (rst_i) begin
            state <= IDLE; byte_cnt <= 2'd0; byte_cnt_255 <= 2'd0;
            read_cnt <= 8'd0; crc_reg <= 32'hF5F5F5F5;
            crc_received <= 32'd0; 
            crc_result <= 32'd0;
            start_urr <= 1'b0;
            cmd_urr <= 8'd0;
            crc_done <= 1'b0; 
            crc_match <= 1'b0;
            fifo_rd_en_st <= 1'b0; 
            crc_update_pending <= 1'b0;
            fifo_rd_data_reg <= 8'd0; 
            send_delay <= 22'd0;
            done_hold     <= 2'd0;
            crc_match_lat <= 1'b0;
        end else if (blok_i) begin
            state <= IDLE; byte_cnt <= 2'd0; byte_cnt_255 <= 2'd0;
            read_cnt <= 8'd0; crc_reg <= 32'hF5F5F5F5;
            crc_received <= 32'd0; 
            crc_result <= 32'd0;
            start_urr <= 1'b0;
            cmd_urr <= 8'd0;
            crc_done <= 1'b0; 
            crc_match <= 1'b0;
            fifo_rd_en_st <= 1'b0; 
            crc_update_pending <= 1'b0;
            fifo_rd_data_reg <= 8'd0; 
            send_delay <= 22'd0;
            done_hold     <= 2'd0;
            crc_match_lat <= 1'b0;
        end else begin
            start_urr <= 1'b0; 
            crc_done <= 1'b0; 
            crc_match_lat <= 1'b0;
           // crc_match <= 1'b0;

            if (fifo_rd_en) begin
                fifo_rd_data_reg <= fifo_rd_data;
                crc_update_pending <= 1'b1;
                fifo_rd_en_st <= 1'b1;
            end

            if (next_state == SEND && state != SEND) send_delay <= 22'd0;
            if (next_state == SEND_255 && state != SEND_255) send_delay <= 22'd0;
            if (next_state == DONE_ST && state != DONE_ST) done_hold <= 2'd0;

            case (state)
                IDLE: if (start_crc) begin
                    byte_cnt <= 2'd0;
                    byte_cnt_255 <= 2'd0;
                    read_cnt <= 8'd0; 
                    crc_reg <= 32'hF5F5F5F5;
                    crc_received <= 32'd0; 
                    fifo_rd_en_st <= 1'b0;
                    crc_update_pending <= 1'b0; 
                    send_delay <= 22'd0;
                    crc_match <= 1'b0;            
                    crc_match_lat <= 1'b0;          //sbros statusa na novuy operaciu
                    done_hold <= 2'd0;
                 end

                SEND: begin
                    if (send_delay < 15000) 
                    send_delay <= send_delay + 1;

                    if (send_delay == 15000 && !tx_busy) begin
                        start_urr <= 1'b1; 
                        cmd_urr <= cmd_cnt_d;
                        byte_cnt <= 2'd0;
                    end
                end

                WAIT_RX: if (rx_valid) begin
                    if (byte_cnt == 2'd3)
                     byte_cnt <= 2'd0;
                    else byte_cnt <= byte_cnt + 1;
                end

                COLLECT: begin
                    crc_reg <= 32'hF5F5F5F5;
                    $display("COLLECT: read_cnt=%0d, data=0x%02h, crc_in=0x%08h, crc_out=0x%08h",
                             read_cnt, fifo_rd_data, crc_reg, crc_out);
                    read_cnt <= read_cnt + 1;
                    crc_reg <= crc_out;
                    crc_update_pending <= 1'b0;
                    send_delay <= 22'd0;
                end

                SEND_255: begin
                    if (send_delay < 15000)
                     send_delay <= send_delay + 1;
                    fifo_rd_en_st <= 1'b0;
                    if (send_delay == 15000 && !tx_busy) begin
                        start_urr <= 1'b1; 
                        cmd_urr <= 8'hFF;
                         byte_cnt_255 <= 2'd0;
                    end
                end

                WAIT_RX_255: if (rx_valid) begin
                    case (byte_cnt_255)
                        2'd0: crc_received[31:24] <= rx_data;
                        2'd1: crc_received[23:16] <= rx_data;
                        2'd2: crc_received[15:8]  <= rx_data;
                        2'd3: crc_received[7:0]   <= rx_data;
                    endcase
                    if (byte_cnt_255 < 2'd3) byte_cnt_255 <= byte_cnt_255 + 1;
                end

                COMPARE: begin
                    crc_result <= crc_reg ^ 32'hFFFFFFFF;
                   // crc_match  <= !((crc_reg ^ 32'hFFFFFFFF) == crc_received);
                    crc_match_lat <= !((crc_reg ^ 32'hFFFFFFFF) == crc_received);  // polarity fix
                end

                DONE_ST: begin
                   // crc_done <= 1'b1;
                    byte_cnt <= 2'd0;
                    byte_cnt_255 <= 2'd0;
                    read_cnt <= 8'd0; 
                    fifo_rd_en_st <= 1'b0;
                    crc_update_pending <= 1'b0; 
                    send_delay <= 22'd0;
                    crc_done  <= (done_hold == 2'd0);   // импульс только на 1-м такте
                    crc_match <= crc_match_lat;         // держим стабильно все 3 такта
                    if (done_hold < DONE_HOLD) done_hold <= done_hold + 1'b1;
                     $display("[%0t] DONE[%0d]: res=%08h match=%b",$time, done_hold, crc_result, crc_match);
                end

                ERROR_ST: begin                        // MOD: teper impulsit crc_done
                    crc_done      <= 1'b1;             // chtobi vnesnii rdy_ctrl zavershil operaciu
                    crc_match     <= 1'b1;
                    crc_match_lat <= 1'b1;
                    done_hold     <= 2'd0;
                   // crc_done <= 1'b1;                  
                   // crc_match <= 1'b0;
                    byte_cnt <= 2'd0;
                     byte_cnt_255 <= 2'd0;
                    read_cnt <= 8'd0; 
                    fifo_rd_en_st <= 1'b0;
                    crc_update_pending <= 1'b0; 
                    send_delay <= 22'd0;
                end
            endcase

            state <= next_state;
        end
    end

    assign fifo_wr_en   = (state == WAIT_RX) && rx_valid && !fifo_full;
    assign fifo_wr_data = rx_data;
    assign fifo_rd_en   = (state == COLLECT);
    assign crc_running  = (state != IDLE) && (state != DONE_ST) && (state != ERROR_ST);
    assign cmd_cnt_d    = cmd_cnt;

endmodule