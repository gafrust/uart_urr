module urr_crc (
    input  wire        clk,
    input  wire        rst_n,
    input  wire        start_crc,
    input  wire        rx_valid,
    input  wire [7:0]  rx_data,
    input  wire        rx_error,
    input  wire        tx_busy,
    input  wire        urr_done,
    input  wire        urr_error,
    output reg         start_urr,
    output reg  [7:0]  cmd_urr,
    output reg  [31:0] crc_result,
    output reg         crc_done,
    output wire        crc_running
);

    // Состояния
    localparam IDLE     = 3'd0,
               SEND     = 3'd1,
               WAIT_RX  = 3'd2,
               COLLECT  = 3'd3,
               DONE_ST  = 3'd4,
               ERROR_ST = 3'd5;

    reg [2:0] state, next_state;

    reg [5:0]  cmd_cnt;
    reg [1:0]  byte_cnt;
    reg [7:0]  read_cnt;
    reg [31:0] crc_reg;
    wire [31:0] crc_out;

    wire        fifo_wr_en;
    wire [7:0]  fifo_wr_data;
    wire        fifo_rd_en, fifo_rd_en_comb;
    wire [7:0]  fifo_rd_data;
    wire        fifo_empty;
    wire        fifo_full;
    wire [7:0]  fifo_count;

    reg [7:0]  fifo_rd_data_reg;
    reg        rd_valid;
    reg        crc_update_pending; // flag, chto bait zachelknut i nugno obnovit CRC
    reg        wr_en_d1, wr_en_d2;
    reg fifo_rd_en_st;

    fifo #(.DATA_WIDTH(8), .DEPTH(200)) u_fifo (
        .clk    (clk),
        .rst    (~rst_n),
        .wr_en  (fifo_wr_en),
        .wr_data(fifo_wr_data),
        .rd_en  (fifo_rd_en),
        .rd_data(fifo_rd_data),
        .full   (fifo_full),
        .empty  (fifo_empty),
        .count  (fifo_count)
    );

    crc_wrapper u_crc_wrap(
    .enable(fifo_rd_en_st),
    .crcIn(crc_reg),
    .data(fifo_rd_data),
    .crcOut(crc_out)
      );

    // ---- Next state logic ----
    always @(*) begin
        next_state = state;
        case (state)
            IDLE: if (start_crc) next_state = SEND;
            SEND: if (!tx_busy) next_state = WAIT_RX;
            WAIT_RX: begin
                if (rx_error)
                    next_state = ERROR_ST;
                else if (rx_valid) begin
                    if (byte_cnt == 2'd3) begin   // 4-i bait prinat
                        if (cmd_cnt == 6'd50)
                            next_state = COLLECT;
                        else
                            next_state = SEND;
                    end else
                        next_state = WAIT_RX;
                end
            end
            COLLECT: if (read_cnt == 8'd200) next_state = DONE_ST;
            DONE_ST: next_state = IDLE;
            ERROR_ST: next_state = IDLE;
            default: next_state = IDLE;
        endcase
    end

    // ---- Synchronous logic ----
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            state     <= IDLE;
            cmd_cnt   <= 6'd1;
            byte_cnt  <= 2'd0;
            read_cnt  <= 8'd0;
            crc_reg   <= 32'hF5F5F5F5;
            start_urr <= 1'b0;
            cmd_urr   <= 8'd0;
            crc_result <= 32'd0;
            crc_done  <= 1'b0;
            fifo_rd_data_reg <= 8'd0;
            rd_valid <= 1'b0;
            wr_en_d1 <= 0;
            wr_en_d2 <= 0;
            fifo_rd_en_st <= 0;
            
        end else begin
            start_urr <= 1'b0;
            crc_done  <= 1'b0;
         
           


                        // ----Zachelka dannih iz FIFO pri chtenii ----
            if (fifo_rd_en) begin
                fifo_rd_data_reg <= fifo_rd_data;
                crc_update_pending <= 1'b1;
                //rd_valid <= 1'b1;
            //end else begin
               // rd_valid <= 1'b0;
            end
            
            

            case (state)
                IDLE: begin
                    if (start_crc) begin
                        cmd_cnt   <= 6'd1;
                        byte_cnt  <= 2'd0;
                        read_cnt  <= 8'd0;
                        crc_reg   <= 32'hF5F5F5F5;
                    end
                end

                SEND: begin
                    if (!tx_busy) begin
                        start_urr <= 1'b1;
                        cmd_urr   <= cmd_cnt;
                        byte_cnt  <= 2'd0;
                    end
                end

                WAIT_RX: begin
                    if (rx_error) begin
                        // error handling
                    end else if (rx_valid) begin
                        if (byte_cnt == 2'd3) begin   // 4-i bait
                            byte_cnt <= 2'd0;
                            if (cmd_cnt == 6'd50) begin
                                // all commands sent
                            end else begin
                                cmd_cnt <= cmd_cnt + 1;
                            end
                        end else begin
                            byte_cnt <= byte_cnt + 1;
                        end
                    end
                   
                end

                COLLECT: begin
                   // if(fifo_rd_en) 
                   // if (crc_update_pending) begin
                        crc_reg   <= 32'hF5F5F5F5;
                        fifo_rd_en_st <=1;
                        $display("COLLECT: read_cnt=%0d, data=0x%02h, crc_in=0x%08h, crc_out=0x%08h", read_cnt, fifo_rd_data, crc_reg, crc_out);
                        read_cnt <= read_cnt + 1;
                        crc_reg <= crc_out;
                        crc_update_pending <= 1'b0;
                   // end
                end

               
                DONE_ST: begin
                    crc_result <= crc_reg ^ 32'hFFFFFFFF;
                    crc_done   <= 1'b1;
                    fifo_rd_en_st <=0;
                    cmd_cnt  <= 6'd1;
                    byte_cnt <= 2'd0;
                    read_cnt <= 8'd0;
                end

                ERROR_ST: begin
                    // error flag
                end

                default: ;
            endcase

            state <= next_state;
        end
    end
   
    assign fifo_wr_en   = (state == WAIT_RX) && rx_valid &&  !fifo_full; //!rx_error &&
    assign fifo_wr_data = rx_data;
    assign  fifo_rd_en  = (state == COLLECT) ;//assign  fifo_rd_en  = (state == COLLECT) && !fifo_empty && (read_cnt < 8'd200);
    assign crc_running  = (state != IDLE) && (state != DONE_ST) && (state != ERROR_ST);

endmodule