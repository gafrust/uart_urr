`include "urr_crc.v"
`include "urr_crc_module.v"
`include "urr_crc_wrapper.v"
`include "urr_fifo_200.v"
`include "urr_osn.v"
`include "urr_pulse_stretcher.v"
`include "urr_rdy_ctrl_simple.v"
`include "urr_uart_rx.v"
`include "urr_uart_tx.v"

// `include "/home/rgafurov/work/Praktika_FPGA/Rustem_Gafurov/Radiocomp/Xilinx23_2/otladka_urr_star_crc/otladka_urr/otladka_urr.srcs/sources_1/imports/rtl_dir/RES.v"
module urr (
    input       clk_60_i,
    input       rst_i,
    (* DONT_TOUCH = "yes" *) output wire rs_tx_o,           // UART TX
    (* DONT_TOUCH = "yes" *) input  wire rs_rx_i,           // UART RX
    (* DONT_TOUCH = "yes" *) input       urr_connected_i, 
    (* DONT_TOUCH = "yes" *) input wire  en_i,
    (* DONT_TOUCH = "yes" *) input wire  [7:0] addr_i,
    (* DONT_TOUCH = "yes" *) input wire  crc_check_i,
    (* DONT_TOUCH = "yes" *) output wire rs_dir_o,
    (* DONT_TOUCH = "yes" *) output wire irq_con_o,
    (* DONT_TOUCH = "yes" *) output wire irq_o,
    (* DONT_TOUCH = "yes" *) output wire vd_o,
    (* DONT_TOUCH = "yes" *) output wire [31:0] freq_code_o,
    (* DONT_TOUCH = "yes" *) output wire err_freq_code_o,
    
    (* DONT_TOUCH = "yes" *) output wire vd_crc_o,
    (* DONT_TOUCH = "yes" *) output wire crc_result_o,
    (* DONT_TOUCH = "yes" *) output wire [31:0] crc_out_o,
    (* DONT_TOUCH = "yes" *) output wire rdy_o,
    (* DONT_TOUCH = "yes" *) output reg  is_connected_o
);

   (* DONT_TOUCH = "yes" *) wire       tx_busy, tx_start;
   (* DONT_TOUCH = "yes" *) wire [7:0] tx_data;
   (* DONT_TOUCH = "yes" *) wire       rx_valid, rx_error;
   (* DONT_TOUCH = "yes" *) wire [7:0] rx_data;
   (* DONT_TOUCH = "yes" *) wire [23:0] freq;
   (* DONT_TOUCH = "yes" *) wire [1:0] start;
   (* DONT_TOUCH = "yes" *) wire [7:0] cmd;
   (* DONT_TOUCH = "yes" *) wire       start_urr;
   (* DONT_TOUCH = "yes" *) wire [7:0] cmd_urr;
   (* DONT_TOUCH = "yes" *) wire       crc_running, crc_check_ii;
   (* DONT_TOUCH = "yes" *) wire       err_freq_code_latch, crc_result_latch;
   (* DONT_TOUCH = "yes" *) wire       crc_result_from_urr_crc, err_freq_from_urr;
   (* DONT_TOUCH = "yes" *) wire       vd_o_urr, vd_o_force_o, vd_urr_crc, vd_crc_o_force_o;
   //(* DONT_TOUCH = "yes" *) wire       urr_connected_i, en_i, crc_check_i;
  // (* DONT_TOUCH = "yes" *) wire [7:0] addr_i;
  // (* DONT_TOUCH = "yes" *) wire       irq_con_o, irq_o, vd_o;
  // (* DONT_TOUCH = "yes" *) wire [31:0] freq_code_o, crc_out_o;
  // (* DONT_TOUCH = "yes" *) wire       err_freq_code_o, vd_crc_o, crc_result_o, rdy_o;
  // (* DONT_TOUCH = "yes" *) reg        is_connected_o, is_con_1, is_con_2;
    //wire       clk_60_i, rst_i;
   (* DONT_TOUCH = "yes" *) wire urr_conn_rise, urr_conn_fall;
   (* DONT_TOUCH = "yes" *) wire conn_rise_sig, conn_fall_sig;
//    (* DONT_TOUCH = "yes" *) wire       in_rising = is_con_1 && !is_con_2;
//    (* DONT_TOUCH = "yes" *) wire       in_descending = is_con_2 && !is_con_1;

    // assign      in_rising = is_con_1 && !is_con_2;
    // assign      in_descending = is_con_2 && !is_con_1;

   // assign rst   = rst_i;   // aktivnii visokii ot RES
    assign start = crc_running ? {1'b0,start_urr} : {(rdy_o ? en_i : 1'b0),1'b0};
    assign cmd   = crc_running ? cmd_urr   : addr_i;
    assign crc_check_ii = rdy_o ? crc_check_i : 1'b0;

    //RES res (.clk(clk_60_i), .rst(rst_i));

