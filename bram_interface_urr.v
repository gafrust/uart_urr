module bram_interface_urr (
    input  wire        clk_i,
    input  wire        rst_i,
    
    
    // AXI BRAM interface 
    input  wire        axi_en_i,
    input  wire [31:0] axi_data_i,
    input  wire        axi_we_i,
    input  wire [31:0] axi_addr_i,
    output wire        axi_vd_o,
    output reg  [31:0] axi_data_o,
    
    
    // Outputs to user logic
    output reg         module_enable,

     // ----- НОВЫЕ ПОРТЫ ДЛЯ CRC -----
    input  wire [31:0] crc_result_i,   // ot urr_crc
    input  wire        crc_done_i,     // ot urr_crc
    output reg         start_crc,     // impuls zapuska for urr_crc
    
    
    // UART interface
    output reg         uart_start,
    output reg  [7:0]  uart_cmd,
    input  wire        uart_done,
    input  wire        uart_error,
    input  wire [23:0] uart_freq,
    input  wire        crc_match
);

    //-----------------------------------------------------------------
    // Address map (bytes) – only UART-related
    //-----------------------------------------------------------------
    localparam ADDR_CTRL        = 8'h00;   // 0x00 – control
    localparam ADDR_CMD         = 8'h08;   // 0x08 – UART command (write)
    localparam ADDR_UART_RESULT = 8'h0C;   // 0x0C – UART result (read)
    localparam ADDR_UART_STATUS = 8'h10;   // 0x10 – UART status (read)

    localparam ADDR_CRC_RESULT  = 8'h14;   // rezultat CRC (chtenie)
    localparam ADDR_CRC_STATUS  = 8'h1C;   // status CRC (chtenie)
    localparam ADDR_CRC_START   = 8'h20;   // zapis suda generiruet impuls starta
    //-----------------------------------------------------------------
    // Internal registers
    //-----------------------------------------------------------------
    reg [31:0] reg_ctrl;           // 0x00
    reg [31:0] reg_cmd;            // 0x08
    reg [31:0] reg_uart_result;    // 0x0C

    reg        uart_done_flag;
    reg        uart_error_flag;
    reg        uart_start_pulse;
    reg        axi_vd_reg;


    reg [31:0] reg_crc_result;   // hranit poslednii vicheslennii CRC
    reg        crc_done_flag;    // flag gotovnosti CRC
    reg        start_crc_pulse;  // vnutrennii impuls
    reg        crc_match_flag;

    //-----------------------------------------------------------------
    // Output assignments
    //-----------------------------------------------------------------
    assign axi_vd_o = axi_vd_reg;

    //-----------------------------------------------------------------
    // Main logic
    //-----------------------------------------------------------------
    always @(posedge clk_i or negedge rst_i) begin
        if (!rst_i) begin
            reg_ctrl        <= 32'd0;
            reg_cmd         <= 32'd0;
            reg_uart_result <= 32'd0;
            uart_done_flag  <= 1'b0;
            uart_error_flag <= 1'b0;
            uart_start_pulse <= 1'b0;
            axi_vd_reg      <= 1'b0;
            axi_data_o      <= 32'd0;
            reg_crc_result <= 32'd0;
            crc_done_flag  <= 1'b0;
            crc_match_flag <= 1'b0;
            start_crc_pulse <= 1'b0;
        end else begin
            axi_vd_reg <= 1'b0;   // default
            start_crc_pulse <= 1'b0;

            // ---- Generate UART start pulse on write to ADDR_CMD ----
            uart_start_pulse <= 1'b0;
            if (axi_en_i && axi_we_i && (axi_addr_i[7:0] == ADDR_CMD)) begin
                reg_cmd <= axi_data_i;
                uart_start_pulse <= 1'b1;
                // Clear previous flags on new command
                uart_done_flag  <= 1'b0;
                uart_error_flag <= 1'b0;
                reg_uart_result <= 32'd0;
            end

            // ---- AXI access ----
            if (axi_en_i) begin
                if (axi_we_i) begin
                    // Write
                     case (axi_addr_i[7:0])
                        ADDR_CTRL: reg_ctrl <= axi_data_i;
                        ADDR_CMD:  reg_cmd  <= axi_data_i;
                        ADDR_CRC_START: begin
                          // Generiruem impuls zapuska
                          start_crc_pulse <= 1'b1;
                          // Sbros flagov pered novim zapuskom
                          crc_done_flag  <= 1'b0;
                          crc_match_flag <= 1'b0;
                          reg_crc_result <= 32'd0;
                        end
                     endcase
                end else begin
                    // Read
                    case (axi_addr_i[7:0])
                        ADDR_CTRL: begin axi_data_o <= reg_ctrl; axi_vd_reg <= 1'b1; end
                        ADDR_CMD:  begin axi_data_o <= reg_cmd; axi_vd_reg <= 1'b1; end
                        ADDR_UART_RESULT: begin axi_data_o <= reg_uart_result; axi_vd_reg <= 1'b1; end
                        ADDR_UART_STATUS: begin axi_data_o <= {30'b0, uart_error_flag, uart_done_flag}; axi_vd_reg <= 1'b1; end
                        ADDR_CRC_RESULT:  begin axi_data_o <= reg_crc_result; axi_vd_reg <= 1'b1; end
                        ADDR_CRC_STATUS:  begin axi_data_o <= {30'b0, crc_match_flag, crc_done_flag}; axi_vd_reg <= 1'b1; end
                        default: begin axi_data_o <= 32'd0; axi_vd_reg <= 1'b0; end
                    endcase
                    
                end
            end

            // ---- UART completion ----
            if (uart_done) begin
                reg_uart_result <= {8'b0, uart_freq};
                uart_done_flag  <= 1'b1;
                uart_error_flag <= 1'b0;
            end
            if (uart_error) begin
                uart_error_flag <= 1'b1;
                uart_done_flag  <= 1'b0;
            end

            // ---- Защёлка результата CRC по сигналу crc_done_i ----
            if (crc_done_i) begin
            reg_crc_result <= crc_result_i;
            crc_done_flag  <= 1'b1;
            end


            // ---- Защёлка результата CRC по сигналу crc_done_i ----
            if (crc_match) begin
            crc_match_flag <= 1'b1;
            end
            
        end
    end


     always @(posedge clk_i or negedge rst_i) begin
         if (!rst_i) start_crc <= 1'b0;
         else start_crc <= start_crc_pulse;
         end



    //-----------------------------------------------------------------
    // Control outputs
    //-----------------------------------------------------------------
    always @(posedge clk_i or negedge rst_i) begin
        if (!rst_i) begin
            module_enable <= 1'b0;
        end else begin
            module_enable <= reg_ctrl[0];
        end
    end

    //-----------------------------------------------------------------
    // UART outputs (pulsed and latched)
    //-----------------------------------------------------------------
    always @(posedge clk_i or negedge rst_i) begin
        if (!rst_i) begin
            uart_start <= 1'b0;
            uart_cmd   <= 8'd0;
        end else begin
            uart_start <= uart_start_pulse;
            uart_cmd   <= reg_cmd[7:0];
        end
    end

endmodule