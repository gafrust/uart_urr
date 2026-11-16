module urr_rdy_ctrl_simple (
    input  wire clk,
    input  wire rst_i,

    // Vneshie signali
    (* DONT_TOUCH = "yes" *) input  wire urr_connected_i,
    (* DONT_TOUCH = "yes" *) input  wire en_i,
    (* DONT_TOUCH = "yes" *) input  wire crc_check_i,

    // Ot rabochih modulei
    (* DONT_TOUCH = "yes" *) input  wire vd_o,
    (* DONT_TOUCH = "yes" *) input  wire vd_crc_o,
    (* DONT_TOUCH = "yes" *) input  wire crc_match_i,
    (* DONT_TOUCH = "yes" *) input  wire err_o,          // NEW: error от urr_osn

    // Vihodi
    (* DONT_TOUCH = "yes" *) output wire rdy_o,
    (* DONT_TOUCH = "yes" *) output wire err_freq_code_latch_o,
    (* DONT_TOUCH = "yes" *) output wire crc_result_latch_o,
    (* DONT_TOUCH = "yes" *) output wire vd_o_force_o,
    (* DONT_TOUCH = "yes" *) output wire vd_crc_o_force_o,
    (* DONT_TOUCH = "yes" *) output wire conn_rise_o,
    (* DONT_TOUCH = "yes" *) output wire conn_fall_o
);

    // ---------- Detektori frontov ----------
    (* DONT_TOUCH = "yes" *) reg en_d, crc_d, vd_d, vd_crc_d, conn_d, conn_dd, err_d;

    always @(posedge clk) begin
        if (rst_i) begin
            en_d <= 1'b0; 
            crc_d <= 1'b0; 
            vd_d <= 1'b0;
            vd_crc_d <= 1'b0; 
            conn_d <= 1'b0; 
            conn_dd <= 1'b0;
            err_d <= 1'b0;
        end else begin
            en_d <= en_i;
            crc_d <= crc_check_i;
            vd_d <= vd_o;
            vd_crc_d <= vd_crc_o;
            conn_d <= urr_connected_i;
            conn_dd <= conn_d;
            err_d <= err_o;
        end
    end

  

     assign en_rise     = en_i        & ~en_d;
     assign crc_rise    = crc_check_i & ~crc_d;
     assign vd_rise     = vd_o        & ~vd_d;
     assign vd_crc_rise = vd_crc_o    & ~vd_crc_d;
     assign err_rise    = err_o       & ~err_d;   // NEW
     assign conn_rise   = conn_d      & ~conn_dd;
     assign conn_fall   = ~conn_d      & conn_dd;

     assign conn_rise_o = conn_rise;
     assign conn_fall_o = conn_fall;

    // ---------- Zachelki sostoyania ----------
    (* DONT_TOUCH = "yes" *) reg rdy_r, op_type_r, err_freq_r, crc_result_r;
    (* DONT_TOUCH = "yes" *) reg vd_force_r, vd_crc_force_r;

    always @(posedge clk) begin
        if (rst_i) begin
            rdy_r <= 1'b0;
            op_type_r <= 1'b0;
            err_freq_r <= 1'b0;
            crc_result_r <= 1'b0;
            vd_force_r <= 1'b0;
            vd_crc_force_r <= 1'b0;
        end else begin
            vd_force_r <= 1'b0;
            vd_crc_force_r <= 1'b0;
             err_freq_r <= 1'b0;

            // 1)Podcluxhenie URR: rdy=1, sbros zashelok oshibki
            if (conn_rise) begin
                rdy_r <= 1'b1;
                err_freq_r <= 1'b0;
                crc_result_r <= 1'b0;
            end

            // 2) Otclushenie URR: rdy=0; pri rabote - zashelki oshibki + fors vd
            if (conn_fall) begin
                rdy_r <= 1'b0;
                if (rdy_r == 1'b0) begin
                    if (op_type_r == 1'b0) begin
                        err_freq_r <= 1'b1;
                        vd_force_r <= 1'b1;
                    end else begin
                        crc_result_r <= 1'b1;
                        vd_crc_force_r <= 1'b1;
                    end
                end
            end

            // 3) Start operacii - tolko esli rdy=1
            if (rdy_r == 1'b1) begin
                if (en_rise) begin 
                     rdy_r <= 1'b0;
                     op_type_r <= 1'b0; 
                end else if (crc_rise) begin
                     rdy_r <= 1'b0;
                     op_type_r <= 1'b1;
                end
            end

            // 4) Zavershenie - tolko esli URR eshe ne podcluchen.
            if (rdy_r == 1'b0 && urr_connected_i) begin
                if ((vd_rise || err_rise) && op_type_r == 1'b0) rdy_r <= 1'b1;
                if ( vd_crc_rise           && op_type_r == 1'b1) rdy_r <= 1'b1;
            end
        end
    end

    assign rdy_o                 = rdy_r;
    assign err_freq_code_latch_o = err_freq_r;
    assign crc_result_latch_o    = crc_result_r;
    assign vd_o_force_o          = vd_force_r;
    assign vd_crc_o_force_o      = vd_crc_force_r;

endmodule








//module urr_rdy_ctrl_simple (
//    input  wire clk,
//    input  wire rst_i,

//    // Vneshie signali
//    (* DONT_TOUCH = "yes" *) input  wire urr_connected_i,
//    (* DONT_TOUCH = "yes" *) input  wire en_i,
//    (* DONT_TOUCH = "yes" *) input  wire crc_check_i,

//    // Ot rabochih modulei
//    (* DONT_TOUCH = "yes" *) input  wire vd_o,
//    (* DONT_TOUCH = "yes" *) input  wire vd_crc_o,
//    (* DONT_TOUCH = "yes" *) input  wire crc_match_i,
//    (* DONT_TOUCH = "yes" *) input  wire err_o,          // NEW: error от urr_osn

//    // Vihodi
//    (* DONT_TOUCH = "yes" *) output wire rdy_o,
//    (* DONT_TOUCH = "yes" *) output wire err_freq_code_latch_o,
//    (* DONT_TOUCH = "yes" *) output wire crc_result_latch_o,
//    (* DONT_TOUCH = "yes" *) output wire vd_o_force_o,
//    (* DONT_TOUCH = "yes" *) output wire vd_crc_o_force_o
//);

//    // ---------- Detektori frontov ----------
//    (* DONT_TOUCH = "yes" *) reg en_d, crc_d, vd_d, vd_crc_d, conn_d, conn_dd, err_d;

//    always @(posedge clk) begin
//        if (rst_i) begin
//            en_d <= 1'b0; 
//            crc_d <= 1'b0; 
//            vd_d <= 1'b0;
//            vd_crc_d <= 1'b0; 
//            conn_d <= 1'b0; 
//            conn_dd <= 1'b0;
//            err_d <= 1'b0;
//        end else begin
//            en_d <= en_i;
//            crc_d <= crc_check_i;
//            vd_d <= vd_o;
//            vd_crc_d <= vd_crc_o;
//            conn_d <= urr_connected_i;
//            conn_dd <= conn_d;
//            err_d <= err_o;
//        end
//    end

  

//     assign en_rise     = en_i        & ~en_d;
//     assign crc_rise    = crc_check_i & ~crc_d;
//     assign vd_rise     = vd_o        & ~vd_d;
//     assign vd_crc_rise = vd_crc_o    & ~vd_crc_d;
//     assign err_rise    = err_o       & ~err_d;   // NEW
//     assign conn_rise   = conn_d      & ~conn_dd;
//     assign conn_fall   = ~conn_d      & conn_dd;

//    // ---------- Zachelki sostoyania ----------
//    (* DONT_TOUCH = "yes" *) reg rdy_r, op_type_r, err_freq_r, crc_result_r;
//    (* DONT_TOUCH = "yes" *) reg vd_force_r, vd_crc_force_r;

//    always @(posedge clk) begin
//        if (rst_i) begin
//            rdy_r <= 1'b0;
//            op_type_r <= 1'b0;
//            err_freq_r <= 1'b0;
//            crc_result_r <= 1'b0;
//            vd_force_r <= 1'b0;
//            vd_crc_force_r <= 1'b0;
//        end else begin
//            vd_force_r <= 1'b0;
//            vd_crc_force_r <= 1'b0;
//             err_freq_r <= 1'b0;

//            // 1)Podcluxhenie URR: rdy=1, sbros zashelok oshibki
//            if (conn_rise) begin
//                rdy_r <= 1'b1;
//                err_freq_r <= 1'b0;
//                crc_result_r <= 1'b0;
//            end

//            // 2) Otclushenie URR: rdy=0; pri rabote - zashelki oshibki + fors vd
//            if (conn_fall) begin
//                rdy_r <= 1'b0;
//                if (rdy_r == 1'b0) begin
//                    if (op_type_r == 1'b0) begin
//                        err_freq_r <= 1'b1;
//                        vd_force_r <= 1'b1;
//                    end else begin
//                        crc_result_r <= 1'b1;
//                        vd_crc_force_r <= 1'b1;
//                    end
//                end
//            end

//            // 3) Start operacii - tolko esli rdy=1
//            if (rdy_r == 1'b1) begin
//                if (en_rise) begin 
//                     rdy_r <= 1'b0;
//                     op_type_r <= 1'b0; 
//                end else if (crc_rise) begin
//                     rdy_r <= 1'b0;
//                     op_type_r <= 1'b1;
//                end
//            end

//            // 4) Zavershenie - tolko esli URR eshe ne podcluchen.
//            if (rdy_r == 1'b0 && urr_connected_i) begin
//                if ((vd_rise || err_rise) && op_type_r == 1'b0) rdy_r <= 1'b1;
//                if ( vd_crc_rise           && op_type_r == 1'b1) rdy_r <= 1'b1;
//            end
//        end
//    end

//    assign rdy_o                 = rdy_r;
//    assign err_freq_code_latch_o = err_freq_r;
//    assign crc_result_latch_o    = crc_result_r;
//    assign vd_o_force_o          = vd_force_r;
//    assign vd_crc_o_force_o      = vd_crc_force_r;

//endmodule