//    clk_wiz_0 clk_wiz (
//      .clk_out1(clk_60_i), 
//      .reset(rst_i), 
//      .locked(), 
//      .clk_in1(clk_50_i)
//    );

    // test_urr u_test (
    //  .clk(clk_60_i),
    //  .rst(rst_i),
    //  .urr_connected_i(urr_connected_i),
    //  .en_i(en_i), 
    //  .addr_i(addr_i), 
    //  .crc_check_i(crc_check_i)
    // );

    urr_pulse_stretcher pulse_irq_con_o (
        .clk(clk_60_i), 
        .rst(rst_i),
        .imp_i(urr_connected_i), 
        .imp_out(irq_con_o)
    );
    urr_pulse_stretcher pulse_irq_o (
        .clk(clk_60_i),
        .rst(rst_i),
        .imp_i(vd_o), 
        .imp_out(irq_o)
    );

    urr_uart_tx u_tx (
        .clk(clk_60_i),
        .rst_i(rst_i),
        .start(tx_start), 
        .data(tx_data),
        .busy(tx_busy), 
        .tx(rs_tx_o)
    );

    urr_uart_rx u_rx (
        .clk(clk_60_i), 
        .rst_i(rst_i),
        .rx(rs_rx_i), 
        .data(rx_data),
        .valid(rx_valid), 
        .error(rx_error),
        .busy(tx_busy)                // probros busy v RX
    );

    urr_crc u_urr_crc (
        .clk(clk_60_i),
        .rst_i(rst_i),
        .start_crc(crc_check_ii),
        .rx_valid(rx_valid),
        .rx_data(rx_data), 
        .rx_error(rx_error),
        .tx_busy(tx_busy), 
        .urr_error(err_freq_from_urr),
        .start_urr(start_urr), 
        .cmd_urr(cmd_urr),
        .crc_result(crc_out_o), 
        .crc_done(vd_urr_crc),
        .crc_running(crc_running), 
        .crc_match(crc_result_from_urr_crc),
        .blok_i(~urr_connected_i)
    );

    urr_osn u_urr_osn (
        .clk(clk_60_i), 
        .rst_i(rst_i),
        .start(start), 
        .cmd(cmd),
        .tx_busy(tx_busy), 
        .tx_start(tx_start), 
        .tx_data(tx_data),
        .rx_valid(rx_valid), 
        .rx_data(rx_data), 
        .rx_error(rx_error),
        .freq(freq), 
        .done(vd_o_urr), 
        .error(err_freq_from_urr),
        .dir(rs_dir_o),
        .blok_i(~urr_connected_i)
    );


    assign err_freq_code_o = ( (err_freq_from_urr && !crc_running) || err_freq_code_latch ) && ( ! rdy_o ) ;
    assign crc_result_o    = crc_result_from_urr_crc || crc_result_latch;
    assign vd_crc_o        = vd_urr_crc || vd_crc_o_force_o;
    assign vd_o   = ( vd_o_force_o || vd_o_urr || err_freq_from_urr ) && ( ! rdy_o );
    assign freq_code_o     = {8'h00, freq};


    urr_rdy_ctrl_simple rdy_ctrl_simple (
        .clk(clk_60_i), 
        .rst_i(rst_i),
        .urr_connected_i(urr_connected_i),
        .en_i(en_i), 
        .crc_check_i(crc_check_i),
        .vd_o(vd_o_urr), 
        .vd_crc_o(vd_urr_crc),
        .crc_match_i(crc_result_from_urr_crc),
        .err_o(err_freq_from_urr),        // probrasivaem error 
        .rdy_o(rdy_o),
        .err_freq_code_latch_o(err_freq_code_latch),
        .crc_result_latch_o(crc_result_latch),
        .vd_o_force_o(vd_o_force_o),
        .vd_crc_o_force_o(vd_crc_o_force_o),
        .conn_rise_o(conn_rise_sig),
        .conn_fall_o(conn_fall_sig)
    );
    


    always @(posedge clk_60_i) begin
    if (rst_i)                is_connected_o <= 1'b0;
    else if (conn_rise_sig)   is_connected_o <= 1'b1;
    else if (conn_fall_sig)   is_connected_o <= 1'b0;
    end
    

endmodule



