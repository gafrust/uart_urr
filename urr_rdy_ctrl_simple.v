
module urr_rdy_ctrl_simple (
    input  wire clk,
    input  wire rst_i,

    // Внешние сигналы
    (* DONT_TOUCH = "yes" *) input  wire urr_connected_i,
    (* DONT_TOUCH = "yes" *) input  wire en_i,
    (* DONT_TOUCH = "yes" *) input  wire crc_check_i,

    // От рабочих модулей
    (* DONT_TOUCH = "yes" *) input  wire vd_o,           // завершение freq-операции (от u_urr)
    (* DONT_TOUCH = "yes" *) input  wire vd_crc_o,       // завершение CRC-операции (от u_urr_crc)
    (* DONT_TOUCH = "yes" *) input  wire crc_match_i,    // crc_result_o от u_urr_crc

    // Выходы
    (* DONT_TOUCH = "yes" *) output wire rdy_o,
    (* DONT_TOUCH = "yes" *) output wire err_freq_code_latch_o,   // защёлка ошибки freq
    (* DONT_TOUCH = "yes" *) output wire crc_result_latch_o,      // защёлка ошибки crc
    (* DONT_TOUCH = "yes" *) output wire vd_o_force_o,   // форс-импульс при отключении (freq)
    (* DONT_TOUCH = "yes" *) output wire vd_crc_o_force_o // форс-импульс при отключении (crc)
);


    // ---------- Детекторы фронтов ----------
    (* DONT_TOUCH = "yes" *) reg en_d, crc_d, vd_d, vd_crc_d, conn_d, conn_dd;

    always @(posedge clk) begin
        if (rst_i) begin
            en_d     <= 1'b0;
            crc_d    <= 1'b0;
            vd_d     <= 1'b0;
            vd_crc_d <= 1'b0;
            conn_d   <= 1'b0;
            conn_dd  <= 1'b0;
        end else begin
            en_d     <= en_i;
            crc_d    <= crc_check_i;
            vd_d     <= vd_o;
            vd_crc_d <= vd_crc_o;
            conn_d   <= urr_connected_i;
            conn_dd  <= conn_d;
        end
    end

   (* DONT_TOUCH = "yes" *) wire en_rise     =  en_i        & ~en_d;
   (* DONT_TOUCH = "yes" *) wire crc_rise    =  crc_check_i & ~crc_d;
   (* DONT_TOUCH = "yes" *) wire vd_rise     =  vd_o        & ~vd_d;
   (* DONT_TOUCH = "yes" *) wire vd_crc_rise =  vd_crc_o    & ~vd_crc_d;
   (* DONT_TOUCH = "yes" *)  wire conn_rise   =  conn_d      & ~conn_dd;   // 0 -> 1
   (* DONT_TOUCH = "yes" *) wire conn_fall   = ~conn_d      &  conn_dd;   // 1 -> 0

    // ---------- Защёлки состояния ----------
   (* DONT_TOUCH = "yes" *) reg rdy_r;          // сам rdy_o
   (* DONT_TOUCH = "yes" *) reg op_type_r;      // 0 = freq(en), 1 = crc
   (* DONT_TOUCH = "yes" *) reg err_freq_r;     // защёлка err_freq_code_o
   (* DONT_TOUCH = "yes" *) reg crc_result_r;   // защёлка crc_result_o
   (* DONT_TOUCH = "yes" *) reg vd_force_r;     // форс 1 (для freq)
   (* DONT_TOUCH = "yes" *) reg vd_crc_force_r; // форс 1 (для crc)

    always @(posedge clk) begin
        if (rst_i) begin
            rdy_r          <= 1'b0;
            op_type_r      <= 1'b0;
            err_freq_r     <= 1'b0;
            crc_result_r   <= 1'b0;
            vd_force_r     <= 1'b0;
            vd_crc_force_r <= 1'b0;
        end else begin
            // Форс-импульсы живут 1 такт
            vd_force_r     <= 1'b0;
            vd_crc_force_r <= 1'b0;

            // 1) Подключение URR: rdy=1, сброс защёлок ошибки
            if (conn_rise) begin
                rdy_r        <= 1'b1;
                err_freq_r   <= 1'b0;
                crc_result_r <= 1'b0;
            end

            // 2) Отключение URR: rdy=0; при работе — защёлка ошибки + форс vd
            if (conn_fall) begin
                rdy_r <= 1'b0;
                if (rdy_r == 1'b0) begin          // шла работа
                    if (op_type_r == 1'b0) begin
                        err_freq_r  <= 1'b1;
                        vd_force_r  <= 1'b1;
                    end else begin
                        crc_result_r   <= 1'b1;
                        vd_crc_force_r <= 1'b1;
                    end
                end
            end

            // 3) Старт операции — только если rdy=1
            if (rdy_r == 1'b1) begin
                if (en_rise) begin
                    rdy_r     <= 1'b0;
                    op_type_r <= 1'b0;
                end else if (crc_rise) begin
                    rdy_r     <= 1'b0;
                    op_type_r <= 1'b1;
                end
            end

            // 4) Завершение — только если URR ещё подключён
            if (rdy_r == 1'b0 && urr_connected_i) begin
                if (vd_rise     && op_type_r == 1'b0) rdy_r <= 1'b1;
                if (vd_crc_rise && op_type_r == 1'b1) rdy_r <= 1'b1;
            end
        end
    end

    // ---------- Выходы ----------
    assign rdy_o           = rdy_r;
    assign err_freq_code_latch_o = err_freq_r;
    assign crc_result_latch_o    = crc_result_r;
    assign vd_o_force_o     = vd_force_r;
    assign vd_crc_o_force_o = vd_crc_force_r;

endmodule
