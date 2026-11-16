module urr_osn (
    input  wire       clk,
    input  wire       rst_i,
    input  wire [1:0] start,
    input  wire [7:0] cmd,

    (* DONT_TOUCH = "yes" *) input  wire       tx_busy,
    output reg        tx_start,
    output reg  [7:0] tx_data,

    input  wire       rx_valid,
    input  wire [7:0] rx_data,
    input  wire       rx_error,
    input  wire       blok_i, 

    output reg  [23:0] freq,
    output reg         done,
    output reg         error,
    output wire        dir   // Upravlaushii vivod for RE DE max487 
);

    localparam TIMEOUT_LIMIT = 100000; // 1 ms pri 50 Mhz

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
    //reg [7:0] rx_data_latch;

    reg tx_busy_prev;
    //reg rx_pending;
    reg rx_valid_d;

    reg [31:0] crc_reg;
    reg [21:0] send_delay;
    wire [31:0] crc_out;
    wire rx_pulse;

    assign dir = tx_busy;
    assign rx_pulse = rx_valid & ~rx_valid_d;   // 1 такт на байт




    // ---- Kombinacionnaya logika perehodov ----
    always @(*) begin
         next_state = state;
         case (state)
            IDLE: begin
             
             if (start == 2'd2) begin
               next_state = TX_WAIT;
            end
            else begin
              next_state = IDLE;
        end
    end

            TX_WAIT: begin
               
                if (!tx_start && !tx_busy)
                    next_state = RX_WAIT;
            end
           
            RX_WAIT: begin
                if (rx_error)
                   next_state = ERROR_ST;
               else if (rx_valid)
                   next_state = RX_DATA;
               else if (timeout_cnt >= TIMEOUT_LIMIT)
                   next_state = ERROR_ST;
           end

           RX_DATA: begin
               if (rx_pulse && rx_error)
                   next_state = ERROR_ST;  
               else if (byte_cnt == 2'd3 && rx_pulse)   // 4-й байт реально принят
               next_state = DONE;
               else if (timeout_cnt >= TIMEOUT_LIMIT)
                   next_state = ERROR_ST;
                   else
                   next_state = RX_DATA;
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




always @(posedge clk)
    rx_valid_d <= rx_valid;
 






    // ---- Sinhronnaya logika (po tekushemu sostoyaniu) ----
    always @(posedge clk) begin
        if (rst_i) begin
            state        <= IDLE;
            cmd_reg      <= 8'd0;
            freq_reg     <= 24'd0;
            byte_cnt     <= 2'd0;
            timeout_cnt  <= 32'd0;
            tx_start     <= 1'b0;
            tx_data      <= 8'd0;
            freq         <= 24'd0;
            done         <= 1'b0;
            error        <= 1'b0;
           // rx_pending <= 1'b0;
            crc_reg <= 32'hF5F5F5F5;   // nachalnoe znachenie for CRC32
            send_delay <= 22'd0;
        end else if (blok_i) begin
             state        <= IDLE;
             tx_start     <= 1'b0;
             byte_cnt     <= 2'd0;
             timeout_cnt  <= 32'd0;
             freq_reg     <= 24'd0;
             done         <= 1'b0;
             error        <= 1'b0;
        end else begin
            // Sbros impulsnih vihodov po umolchaniu
            tx_start <= 1'b0;
            done     <= 1'b0;
            error    <= 1'b0;
            tx_busy_prev <= tx_busy;
            // ---- Zachelka rx_valid ----
            //if (rx_valid) rx_pending <= 1'b1;

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
                    //  if (send_delay < 2) begin
                    //     send_delay <= send_delay + 1;
                    //   end
                end

                


                RX_WAIT: begin
                if (rx_valid) begin
                timeout_cnt <= 32'd0;
                if (rx_error) begin
                error       <= 1'b1;
                //error       <= 1'b0;
                end else begin 
                    if (rx_data[7:6] != 2'd0) error <= 1'b1;
                       freq_reg[5:0] <= rx_data[5:0];
                       byte_cnt      <= 2'd1;           // gdem byte1
                end
                end else if (timeout_cnt < TIMEOUT_LIMIT) begin
                timeout_cnt <= timeout_cnt + 1;
                end
                end

            


                RX_DATA: begin
                   if (rx_pulse) begin
                   timeout_cnt <= 32'd0;
                   if (rx_error) begin
                    error <= 1'b1;
                   end else begin
                   if (rx_data[7:6] != byte_cnt) error <= 1'b1;
                     case (byte_cnt)
                     2'd1: freq_reg[11:6]  <= rx_data[5:0];
                     2'd2: freq_reg[17:12] <= rx_data[5:0];
                     2'd3: freq_reg[23:18] <= rx_data[5:0];
                     endcase
                   if (byte_cnt < 2'd3)
                     byte_cnt <= byte_cnt + 1;    // na 3-m baite stanet 3
                   end
                    end else if (timeout_cnt < TIMEOUT_LIMIT) begin
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
