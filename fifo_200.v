// Synchronous FIFO with configurable depth and data width
module fifo #(
    parameter DATA_WIDTH = 8,
    parameter DEPTH      = 200   // 200 bytes
)(
    input  wire                     clk,
    input  wire                     rst,
    input  wire                     wr_en,
    input  wire [DATA_WIDTH-1:0]    wr_data,
    input  wire                     rd_en,
    output reg  [DATA_WIDTH-1:0]    rd_data,
    output wire                     full,
    output wire                     empty,
    output wire [ $clog2(DEPTH) : 0] count   // chislo elementov v FIFO
);

    // Memory array
    reg [DATA_WIDTH-1:0] mem [0:DEPTH-1];
    reg [$clog2(DEPTH)-1:0] wr_ptr;
    reg [$clog2(DEPTH)-1:0] rd_ptr;
    reg [$clog2(DEPTH):0] cnt;

    // Full / empty flags
    assign full  = (cnt == DEPTH);
    assign empty = (cnt == 0);
    assign count = cnt;

    // Write and read pointer update
    always @(posedge clk or posedge rst) begin
        if (!rst) begin
            wr_ptr <= 0;
            rd_ptr <= 0;
            cnt    <= 0;
            rd_data <= 0; 
            // rd_data is not cleared, but will be overwritten on read
        end else begin

            if(rd_ptr==200) rd_ptr <=0;
            if(wr_ptr==200) wr_ptr <=0;
            case ({wr_en, rd_en})
                2'b10: begin // write only
                    if (!full) begin
                        mem[wr_ptr] <= wr_data;
                        wr_ptr      <= wr_ptr + 1;
                        cnt         <= cnt + 1;
                    end
                end
                2'b01: begin // read only
                    if (!empty) begin
                        rd_data <= mem[rd_ptr];
                        rd_ptr  <= rd_ptr + 1;
                        cnt     <= cnt - 1;
                    end
                end
                2'b11: begin // simultaneous write and read
                    if (!full && !empty) begin
                        // Write first (to new location)
                        mem[wr_ptr] <= wr_data;
                        wr_ptr      <= wr_ptr + 1;
                        // Read from current rd_ptr
                        rd_data <= mem[rd_ptr];
                        rd_ptr  <= rd_ptr + 1;
                        // cnt stays the same
                    end else if (!full) begin
                        // Only write (if empty)
                        mem[wr_ptr] <= wr_data;
                        wr_ptr      <= wr_ptr + 1;
                        cnt         <= cnt + 1;
                    end else if (!empty) begin
                        // Only read (if full)
                        rd_data <= mem[rd_ptr];
                        rd_ptr  <= rd_ptr + 1;
                        cnt     <= cnt - 1;
                    end
                    // If both full and empty (shouldn't happen), do nothing
                end
                default: ; // no operation
            endcase
        end
    end

endmodule