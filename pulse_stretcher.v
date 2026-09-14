module pulse_stretcher (
    input wire clk,          // 120 МГц
    input wire rst,
    input wire imp_i, // короткий импульс (8 нс)
    output reg imp_out // растянутый импульс (100 нс)
);

    // Длительность 100 нс при 120 МГц = ceil(100 / 8.333) ≈ 12 тактов
    localparam WIDTH_CYCLES = 16;  
    reg [3:0] counter;      // 4 бита хватит (0..15)
    reg in_sync, in_prev;
    //reg  [3:0 ] tx_mode_i_fix,
    wire in_rising, in_descending;

    // Синхронизация входа и детектор фронта
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

    // Основной расширитель импульса
    always @(posedge clk) begin
        if (rst) begin
            imp_out <= 1'b0;
            counter <= 4'd0;
        end else begin
            if ((in_descending||in_rising) && !imp_out) begin
                imp_out <= 1'b1;
                counter <= WIDTH_CYCLES - 1; // загружаем счётчик
            end else if (imp_out) begin
                if (counter == 4'd0)
                    imp_out <= 1'b0;
                else
                    counter <= counter - 1'b1;
            end
        end
    end

endmodule
