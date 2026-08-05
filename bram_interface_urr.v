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
    
    
    // UART interface
    output reg         uart_start,
    output reg  [7:0]  uart_cmd,
    input  wire        uart_done,
    input  wire        uart_error,
    input  wire [23:0] uart_freq
);

    //-----------------------------------------------------------------
    // Address map (bytes) – only UART-related
    //-----------------------------------------------------------------
    localparam ADDR_CTRL        = 8'h00;   // 0x00 – control
    localparam ADDR_CMD         = 8'h08;   // 0x08 – UART command (write)
    localparam ADDR_UART_RESULT = 8'h0C;   // 0x0C – UART result (read)
    localparam ADDR_UART_STATUS = 8'h10;   // 0x10 – UART status (read)

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

    //-----------------------------------------------------------------
    // Output assignments
    //-----------------------------------------------------------------
    assign axi_vd_o = axi_vd_reg;

    //-----------------------------------------------------------------
    // Main logic
    //-----------------------------------------------------------------
    always @(posedge clk_i or posedge rst_i) begin
        if (rst_i) begin
            reg_ctrl        <= 32'd0;
            reg_cmd         <= 32'd0;
            reg_uart_result <= 32'd0;
            uart_done_flag  <= 1'b0;
            uart_error_flag <= 1'b0;
            uart_start_pulse <= 1'b0;
            axi_vd_reg      <= 1'b0;
            axi_data_o      <= 32'd0;
        end else begin
            axi_vd_reg <= 1'b0;   // default

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
                    if (axi_addr_i[7:0] == ADDR_CTRL)
                        reg_ctrl <= axi_data_i;
                end else begin
                    // Read
                    case (axi_addr_i[7:0])
                        ADDR_CTRL: begin
                            axi_data_o <= reg_ctrl;
                            axi_vd_reg <= 1'b1;
                        end
                        ADDR_CMD: begin
                            axi_data_o <= reg_cmd;
                            axi_vd_reg <= 1'b1;
                        end
                        ADDR_UART_RESULT: begin
                            axi_data_o <= reg_uart_result;
                            axi_vd_reg <= 1'b1;
                        end
                        ADDR_UART_STATUS: begin
                            axi_data_o <= {30'b0, uart_error_flag, uart_done_flag};
                            axi_vd_reg <= 1'b1;
                        end
                        default: begin
                            axi_data_o <= 32'd0;
                            axi_vd_reg <= 1'b0;
                        end
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

            
        end
    end

    //-----------------------------------------------------------------
    // Control outputs
    //-----------------------------------------------------------------
    always @(posedge clk_i or posedge rst_i) begin
        if (rst_i) begin
            module_enable <= 1'b0;
           // irq_enable    <= 1'b0;
        end else begin
            module_enable <= reg_ctrl[0];
            //irq_enable    <= reg_ctrl[1];
        end
    end

    //-----------------------------------------------------------------
    // UART outputs (pulsed and latched)
    //-----------------------------------------------------------------
    always @(posedge clk_i or posedge rst_i) begin
        if (rst_i) begin
            uart_start <= 1'b0;
            uart_cmd   <= 8'd0;
        end else begin
            uart_start <= uart_start_pulse;
            uart_cmd   <= reg_cmd[7:0];
        end
    end

endmodule