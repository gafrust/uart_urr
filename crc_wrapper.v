module crc_wrapper (
    input        enable,
    input [31:0] crcIn,
    input [7:0]  data,
    output [31:0] crcOut
);
    wire [31:0] crc_raw;
    crc u_crc (.crcIn(crcIn), .data(data), .crcOut(crc_raw));
    assign crcOut = enable ? crc_raw : 32'hF5F5F5F5;
endmodule