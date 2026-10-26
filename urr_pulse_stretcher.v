module urr_pulse_stretcher (
    input wire clk,          // 120 МГц
    input wire rst,
    input wire imp_i, // korotkii impuls (8 нс)
    output reg imp_out // rastanutii impuls (100 нс)
);

    // Dlitelnost 100 ns pri 120 Mgh = ceil(100 / 8.333) ≈ 12 taktov
    localparam WIDTH_CYCLES = 16;  
    reg [3:0] counter;      // 4 bita hvatit (0..15)
    reg in_sync, in_prev;
    //reg  [3:0 ] tx_mode_i_fix,
    wire in_rising, in_descending;

    //Sinhronizacia vhoda i detektor
    always @(posedge clk) begin
        if (rst) begin
            in_sync <= 1'b0;
            in_prev <= 1'b0;
        end else begin
            in_sync <= imp_i;
            in_prev <= in_sync;
        end
    end

 


    assign in_rising = in_sync && !in_prev;
    assign in_descending = !in_sync && in_prev;

    // Osnovnoi radhiritel impulsa
    always @(posedge clk) begin
        if (rst) begin
            imp_out <= 1'b0;
            counter <= 4'd0;
        end else begin
            if ((in_descending||in_rising) && !imp_out) begin
                imp_out <= 1'b1;
                counter <= WIDTH_CYCLES - 1; // zagrugaem schetchik
            end else if (imp_out) begin
                if (counter == 4'd0)
                    imp_out <= 1'b0;
                else
                    counter <= counter - 1'b1;
            end
        end
    end

endmodule
