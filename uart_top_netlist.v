// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2023.2 (lin64) Build 4029153 Fri Oct 13 20:13:54 MDT 2023
// Date        : Fri Sep 11 15:28:27 2026
// Host        : NPO140 running 64-bit Ubuntu 20.04.6 LTS
// Command     : write_verilog -force -mode timesim ./verilog/uart_top_netlist.v
// Design      : uart_top
// Purpose     : This verilog netlist is a timing simulation representation of the design and should not be modified or
//               synthesized. Please ensure that this netlist is used with the corresponding SDF file.
// Device      : xc7a35tftg256-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps
`define XIL_TIMING

module bram_interface_urr
   (axi_vd_o,
    axi_data_o,
    module_enable,
    start_crc,
    uart_start,
    uart_cmd,
    axi_addr_i,
    axi_we_i,
    axi_en_i,
    axi_data_i,
    uart_done,
    uart_freq,
    urr_error,
    crc_done_i,
    crc_result_i,
    crc_match,
    sys_clk_IBUF_BUFG,
    rst_n_IBUF);
  output axi_vd_o;
  output [31:0]axi_data_o;
  output module_enable;
  output start_crc;
  output uart_start;
  output [7:0]uart_cmd;
  input [31:0]axi_addr_i;
  input [3:0]axi_we_i;
  input axi_en_i;
  input [31:0]axi_data_i;
  input uart_done;
  input [23:0]uart_freq;
  input urr_error;
  input crc_done_i;
  input [31:0]crc_result_i;
  input crc_match;
  input sys_clk_IBUF_BUFG;
  input rst_n_IBUF;

  (* DONT_TOUCH *) wire [31:0]axi_addr_i;
  (* DONT_TOUCH *) wire [31:0]axi_data_i;
  (* DONT_TOUCH *) wire [31:0]axi_data_o;
  wire \axi_data_o[0]_i_1_n_0 ;
  wire \axi_data_o[0]_i_2_n_0 ;
  wire \axi_data_o[0]_i_3_n_0 ;
  wire \axi_data_o[0]_i_4_n_0 ;
  wire \axi_data_o[10]_i_1_n_0 ;
  wire \axi_data_o[10]_i_2_n_0 ;
  wire \axi_data_o[11]_i_1_n_0 ;
  wire \axi_data_o[11]_i_2_n_0 ;
  wire \axi_data_o[12]_i_1_n_0 ;
  wire \axi_data_o[12]_i_2_n_0 ;
  wire \axi_data_o[13]_i_1_n_0 ;
  wire \axi_data_o[13]_i_2_n_0 ;
  wire \axi_data_o[14]_i_1_n_0 ;
  wire \axi_data_o[14]_i_2_n_0 ;
  wire \axi_data_o[15]_i_1_n_0 ;
  wire \axi_data_o[15]_i_2_n_0 ;
  wire \axi_data_o[16]_i_1_n_0 ;
  wire \axi_data_o[16]_i_2_n_0 ;
  wire \axi_data_o[17]_i_1_n_0 ;
  wire \axi_data_o[17]_i_2_n_0 ;
  wire \axi_data_o[18]_i_1_n_0 ;
  wire \axi_data_o[18]_i_2_n_0 ;
  wire \axi_data_o[19]_i_1_n_0 ;
  wire \axi_data_o[19]_i_2_n_0 ;
  wire \axi_data_o[1]_i_1_n_0 ;
  wire \axi_data_o[1]_i_2_n_0 ;
  wire \axi_data_o[1]_i_3_n_0 ;
  wire \axi_data_o[1]_i_4_n_0 ;
  wire \axi_data_o[1]_i_5_n_0 ;
  wire \axi_data_o[1]_i_6_n_0 ;
  wire \axi_data_o[20]_i_1_n_0 ;
  wire \axi_data_o[20]_i_2_n_0 ;
  wire \axi_data_o[21]_i_1_n_0 ;
  wire \axi_data_o[21]_i_2_n_0 ;
  wire \axi_data_o[22]_i_1_n_0 ;
  wire \axi_data_o[22]_i_2_n_0 ;
  wire \axi_data_o[23]_i_1_n_0 ;
  wire \axi_data_o[23]_i_2_n_0 ;
  wire \axi_data_o[23]_i_3_n_0 ;
  wire \axi_data_o[24]_i_1_n_0 ;
  wire \axi_data_o[24]_i_2_n_0 ;
  wire \axi_data_o[25]_i_1_n_0 ;
  wire \axi_data_o[25]_i_2_n_0 ;
  wire \axi_data_o[26]_i_1_n_0 ;
  wire \axi_data_o[26]_i_2_n_0 ;
  wire \axi_data_o[27]_i_1_n_0 ;
  wire \axi_data_o[27]_i_2_n_0 ;
  wire \axi_data_o[28]_i_1_n_0 ;
  wire \axi_data_o[28]_i_2_n_0 ;
  wire \axi_data_o[29]_i_1_n_0 ;
  wire \axi_data_o[29]_i_2_n_0 ;
  wire \axi_data_o[2]_i_1_n_0 ;
  wire \axi_data_o[2]_i_2_n_0 ;
  wire \axi_data_o[30]_i_1_n_0 ;
  wire \axi_data_o[30]_i_2_n_0 ;
  wire \axi_data_o[31]_i_1_n_0 ;
  wire \axi_data_o[31]_i_2_n_0 ;
  wire \axi_data_o[31]_i_3_n_0 ;
  wire \axi_data_o[31]_i_4_n_0 ;
  wire \axi_data_o[31]_i_5_n_0 ;
  wire \axi_data_o[3]_i_1_n_0 ;
  wire \axi_data_o[3]_i_2_n_0 ;
  wire \axi_data_o[4]_i_1_n_0 ;
  wire \axi_data_o[4]_i_2_n_0 ;
  wire \axi_data_o[5]_i_1_n_0 ;
  wire \axi_data_o[5]_i_2_n_0 ;
  wire \axi_data_o[6]_i_1_n_0 ;
  wire \axi_data_o[6]_i_2_n_0 ;
  wire \axi_data_o[7]_i_1_n_0 ;
  wire \axi_data_o[7]_i_2_n_0 ;
  wire \axi_data_o[8]_i_1_n_0 ;
  wire \axi_data_o[8]_i_2_n_0 ;
  wire \axi_data_o[9]_i_1_n_0 ;
  wire \axi_data_o[9]_i_2_n_0 ;
  (* DONT_TOUCH *) wire axi_en_i;
  (* DONT_TOUCH *) wire axi_vd_o;
  wire axi_vd_reg2_out;
  wire axi_vd_reg_i_2_n_0;
  wire axi_vd_reg_i_3_n_0;
  (* DONT_TOUCH *) wire [3:0]axi_we_i;
  wire crc_done_flag;
  (* DONT_TOUCH *) wire crc_done_i;
  (* DONT_TOUCH *) wire crc_match;
  wire crc_match_flag_i_1_n_0;
  (* DONT_TOUCH *) wire [31:0]crc_result_i;
  wire [1:0]data3;
  wire [1:0]data5;
  (* DONT_TOUCH *) wire module_enable;
  wire [23:0]p_1_in__0;
  wire reg_cmd0;
  wire \reg_cmd[31]_i_2_n_0 ;
  wire \reg_cmd_reg_n_0_[0] ;
  wire \reg_cmd_reg_n_0_[10] ;
  wire \reg_cmd_reg_n_0_[11] ;
  wire \reg_cmd_reg_n_0_[12] ;
  wire \reg_cmd_reg_n_0_[13] ;
  wire \reg_cmd_reg_n_0_[14] ;
  wire \reg_cmd_reg_n_0_[15] ;
  wire \reg_cmd_reg_n_0_[16] ;
  wire \reg_cmd_reg_n_0_[17] ;
  wire \reg_cmd_reg_n_0_[18] ;
  wire \reg_cmd_reg_n_0_[19] ;
  wire \reg_cmd_reg_n_0_[1] ;
  wire \reg_cmd_reg_n_0_[20] ;
  wire \reg_cmd_reg_n_0_[21] ;
  wire \reg_cmd_reg_n_0_[22] ;
  wire \reg_cmd_reg_n_0_[23] ;
  wire \reg_cmd_reg_n_0_[24] ;
  wire \reg_cmd_reg_n_0_[25] ;
  wire \reg_cmd_reg_n_0_[26] ;
  wire \reg_cmd_reg_n_0_[27] ;
  wire \reg_cmd_reg_n_0_[28] ;
  wire \reg_cmd_reg_n_0_[29] ;
  wire \reg_cmd_reg_n_0_[2] ;
  wire \reg_cmd_reg_n_0_[30] ;
  wire \reg_cmd_reg_n_0_[31] ;
  wire \reg_cmd_reg_n_0_[3] ;
  wire \reg_cmd_reg_n_0_[4] ;
  wire \reg_cmd_reg_n_0_[5] ;
  wire \reg_cmd_reg_n_0_[6] ;
  wire \reg_cmd_reg_n_0_[7] ;
  wire \reg_cmd_reg_n_0_[8] ;
  wire \reg_cmd_reg_n_0_[9] ;
  wire \reg_crc_result[0]_i_1_n_0 ;
  wire \reg_crc_result[10]_i_1_n_0 ;
  wire \reg_crc_result[11]_i_1_n_0 ;
  wire \reg_crc_result[12]_i_1_n_0 ;
  wire \reg_crc_result[13]_i_1_n_0 ;
  wire \reg_crc_result[14]_i_1_n_0 ;
  wire \reg_crc_result[15]_i_1_n_0 ;
  wire \reg_crc_result[16]_i_1_n_0 ;
  wire \reg_crc_result[17]_i_1_n_0 ;
  wire \reg_crc_result[18]_i_1_n_0 ;
  wire \reg_crc_result[19]_i_1_n_0 ;
  wire \reg_crc_result[1]_i_1_n_0 ;
  wire \reg_crc_result[20]_i_1_n_0 ;
  wire \reg_crc_result[21]_i_1_n_0 ;
  wire \reg_crc_result[22]_i_1_n_0 ;
  wire \reg_crc_result[23]_i_1_n_0 ;
  wire \reg_crc_result[24]_i_1_n_0 ;
  wire \reg_crc_result[25]_i_1_n_0 ;
  wire \reg_crc_result[26]_i_1_n_0 ;
  wire \reg_crc_result[27]_i_1_n_0 ;
  wire \reg_crc_result[28]_i_1_n_0 ;
  wire \reg_crc_result[29]_i_1_n_0 ;
  wire \reg_crc_result[2]_i_1_n_0 ;
  wire \reg_crc_result[30]_i_1_n_0 ;
  wire \reg_crc_result[31]_i_1_n_0 ;
  wire \reg_crc_result[31]_i_2_n_0 ;
  wire \reg_crc_result[31]_i_3_n_0 ;
  wire \reg_crc_result[31]_i_4_n_0 ;
  wire \reg_crc_result[3]_i_1_n_0 ;
  wire \reg_crc_result[4]_i_1_n_0 ;
  wire \reg_crc_result[5]_i_1_n_0 ;
  wire \reg_crc_result[6]_i_1_n_0 ;
  wire \reg_crc_result[7]_i_1_n_0 ;
  wire \reg_crc_result[8]_i_1_n_0 ;
  wire \reg_crc_result[9]_i_1_n_0 ;
  wire [31:0]reg_crc_result__0;
  wire reg_ctrl;
  wire \reg_ctrl[31]_i_2_n_0 ;
  wire \reg_ctrl[31]_i_3_n_0 ;
  wire \reg_ctrl_reg_n_0_[0] ;
  wire \reg_ctrl_reg_n_0_[10] ;
  wire \reg_ctrl_reg_n_0_[11] ;
  wire \reg_ctrl_reg_n_0_[12] ;
  wire \reg_ctrl_reg_n_0_[13] ;
  wire \reg_ctrl_reg_n_0_[14] ;
  wire \reg_ctrl_reg_n_0_[15] ;
  wire \reg_ctrl_reg_n_0_[16] ;
  wire \reg_ctrl_reg_n_0_[17] ;
  wire \reg_ctrl_reg_n_0_[18] ;
  wire \reg_ctrl_reg_n_0_[19] ;
  wire \reg_ctrl_reg_n_0_[1] ;
  wire \reg_ctrl_reg_n_0_[20] ;
  wire \reg_ctrl_reg_n_0_[21] ;
  wire \reg_ctrl_reg_n_0_[22] ;
  wire \reg_ctrl_reg_n_0_[23] ;
  wire \reg_ctrl_reg_n_0_[24] ;
  wire \reg_ctrl_reg_n_0_[25] ;
  wire \reg_ctrl_reg_n_0_[26] ;
  wire \reg_ctrl_reg_n_0_[27] ;
  wire \reg_ctrl_reg_n_0_[28] ;
  wire \reg_ctrl_reg_n_0_[29] ;
  wire \reg_ctrl_reg_n_0_[2] ;
  wire \reg_ctrl_reg_n_0_[30] ;
  wire \reg_ctrl_reg_n_0_[31] ;
  wire \reg_ctrl_reg_n_0_[3] ;
  wire \reg_ctrl_reg_n_0_[4] ;
  wire \reg_ctrl_reg_n_0_[5] ;
  wire \reg_ctrl_reg_n_0_[6] ;
  wire \reg_ctrl_reg_n_0_[7] ;
  wire \reg_ctrl_reg_n_0_[8] ;
  wire \reg_ctrl_reg_n_0_[9] ;
  wire [23:0]reg_uart_result;
  wire \reg_uart_result[23]_i_1_n_0 ;
  wire rst_n_IBUF;
  (* DONT_TOUCH *) wire start_crc;
  wire start_crc_pulse__0;
  wire sys_clk_IBUF_BUFG;
  (* DONT_TOUCH *) wire [7:0]uart_cmd;
  (* DONT_TOUCH *) wire uart_done;
  wire uart_done_flag_i_1_n_0;
  wire uart_done_flag_i_3_n_0;
  wire uart_error_flag;
  wire uart_error_flag_i_1_n_0;
  (* DONT_TOUCH *) wire [23:0]uart_freq;
  (* DONT_TOUCH *) wire uart_start;
  wire uart_start_pulse;
  (* DONT_TOUCH *) wire urr_error;

  LUT6 #(
    .INIT(64'hBABABABFAAAAAAAA)) 
    \axi_data_o[0]_i_1 
       (.I0(\axi_data_o[0]_i_2_n_0 ),
        .I1(\axi_data_o[0]_i_3_n_0 ),
        .I2(\axi_data_o[1]_i_4_n_0 ),
        .I3(\axi_data_o[1]_i_5_n_0 ),
        .I4(\axi_data_o[0]_i_4_n_0 ),
        .I5(axi_vd_reg_i_2_n_0),
        .O(\axi_data_o[0]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hAAAAAAA8)) 
    \axi_data_o[0]_i_2 
       (.I0(axi_data_o[0]),
        .I1(axi_we_i[1]),
        .I2(axi_we_i[0]),
        .I3(axi_we_i[3]),
        .I4(axi_we_i[2]),
        .O(\axi_data_o[0]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'h40447F77)) 
    \axi_data_o[0]_i_3 
       (.I0(reg_crc_result__0[0]),
        .I1(\axi_data_o[31]_i_5_n_0 ),
        .I2(\axi_data_o[31]_i_4_n_0 ),
        .I3(\axi_data_o[31]_i_2_n_0 ),
        .I4(data5[0]),
        .O(\axi_data_o[0]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h505F3030505F3F3F)) 
    \axi_data_o[0]_i_4 
       (.I0(data3[0]),
        .I1(reg_uart_result[0]),
        .I2(\axi_data_o[31]_i_4_n_0 ),
        .I3(\reg_cmd_reg_n_0_[0] ),
        .I4(\axi_data_o[31]_i_2_n_0 ),
        .I5(\reg_ctrl_reg_n_0_[0] ),
        .O(\axi_data_o[0]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hFFFF44F444444444)) 
    \axi_data_o[10]_i_1 
       (.I0(\reg_crc_result[31]_i_3_n_0 ),
        .I1(axi_data_o[10]),
        .I2(reg_crc_result__0[10]),
        .I3(\axi_data_o[23]_i_2_n_0 ),
        .I4(\axi_data_o[10]_i_2_n_0 ),
        .I5(axi_vd_reg_i_2_n_0),
        .O(\axi_data_o[10]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0022002230333000)) 
    \axi_data_o[10]_i_2 
       (.I0(reg_uart_result[10]),
        .I1(\axi_data_o[31]_i_5_n_0 ),
        .I2(\reg_cmd_reg_n_0_[10] ),
        .I3(\axi_data_o[31]_i_2_n_0 ),
        .I4(\reg_ctrl_reg_n_0_[10] ),
        .I5(\axi_data_o[31]_i_4_n_0 ),
        .O(\axi_data_o[10]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFFFF44F444444444)) 
    \axi_data_o[11]_i_1 
       (.I0(\reg_crc_result[31]_i_3_n_0 ),
        .I1(axi_data_o[11]),
        .I2(reg_crc_result__0[11]),
        .I3(\axi_data_o[23]_i_2_n_0 ),
        .I4(\axi_data_o[11]_i_2_n_0 ),
        .I5(axi_vd_reg_i_2_n_0),
        .O(\axi_data_o[11]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0022002230333000)) 
    \axi_data_o[11]_i_2 
       (.I0(reg_uart_result[11]),
        .I1(\axi_data_o[31]_i_5_n_0 ),
        .I2(\reg_cmd_reg_n_0_[11] ),
        .I3(\axi_data_o[31]_i_2_n_0 ),
        .I4(\reg_ctrl_reg_n_0_[11] ),
        .I5(\axi_data_o[31]_i_4_n_0 ),
        .O(\axi_data_o[11]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFFFF44F444444444)) 
    \axi_data_o[12]_i_1 
       (.I0(\reg_crc_result[31]_i_3_n_0 ),
        .I1(axi_data_o[12]),
        .I2(reg_crc_result__0[12]),
        .I3(\axi_data_o[23]_i_2_n_0 ),
        .I4(\axi_data_o[12]_i_2_n_0 ),
        .I5(axi_vd_reg_i_2_n_0),
        .O(\axi_data_o[12]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0022002230333000)) 
    \axi_data_o[12]_i_2 
       (.I0(reg_uart_result[12]),
        .I1(\axi_data_o[31]_i_5_n_0 ),
        .I2(\reg_cmd_reg_n_0_[12] ),
        .I3(\axi_data_o[31]_i_2_n_0 ),
        .I4(\reg_ctrl_reg_n_0_[12] ),
        .I5(\axi_data_o[31]_i_4_n_0 ),
        .O(\axi_data_o[12]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFFFF44F444444444)) 
    \axi_data_o[13]_i_1 
       (.I0(\reg_crc_result[31]_i_3_n_0 ),
        .I1(axi_data_o[13]),
        .I2(reg_crc_result__0[13]),
        .I3(\axi_data_o[23]_i_2_n_0 ),
        .I4(\axi_data_o[13]_i_2_n_0 ),
        .I5(axi_vd_reg_i_2_n_0),
        .O(\axi_data_o[13]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0022002230333000)) 
    \axi_data_o[13]_i_2 
       (.I0(reg_uart_result[13]),
        .I1(\axi_data_o[31]_i_5_n_0 ),
        .I2(\reg_cmd_reg_n_0_[13] ),
        .I3(\axi_data_o[31]_i_2_n_0 ),
        .I4(\reg_ctrl_reg_n_0_[13] ),
        .I5(\axi_data_o[31]_i_4_n_0 ),
        .O(\axi_data_o[13]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFFFF44F444444444)) 
    \axi_data_o[14]_i_1 
       (.I0(\reg_crc_result[31]_i_3_n_0 ),
        .I1(axi_data_o[14]),
        .I2(reg_crc_result__0[14]),
        .I3(\axi_data_o[23]_i_2_n_0 ),
        .I4(\axi_data_o[14]_i_2_n_0 ),
        .I5(axi_vd_reg_i_2_n_0),
        .O(\axi_data_o[14]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0022002230333000)) 
    \axi_data_o[14]_i_2 
       (.I0(reg_uart_result[14]),
        .I1(\axi_data_o[31]_i_5_n_0 ),
        .I2(\reg_cmd_reg_n_0_[14] ),
        .I3(\axi_data_o[31]_i_2_n_0 ),
        .I4(\reg_ctrl_reg_n_0_[14] ),
        .I5(\axi_data_o[31]_i_4_n_0 ),
        .O(\axi_data_o[14]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFFFF44F444444444)) 
    \axi_data_o[15]_i_1 
       (.I0(\reg_crc_result[31]_i_3_n_0 ),
        .I1(axi_data_o[15]),
        .I2(reg_crc_result__0[15]),
        .I3(\axi_data_o[23]_i_2_n_0 ),
        .I4(\axi_data_o[15]_i_2_n_0 ),
        .I5(axi_vd_reg_i_2_n_0),
        .O(\axi_data_o[15]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0022002230333000)) 
    \axi_data_o[15]_i_2 
       (.I0(reg_uart_result[15]),
        .I1(\axi_data_o[31]_i_5_n_0 ),
        .I2(\reg_cmd_reg_n_0_[15] ),
        .I3(\axi_data_o[31]_i_2_n_0 ),
        .I4(\reg_ctrl_reg_n_0_[15] ),
        .I5(\axi_data_o[31]_i_4_n_0 ),
        .O(\axi_data_o[15]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFFFF44F444444444)) 
    \axi_data_o[16]_i_1 
       (.I0(\reg_crc_result[31]_i_3_n_0 ),
        .I1(axi_data_o[16]),
        .I2(reg_crc_result__0[16]),
        .I3(\axi_data_o[23]_i_2_n_0 ),
        .I4(\axi_data_o[16]_i_2_n_0 ),
        .I5(axi_vd_reg_i_2_n_0),
        .O(\axi_data_o[16]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0022002230333000)) 
    \axi_data_o[16]_i_2 
       (.I0(reg_uart_result[16]),
        .I1(\axi_data_o[31]_i_5_n_0 ),
        .I2(\reg_cmd_reg_n_0_[16] ),
        .I3(\axi_data_o[31]_i_2_n_0 ),
        .I4(\reg_ctrl_reg_n_0_[16] ),
        .I5(\axi_data_o[31]_i_4_n_0 ),
        .O(\axi_data_o[16]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFFFF44F444444444)) 
    \axi_data_o[17]_i_1 
       (.I0(\reg_crc_result[31]_i_3_n_0 ),
        .I1(axi_data_o[17]),
        .I2(reg_crc_result__0[17]),
        .I3(\axi_data_o[23]_i_2_n_0 ),
        .I4(\axi_data_o[17]_i_2_n_0 ),
        .I5(axi_vd_reg_i_2_n_0),
        .O(\axi_data_o[17]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0022002230333000)) 
    \axi_data_o[17]_i_2 
       (.I0(reg_uart_result[17]),
        .I1(\axi_data_o[31]_i_5_n_0 ),
        .I2(\reg_cmd_reg_n_0_[17] ),
        .I3(\axi_data_o[31]_i_2_n_0 ),
        .I4(\reg_ctrl_reg_n_0_[17] ),
        .I5(\axi_data_o[31]_i_4_n_0 ),
        .O(\axi_data_o[17]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFFFF44F444444444)) 
    \axi_data_o[18]_i_1 
       (.I0(\reg_crc_result[31]_i_3_n_0 ),
        .I1(axi_data_o[18]),
        .I2(reg_crc_result__0[18]),
        .I3(\axi_data_o[23]_i_2_n_0 ),
        .I4(\axi_data_o[18]_i_2_n_0 ),
        .I5(axi_vd_reg_i_2_n_0),
        .O(\axi_data_o[18]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0022002230333000)) 
    \axi_data_o[18]_i_2 
       (.I0(reg_uart_result[18]),
        .I1(\axi_data_o[31]_i_5_n_0 ),
        .I2(\reg_cmd_reg_n_0_[18] ),
        .I3(\axi_data_o[31]_i_2_n_0 ),
        .I4(\reg_ctrl_reg_n_0_[18] ),
        .I5(\axi_data_o[31]_i_4_n_0 ),
        .O(\axi_data_o[18]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFFFF44F444444444)) 
    \axi_data_o[19]_i_1 
       (.I0(\reg_crc_result[31]_i_3_n_0 ),
        .I1(axi_data_o[19]),
        .I2(reg_crc_result__0[19]),
        .I3(\axi_data_o[23]_i_2_n_0 ),
        .I4(\axi_data_o[19]_i_2_n_0 ),
        .I5(axi_vd_reg_i_2_n_0),
        .O(\axi_data_o[19]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0022002230333000)) 
    \axi_data_o[19]_i_2 
       (.I0(reg_uart_result[19]),
        .I1(\axi_data_o[31]_i_5_n_0 ),
        .I2(\reg_cmd_reg_n_0_[19] ),
        .I3(\axi_data_o[31]_i_2_n_0 ),
        .I4(\reg_ctrl_reg_n_0_[19] ),
        .I5(\axi_data_o[31]_i_4_n_0 ),
        .O(\axi_data_o[19]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hBABABABFAAAAAAAA)) 
    \axi_data_o[1]_i_1 
       (.I0(\axi_data_o[1]_i_2_n_0 ),
        .I1(\axi_data_o[1]_i_3_n_0 ),
        .I2(\axi_data_o[1]_i_4_n_0 ),
        .I3(\axi_data_o[1]_i_5_n_0 ),
        .I4(\axi_data_o[1]_i_6_n_0 ),
        .I5(axi_vd_reg_i_2_n_0),
        .O(\axi_data_o[1]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hAAAAAAA8)) 
    \axi_data_o[1]_i_2 
       (.I0(axi_data_o[1]),
        .I1(axi_we_i[1]),
        .I2(axi_we_i[0]),
        .I3(axi_we_i[3]),
        .I4(axi_we_i[2]),
        .O(\axi_data_o[1]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'h40447F77)) 
    \axi_data_o[1]_i_3 
       (.I0(reg_crc_result__0[1]),
        .I1(\axi_data_o[31]_i_5_n_0 ),
        .I2(\axi_data_o[31]_i_4_n_0 ),
        .I3(\axi_data_o[31]_i_2_n_0 ),
        .I4(data5[1]),
        .O(\axi_data_o[1]_i_3_n_0 ));
  LUT4 #(
    .INIT(16'h1000)) 
    \axi_data_o[1]_i_4 
       (.I0(axi_addr_i[1]),
        .I1(axi_addr_i[0]),
        .I2(axi_addr_i[4]),
        .I3(axi_addr_i[2]),
        .O(\axi_data_o[1]_i_4_n_0 ));
  LUT5 #(
    .INIT(32'hFFF4FFFA)) 
    \axi_data_o[1]_i_5 
       (.I0(axi_addr_i[2]),
        .I1(axi_addr_i[4]),
        .I2(axi_addr_i[0]),
        .I3(axi_addr_i[1]),
        .I4(axi_addr_i[3]),
        .O(\axi_data_o[1]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'h505F3030505F3F3F)) 
    \axi_data_o[1]_i_6 
       (.I0(data3[1]),
        .I1(reg_uart_result[1]),
        .I2(\axi_data_o[31]_i_4_n_0 ),
        .I3(\reg_cmd_reg_n_0_[1] ),
        .I4(\axi_data_o[31]_i_2_n_0 ),
        .I5(\reg_ctrl_reg_n_0_[1] ),
        .O(\axi_data_o[1]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'hFFFF44F444444444)) 
    \axi_data_o[20]_i_1 
       (.I0(\reg_crc_result[31]_i_3_n_0 ),
        .I1(axi_data_o[20]),
        .I2(reg_crc_result__0[20]),
        .I3(\axi_data_o[23]_i_2_n_0 ),
        .I4(\axi_data_o[20]_i_2_n_0 ),
        .I5(axi_vd_reg_i_2_n_0),
        .O(\axi_data_o[20]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0022002230333000)) 
    \axi_data_o[20]_i_2 
       (.I0(reg_uart_result[20]),
        .I1(\axi_data_o[31]_i_5_n_0 ),
        .I2(\reg_cmd_reg_n_0_[20] ),
        .I3(\axi_data_o[31]_i_2_n_0 ),
        .I4(\reg_ctrl_reg_n_0_[20] ),
        .I5(\axi_data_o[31]_i_4_n_0 ),
        .O(\axi_data_o[20]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFFFF44F444444444)) 
    \axi_data_o[21]_i_1 
       (.I0(\reg_crc_result[31]_i_3_n_0 ),
        .I1(axi_data_o[21]),
        .I2(reg_crc_result__0[21]),
        .I3(\axi_data_o[23]_i_2_n_0 ),
        .I4(\axi_data_o[21]_i_2_n_0 ),
        .I5(axi_vd_reg_i_2_n_0),
        .O(\axi_data_o[21]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0022002230333000)) 
    \axi_data_o[21]_i_2 
       (.I0(reg_uart_result[21]),
        .I1(\axi_data_o[31]_i_5_n_0 ),
        .I2(\reg_cmd_reg_n_0_[21] ),
        .I3(\axi_data_o[31]_i_2_n_0 ),
        .I4(\reg_ctrl_reg_n_0_[21] ),
        .I5(\axi_data_o[31]_i_4_n_0 ),
        .O(\axi_data_o[21]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFFFF44F444444444)) 
    \axi_data_o[22]_i_1 
       (.I0(\reg_crc_result[31]_i_3_n_0 ),
        .I1(axi_data_o[22]),
        .I2(reg_crc_result__0[22]),
        .I3(\axi_data_o[23]_i_2_n_0 ),
        .I4(\axi_data_o[22]_i_2_n_0 ),
        .I5(axi_vd_reg_i_2_n_0),
        .O(\axi_data_o[22]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0022002230333000)) 
    \axi_data_o[22]_i_2 
       (.I0(reg_uart_result[22]),
        .I1(\axi_data_o[31]_i_5_n_0 ),
        .I2(\reg_cmd_reg_n_0_[22] ),
        .I3(\axi_data_o[31]_i_2_n_0 ),
        .I4(\reg_ctrl_reg_n_0_[22] ),
        .I5(\axi_data_o[31]_i_4_n_0 ),
        .O(\axi_data_o[22]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFFFF44F444444444)) 
    \axi_data_o[23]_i_1 
       (.I0(\reg_crc_result[31]_i_3_n_0 ),
        .I1(axi_data_o[23]),
        .I2(reg_crc_result__0[23]),
        .I3(\axi_data_o[23]_i_2_n_0 ),
        .I4(\axi_data_o[23]_i_3_n_0 ),
        .I5(axi_vd_reg_i_2_n_0),
        .O(\axi_data_o[23]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hFFFFFFF7)) 
    \axi_data_o[23]_i_2 
       (.I0(axi_addr_i[2]),
        .I1(axi_addr_i[4]),
        .I2(axi_addr_i[0]),
        .I3(axi_addr_i[1]),
        .I4(axi_addr_i[3]),
        .O(\axi_data_o[23]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h0033302200003022)) 
    \axi_data_o[23]_i_3 
       (.I0(\reg_ctrl_reg_n_0_[23] ),
        .I1(\axi_data_o[31]_i_5_n_0 ),
        .I2(\reg_cmd_reg_n_0_[23] ),
        .I3(\axi_data_o[31]_i_2_n_0 ),
        .I4(\axi_data_o[31]_i_4_n_0 ),
        .I5(reg_uart_result[23]),
        .O(\axi_data_o[23]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hF4FF444444444444)) 
    \axi_data_o[24]_i_1 
       (.I0(\reg_crc_result[31]_i_3_n_0 ),
        .I1(axi_data_o[24]),
        .I2(\reg_cmd_reg_n_0_[24] ),
        .I3(\axi_data_o[31]_i_2_n_0 ),
        .I4(axi_vd_reg_i_2_n_0),
        .I5(\axi_data_o[24]_i_2_n_0 ),
        .O(\axi_data_o[24]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h002200FC)) 
    \axi_data_o[24]_i_2 
       (.I0(reg_crc_result__0[24]),
        .I1(\axi_data_o[31]_i_2_n_0 ),
        .I2(\reg_ctrl_reg_n_0_[24] ),
        .I3(\axi_data_o[31]_i_4_n_0 ),
        .I4(\axi_data_o[31]_i_5_n_0 ),
        .O(\axi_data_o[24]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hF4FF444444444444)) 
    \axi_data_o[25]_i_1 
       (.I0(\reg_crc_result[31]_i_3_n_0 ),
        .I1(axi_data_o[25]),
        .I2(\reg_cmd_reg_n_0_[25] ),
        .I3(\axi_data_o[31]_i_2_n_0 ),
        .I4(axi_vd_reg_i_2_n_0),
        .I5(\axi_data_o[25]_i_2_n_0 ),
        .O(\axi_data_o[25]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h002200FC)) 
    \axi_data_o[25]_i_2 
       (.I0(reg_crc_result__0[25]),
        .I1(\axi_data_o[31]_i_2_n_0 ),
        .I2(\reg_ctrl_reg_n_0_[25] ),
        .I3(\axi_data_o[31]_i_4_n_0 ),
        .I4(\axi_data_o[31]_i_5_n_0 ),
        .O(\axi_data_o[25]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hF4FF444444444444)) 
    \axi_data_o[26]_i_1 
       (.I0(\reg_crc_result[31]_i_3_n_0 ),
        .I1(axi_data_o[26]),
        .I2(\reg_cmd_reg_n_0_[26] ),
        .I3(\axi_data_o[31]_i_2_n_0 ),
        .I4(axi_vd_reg_i_2_n_0),
        .I5(\axi_data_o[26]_i_2_n_0 ),
        .O(\axi_data_o[26]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h002200FC)) 
    \axi_data_o[26]_i_2 
       (.I0(reg_crc_result__0[26]),
        .I1(\axi_data_o[31]_i_2_n_0 ),
        .I2(\reg_ctrl_reg_n_0_[26] ),
        .I3(\axi_data_o[31]_i_4_n_0 ),
        .I4(\axi_data_o[31]_i_5_n_0 ),
        .O(\axi_data_o[26]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hF4FF444444444444)) 
    \axi_data_o[27]_i_1 
       (.I0(\reg_crc_result[31]_i_3_n_0 ),
        .I1(axi_data_o[27]),
        .I2(\reg_cmd_reg_n_0_[27] ),
        .I3(\axi_data_o[31]_i_2_n_0 ),
        .I4(axi_vd_reg_i_2_n_0),
        .I5(\axi_data_o[27]_i_2_n_0 ),
        .O(\axi_data_o[27]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h002200FC)) 
    \axi_data_o[27]_i_2 
       (.I0(reg_crc_result__0[27]),
        .I1(\axi_data_o[31]_i_2_n_0 ),
        .I2(\reg_ctrl_reg_n_0_[27] ),
        .I3(\axi_data_o[31]_i_4_n_0 ),
        .I4(\axi_data_o[31]_i_5_n_0 ),
        .O(\axi_data_o[27]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hF4FF444444444444)) 
    \axi_data_o[28]_i_1 
       (.I0(\reg_crc_result[31]_i_3_n_0 ),
        .I1(axi_data_o[28]),
        .I2(\reg_cmd_reg_n_0_[28] ),
        .I3(\axi_data_o[31]_i_2_n_0 ),
        .I4(axi_vd_reg_i_2_n_0),
        .I5(\axi_data_o[28]_i_2_n_0 ),
        .O(\axi_data_o[28]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h002200FC)) 
    \axi_data_o[28]_i_2 
       (.I0(reg_crc_result__0[28]),
        .I1(\axi_data_o[31]_i_2_n_0 ),
        .I2(\reg_ctrl_reg_n_0_[28] ),
        .I3(\axi_data_o[31]_i_4_n_0 ),
        .I4(\axi_data_o[31]_i_5_n_0 ),
        .O(\axi_data_o[28]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hF4FF444444444444)) 
    \axi_data_o[29]_i_1 
       (.I0(\reg_crc_result[31]_i_3_n_0 ),
        .I1(axi_data_o[29]),
        .I2(\reg_cmd_reg_n_0_[29] ),
        .I3(\axi_data_o[31]_i_2_n_0 ),
        .I4(axi_vd_reg_i_2_n_0),
        .I5(\axi_data_o[29]_i_2_n_0 ),
        .O(\axi_data_o[29]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h002200FC)) 
    \axi_data_o[29]_i_2 
       (.I0(reg_crc_result__0[29]),
        .I1(\axi_data_o[31]_i_2_n_0 ),
        .I2(\reg_ctrl_reg_n_0_[29] ),
        .I3(\axi_data_o[31]_i_4_n_0 ),
        .I4(\axi_data_o[31]_i_5_n_0 ),
        .O(\axi_data_o[29]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFFFF44F444444444)) 
    \axi_data_o[2]_i_1 
       (.I0(\reg_crc_result[31]_i_3_n_0 ),
        .I1(axi_data_o[2]),
        .I2(reg_crc_result__0[2]),
        .I3(\axi_data_o[23]_i_2_n_0 ),
        .I4(\axi_data_o[2]_i_2_n_0 ),
        .I5(axi_vd_reg_i_2_n_0),
        .O(\axi_data_o[2]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0022002230333000)) 
    \axi_data_o[2]_i_2 
       (.I0(reg_uart_result[2]),
        .I1(\axi_data_o[31]_i_5_n_0 ),
        .I2(\reg_cmd_reg_n_0_[2] ),
        .I3(\axi_data_o[31]_i_2_n_0 ),
        .I4(\reg_ctrl_reg_n_0_[2] ),
        .I5(\axi_data_o[31]_i_4_n_0 ),
        .O(\axi_data_o[2]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hF4FF444444444444)) 
    \axi_data_o[30]_i_1 
       (.I0(\reg_crc_result[31]_i_3_n_0 ),
        .I1(axi_data_o[30]),
        .I2(\reg_cmd_reg_n_0_[30] ),
        .I3(\axi_data_o[31]_i_2_n_0 ),
        .I4(axi_vd_reg_i_2_n_0),
        .I5(\axi_data_o[30]_i_2_n_0 ),
        .O(\axi_data_o[30]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h002200FC)) 
    \axi_data_o[30]_i_2 
       (.I0(reg_crc_result__0[30]),
        .I1(\axi_data_o[31]_i_2_n_0 ),
        .I2(\reg_ctrl_reg_n_0_[30] ),
        .I3(\axi_data_o[31]_i_4_n_0 ),
        .I4(\axi_data_o[31]_i_5_n_0 ),
        .O(\axi_data_o[30]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hF4FF444444444444)) 
    \axi_data_o[31]_i_1 
       (.I0(\reg_crc_result[31]_i_3_n_0 ),
        .I1(axi_data_o[31]),
        .I2(\reg_cmd_reg_n_0_[31] ),
        .I3(\axi_data_o[31]_i_2_n_0 ),
        .I4(axi_vd_reg_i_2_n_0),
        .I5(\axi_data_o[31]_i_3_n_0 ),
        .O(\axi_data_o[31]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h00000086)) 
    \axi_data_o[31]_i_2 
       (.I0(axi_addr_i[3]),
        .I1(axi_addr_i[4]),
        .I2(axi_addr_i[2]),
        .I3(axi_addr_i[1]),
        .I4(axi_addr_i[0]),
        .O(\axi_data_o[31]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'h002200FC)) 
    \axi_data_o[31]_i_3 
       (.I0(reg_crc_result__0[31]),
        .I1(\axi_data_o[31]_i_2_n_0 ),
        .I2(\reg_ctrl_reg_n_0_[31] ),
        .I3(\axi_data_o[31]_i_4_n_0 ),
        .I4(\axi_data_o[31]_i_5_n_0 ),
        .O(\axi_data_o[31]_i_3_n_0 ));
  LUT4 #(
    .INIT(16'hFFF6)) 
    \axi_data_o[31]_i_4 
       (.I0(axi_addr_i[2]),
        .I1(axi_addr_i[4]),
        .I2(axi_addr_i[0]),
        .I3(axi_addr_i[1]),
        .O(\axi_data_o[31]_i_4_n_0 ));
  LUT5 #(
    .INIT(32'hFFFEEEFE)) 
    \axi_data_o[31]_i_5 
       (.I0(axi_addr_i[1]),
        .I1(axi_addr_i[0]),
        .I2(axi_addr_i[2]),
        .I3(axi_addr_i[3]),
        .I4(axi_addr_i[4]),
        .O(\axi_data_o[31]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hFFFF44F444444444)) 
    \axi_data_o[3]_i_1 
       (.I0(\reg_crc_result[31]_i_3_n_0 ),
        .I1(axi_data_o[3]),
        .I2(reg_crc_result__0[3]),
        .I3(\axi_data_o[23]_i_2_n_0 ),
        .I4(\axi_data_o[3]_i_2_n_0 ),
        .I5(axi_vd_reg_i_2_n_0),
        .O(\axi_data_o[3]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0022002230333000)) 
    \axi_data_o[3]_i_2 
       (.I0(reg_uart_result[3]),
        .I1(\axi_data_o[31]_i_5_n_0 ),
        .I2(\reg_cmd_reg_n_0_[3] ),
        .I3(\axi_data_o[31]_i_2_n_0 ),
        .I4(\reg_ctrl_reg_n_0_[3] ),
        .I5(\axi_data_o[31]_i_4_n_0 ),
        .O(\axi_data_o[3]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFFFF44F444444444)) 
    \axi_data_o[4]_i_1 
       (.I0(\reg_crc_result[31]_i_3_n_0 ),
        .I1(axi_data_o[4]),
        .I2(reg_crc_result__0[4]),
        .I3(\axi_data_o[23]_i_2_n_0 ),
        .I4(\axi_data_o[4]_i_2_n_0 ),
        .I5(axi_vd_reg_i_2_n_0),
        .O(\axi_data_o[4]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0033302200003022)) 
    \axi_data_o[4]_i_2 
       (.I0(\reg_ctrl_reg_n_0_[4] ),
        .I1(\axi_data_o[31]_i_5_n_0 ),
        .I2(\reg_cmd_reg_n_0_[4] ),
        .I3(\axi_data_o[31]_i_2_n_0 ),
        .I4(\axi_data_o[31]_i_4_n_0 ),
        .I5(reg_uart_result[4]),
        .O(\axi_data_o[4]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFFFF44F444444444)) 
    \axi_data_o[5]_i_1 
       (.I0(\reg_crc_result[31]_i_3_n_0 ),
        .I1(axi_data_o[5]),
        .I2(reg_crc_result__0[5]),
        .I3(\axi_data_o[23]_i_2_n_0 ),
        .I4(\axi_data_o[5]_i_2_n_0 ),
        .I5(axi_vd_reg_i_2_n_0),
        .O(\axi_data_o[5]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0022002230333000)) 
    \axi_data_o[5]_i_2 
       (.I0(reg_uart_result[5]),
        .I1(\axi_data_o[31]_i_5_n_0 ),
        .I2(\reg_cmd_reg_n_0_[5] ),
        .I3(\axi_data_o[31]_i_2_n_0 ),
        .I4(\reg_ctrl_reg_n_0_[5] ),
        .I5(\axi_data_o[31]_i_4_n_0 ),
        .O(\axi_data_o[5]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFFFF44F444444444)) 
    \axi_data_o[6]_i_1 
       (.I0(\reg_crc_result[31]_i_3_n_0 ),
        .I1(axi_data_o[6]),
        .I2(reg_crc_result__0[6]),
        .I3(\axi_data_o[23]_i_2_n_0 ),
        .I4(\axi_data_o[6]_i_2_n_0 ),
        .I5(axi_vd_reg_i_2_n_0),
        .O(\axi_data_o[6]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0022002230333000)) 
    \axi_data_o[6]_i_2 
       (.I0(reg_uart_result[6]),
        .I1(\axi_data_o[31]_i_5_n_0 ),
        .I2(\reg_cmd_reg_n_0_[6] ),
        .I3(\axi_data_o[31]_i_2_n_0 ),
        .I4(\reg_ctrl_reg_n_0_[6] ),
        .I5(\axi_data_o[31]_i_4_n_0 ),
        .O(\axi_data_o[6]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFFFF44F444444444)) 
    \axi_data_o[7]_i_1 
       (.I0(\reg_crc_result[31]_i_3_n_0 ),
        .I1(axi_data_o[7]),
        .I2(reg_crc_result__0[7]),
        .I3(\axi_data_o[23]_i_2_n_0 ),
        .I4(\axi_data_o[7]_i_2_n_0 ),
        .I5(axi_vd_reg_i_2_n_0),
        .O(\axi_data_o[7]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0022002230333000)) 
    \axi_data_o[7]_i_2 
       (.I0(reg_uart_result[7]),
        .I1(\axi_data_o[31]_i_5_n_0 ),
        .I2(\reg_cmd_reg_n_0_[7] ),
        .I3(\axi_data_o[31]_i_2_n_0 ),
        .I4(\reg_ctrl_reg_n_0_[7] ),
        .I5(\axi_data_o[31]_i_4_n_0 ),
        .O(\axi_data_o[7]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFFFF44F444444444)) 
    \axi_data_o[8]_i_1 
       (.I0(\reg_crc_result[31]_i_3_n_0 ),
        .I1(axi_data_o[8]),
        .I2(reg_crc_result__0[8]),
        .I3(\axi_data_o[23]_i_2_n_0 ),
        .I4(\axi_data_o[8]_i_2_n_0 ),
        .I5(axi_vd_reg_i_2_n_0),
        .O(\axi_data_o[8]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0033302200003022)) 
    \axi_data_o[8]_i_2 
       (.I0(\reg_ctrl_reg_n_0_[8] ),
        .I1(\axi_data_o[31]_i_5_n_0 ),
        .I2(\reg_cmd_reg_n_0_[8] ),
        .I3(\axi_data_o[31]_i_2_n_0 ),
        .I4(\axi_data_o[31]_i_4_n_0 ),
        .I5(reg_uart_result[8]),
        .O(\axi_data_o[8]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFFFF44F444444444)) 
    \axi_data_o[9]_i_1 
       (.I0(\reg_crc_result[31]_i_3_n_0 ),
        .I1(axi_data_o[9]),
        .I2(reg_crc_result__0[9]),
        .I3(\axi_data_o[23]_i_2_n_0 ),
        .I4(\axi_data_o[9]_i_2_n_0 ),
        .I5(axi_vd_reg_i_2_n_0),
        .O(\axi_data_o[9]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0022002230333000)) 
    \axi_data_o[9]_i_2 
       (.I0(reg_uart_result[9]),
        .I1(\axi_data_o[31]_i_5_n_0 ),
        .I2(\reg_cmd_reg_n_0_[9] ),
        .I3(\axi_data_o[31]_i_2_n_0 ),
        .I4(\reg_ctrl_reg_n_0_[9] ),
        .I5(\axi_data_o[31]_i_4_n_0 ),
        .O(\axi_data_o[9]_i_2_n_0 ));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  FDCE \axi_data_o_reg[0] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(axi_en_i),
        .CLR(rst_n_IBUF),
        .D(\axi_data_o[0]_i_1_n_0 ),
        .Q(axi_data_o[0]));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  FDCE \axi_data_o_reg[10] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(axi_en_i),
        .CLR(rst_n_IBUF),
        .D(\axi_data_o[10]_i_1_n_0 ),
        .Q(axi_data_o[10]));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  FDCE \axi_data_o_reg[11] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(axi_en_i),
        .CLR(rst_n_IBUF),
        .D(\axi_data_o[11]_i_1_n_0 ),
        .Q(axi_data_o[11]));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  FDCE \axi_data_o_reg[12] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(axi_en_i),
        .CLR(rst_n_IBUF),
        .D(\axi_data_o[12]_i_1_n_0 ),
        .Q(axi_data_o[12]));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  FDCE \axi_data_o_reg[13] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(axi_en_i),
        .CLR(rst_n_IBUF),
        .D(\axi_data_o[13]_i_1_n_0 ),
        .Q(axi_data_o[13]));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  FDCE \axi_data_o_reg[14] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(axi_en_i),
        .CLR(rst_n_IBUF),
        .D(\axi_data_o[14]_i_1_n_0 ),
        .Q(axi_data_o[14]));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  FDCE \axi_data_o_reg[15] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(axi_en_i),
        .CLR(rst_n_IBUF),
        .D(\axi_data_o[15]_i_1_n_0 ),
        .Q(axi_data_o[15]));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  FDCE \axi_data_o_reg[16] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(axi_en_i),
        .CLR(rst_n_IBUF),
        .D(\axi_data_o[16]_i_1_n_0 ),
        .Q(axi_data_o[16]));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  FDCE \axi_data_o_reg[17] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(axi_en_i),
        .CLR(rst_n_IBUF),
        .D(\axi_data_o[17]_i_1_n_0 ),
        .Q(axi_data_o[17]));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  FDCE \axi_data_o_reg[18] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(axi_en_i),
        .CLR(rst_n_IBUF),
        .D(\axi_data_o[18]_i_1_n_0 ),
        .Q(axi_data_o[18]));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  FDCE \axi_data_o_reg[19] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(axi_en_i),
        .CLR(rst_n_IBUF),
        .D(\axi_data_o[19]_i_1_n_0 ),
        .Q(axi_data_o[19]));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  FDCE \axi_data_o_reg[1] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(axi_en_i),
        .CLR(rst_n_IBUF),
        .D(\axi_data_o[1]_i_1_n_0 ),
        .Q(axi_data_o[1]));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  FDCE \axi_data_o_reg[20] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(axi_en_i),
        .CLR(rst_n_IBUF),
        .D(\axi_data_o[20]_i_1_n_0 ),
        .Q(axi_data_o[20]));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  FDCE \axi_data_o_reg[21] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(axi_en_i),
        .CLR(rst_n_IBUF),
        .D(\axi_data_o[21]_i_1_n_0 ),
        .Q(axi_data_o[21]));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  FDCE \axi_data_o_reg[22] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(axi_en_i),
        .CLR(rst_n_IBUF),
        .D(\axi_data_o[22]_i_1_n_0 ),
        .Q(axi_data_o[22]));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  FDCE \axi_data_o_reg[23] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(axi_en_i),
        .CLR(rst_n_IBUF),
        .D(\axi_data_o[23]_i_1_n_0 ),
        .Q(axi_data_o[23]));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  FDCE \axi_data_o_reg[24] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(axi_en_i),
        .CLR(rst_n_IBUF),
        .D(\axi_data_o[24]_i_1_n_0 ),
        .Q(axi_data_o[24]));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  FDCE \axi_data_o_reg[25] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(axi_en_i),
        .CLR(rst_n_IBUF),
        .D(\axi_data_o[25]_i_1_n_0 ),
        .Q(axi_data_o[25]));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  FDCE \axi_data_o_reg[26] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(axi_en_i),
        .CLR(rst_n_IBUF),
        .D(\axi_data_o[26]_i_1_n_0 ),
        .Q(axi_data_o[26]));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  FDCE \axi_data_o_reg[27] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(axi_en_i),
        .CLR(rst_n_IBUF),
        .D(\axi_data_o[27]_i_1_n_0 ),
        .Q(axi_data_o[27]));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  FDCE \axi_data_o_reg[28] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(axi_en_i),
        .CLR(rst_n_IBUF),
        .D(\axi_data_o[28]_i_1_n_0 ),
        .Q(axi_data_o[28]));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  FDCE \axi_data_o_reg[29] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(axi_en_i),
        .CLR(rst_n_IBUF),
        .D(\axi_data_o[29]_i_1_n_0 ),
        .Q(axi_data_o[29]));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  FDCE \axi_data_o_reg[2] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(axi_en_i),
        .CLR(rst_n_IBUF),
        .D(\axi_data_o[2]_i_1_n_0 ),
        .Q(axi_data_o[2]));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  FDCE \axi_data_o_reg[30] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(axi_en_i),
        .CLR(rst_n_IBUF),
        .D(\axi_data_o[30]_i_1_n_0 ),
        .Q(axi_data_o[30]));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  FDCE \axi_data_o_reg[31] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(axi_en_i),
        .CLR(rst_n_IBUF),
        .D(\axi_data_o[31]_i_1_n_0 ),
        .Q(axi_data_o[31]));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  FDCE \axi_data_o_reg[3] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(axi_en_i),
        .CLR(rst_n_IBUF),
        .D(\axi_data_o[3]_i_1_n_0 ),
        .Q(axi_data_o[3]));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  FDCE \axi_data_o_reg[4] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(axi_en_i),
        .CLR(rst_n_IBUF),
        .D(\axi_data_o[4]_i_1_n_0 ),
        .Q(axi_data_o[4]));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  FDCE \axi_data_o_reg[5] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(axi_en_i),
        .CLR(rst_n_IBUF),
        .D(\axi_data_o[5]_i_1_n_0 ),
        .Q(axi_data_o[5]));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  FDCE \axi_data_o_reg[6] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(axi_en_i),
        .CLR(rst_n_IBUF),
        .D(\axi_data_o[6]_i_1_n_0 ),
        .Q(axi_data_o[6]));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  FDCE \axi_data_o_reg[7] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(axi_en_i),
        .CLR(rst_n_IBUF),
        .D(\axi_data_o[7]_i_1_n_0 ),
        .Q(axi_data_o[7]));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  FDCE \axi_data_o_reg[8] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(axi_en_i),
        .CLR(rst_n_IBUF),
        .D(\axi_data_o[8]_i_1_n_0 ),
        .Q(axi_data_o[8]));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  FDCE \axi_data_o_reg[9] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(axi_en_i),
        .CLR(rst_n_IBUF),
        .D(\axi_data_o[9]_i_1_n_0 ),
        .Q(axi_data_o[9]));
  LUT6 #(
    .INIT(64'h00000000DB000000)) 
    axi_vd_reg_i_1
       (.I0(axi_addr_i[3]),
        .I1(axi_addr_i[2]),
        .I2(axi_addr_i[4]),
        .I3(axi_vd_reg_i_2_n_0),
        .I4(axi_en_i),
        .I5(axi_vd_reg_i_3_n_0),
        .O(axi_vd_reg2_out));
  LUT4 #(
    .INIT(16'h0002)) 
    axi_vd_reg_i_2
       (.I0(\reg_crc_result[31]_i_3_n_0 ),
        .I1(axi_addr_i[6]),
        .I2(axi_addr_i[7]),
        .I3(axi_addr_i[5]),
        .O(axi_vd_reg_i_2_n_0));
  LUT2 #(
    .INIT(4'hE)) 
    axi_vd_reg_i_3
       (.I0(axi_addr_i[0]),
        .I1(axi_addr_i[1]),
        .O(axi_vd_reg_i_3_n_0));
  FDCE axi_vd_reg_reg
       (.C(sys_clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(rst_n_IBUF),
        .D(axi_vd_reg2_out),
        .Q(axi_vd_o));
  FDCE crc_done_flag_reg
       (.C(sys_clk_IBUF_BUFG),
        .CE(\reg_crc_result[31]_i_1_n_0 ),
        .CLR(rst_n_IBUF),
        .D(crc_done_i),
        .Q(data5[0]));
  LUT5 #(
    .INIT(32'hBFFFAAAA)) 
    crc_match_flag_i_1
       (.I0(crc_match),
        .I1(\reg_ctrl[31]_i_3_n_0 ),
        .I2(\reg_crc_result[31]_i_4_n_0 ),
        .I3(axi_addr_i[5]),
        .I4(data5[1]),
        .O(crc_match_flag_i_1_n_0));
  FDCE crc_match_flag_reg
       (.C(sys_clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(rst_n_IBUF),
        .D(crc_match_flag_i_1_n_0),
        .Q(data5[1]));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  FDCE module_enable_reg
       (.C(sys_clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(rst_n_IBUF),
        .D(\reg_ctrl_reg_n_0_[0] ),
        .Q(module_enable));
  LUT5 #(
    .INIT(32'h00000020)) 
    \reg_cmd[31]_i_1 
       (.I0(\reg_ctrl[31]_i_3_n_0 ),
        .I1(axi_addr_i[4]),
        .I2(axi_addr_i[3]),
        .I3(axi_addr_i[2]),
        .I4(\reg_cmd[31]_i_2_n_0 ),
        .O(reg_cmd0));
  LUT3 #(
    .INIT(8'hFE)) 
    \reg_cmd[31]_i_2 
       (.I0(axi_addr_i[5]),
        .I1(axi_addr_i[7]),
        .I2(axi_addr_i[6]),
        .O(\reg_cmd[31]_i_2_n_0 ));
  FDCE \reg_cmd_reg[0] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(reg_cmd0),
        .CLR(rst_n_IBUF),
        .D(axi_data_i[0]),
        .Q(\reg_cmd_reg_n_0_[0] ));
  FDCE \reg_cmd_reg[10] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(reg_cmd0),
        .CLR(rst_n_IBUF),
        .D(axi_data_i[10]),
        .Q(\reg_cmd_reg_n_0_[10] ));
  FDCE \reg_cmd_reg[11] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(reg_cmd0),
        .CLR(rst_n_IBUF),
        .D(axi_data_i[11]),
        .Q(\reg_cmd_reg_n_0_[11] ));
  FDCE \reg_cmd_reg[12] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(reg_cmd0),
        .CLR(rst_n_IBUF),
        .D(axi_data_i[12]),
        .Q(\reg_cmd_reg_n_0_[12] ));
  FDCE \reg_cmd_reg[13] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(reg_cmd0),
        .CLR(rst_n_IBUF),
        .D(axi_data_i[13]),
        .Q(\reg_cmd_reg_n_0_[13] ));
  FDCE \reg_cmd_reg[14] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(reg_cmd0),
        .CLR(rst_n_IBUF),
        .D(axi_data_i[14]),
        .Q(\reg_cmd_reg_n_0_[14] ));
  FDCE \reg_cmd_reg[15] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(reg_cmd0),
        .CLR(rst_n_IBUF),
        .D(axi_data_i[15]),
        .Q(\reg_cmd_reg_n_0_[15] ));
  FDCE \reg_cmd_reg[16] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(reg_cmd0),
        .CLR(rst_n_IBUF),
        .D(axi_data_i[16]),
        .Q(\reg_cmd_reg_n_0_[16] ));
  FDCE \reg_cmd_reg[17] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(reg_cmd0),
        .CLR(rst_n_IBUF),
        .D(axi_data_i[17]),
        .Q(\reg_cmd_reg_n_0_[17] ));
  FDCE \reg_cmd_reg[18] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(reg_cmd0),
        .CLR(rst_n_IBUF),
        .D(axi_data_i[18]),
        .Q(\reg_cmd_reg_n_0_[18] ));
  FDCE \reg_cmd_reg[19] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(reg_cmd0),
        .CLR(rst_n_IBUF),
        .D(axi_data_i[19]),
        .Q(\reg_cmd_reg_n_0_[19] ));
  FDCE \reg_cmd_reg[1] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(reg_cmd0),
        .CLR(rst_n_IBUF),
        .D(axi_data_i[1]),
        .Q(\reg_cmd_reg_n_0_[1] ));
  FDCE \reg_cmd_reg[20] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(reg_cmd0),
        .CLR(rst_n_IBUF),
        .D(axi_data_i[20]),
        .Q(\reg_cmd_reg_n_0_[20] ));
  FDCE \reg_cmd_reg[21] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(reg_cmd0),
        .CLR(rst_n_IBUF),
        .D(axi_data_i[21]),
        .Q(\reg_cmd_reg_n_0_[21] ));
  FDCE \reg_cmd_reg[22] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(reg_cmd0),
        .CLR(rst_n_IBUF),
        .D(axi_data_i[22]),
        .Q(\reg_cmd_reg_n_0_[22] ));
  FDCE \reg_cmd_reg[23] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(reg_cmd0),
        .CLR(rst_n_IBUF),
        .D(axi_data_i[23]),
        .Q(\reg_cmd_reg_n_0_[23] ));
  FDCE \reg_cmd_reg[24] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(reg_cmd0),
        .CLR(rst_n_IBUF),
        .D(axi_data_i[24]),
        .Q(\reg_cmd_reg_n_0_[24] ));
  FDCE \reg_cmd_reg[25] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(reg_cmd0),
        .CLR(rst_n_IBUF),
        .D(axi_data_i[25]),
        .Q(\reg_cmd_reg_n_0_[25] ));
  FDCE \reg_cmd_reg[26] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(reg_cmd0),
        .CLR(rst_n_IBUF),
        .D(axi_data_i[26]),
        .Q(\reg_cmd_reg_n_0_[26] ));
  FDCE \reg_cmd_reg[27] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(reg_cmd0),
        .CLR(rst_n_IBUF),
        .D(axi_data_i[27]),
        .Q(\reg_cmd_reg_n_0_[27] ));
  FDCE \reg_cmd_reg[28] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(reg_cmd0),
        .CLR(rst_n_IBUF),
        .D(axi_data_i[28]),
        .Q(\reg_cmd_reg_n_0_[28] ));
  FDCE \reg_cmd_reg[29] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(reg_cmd0),
        .CLR(rst_n_IBUF),
        .D(axi_data_i[29]),
        .Q(\reg_cmd_reg_n_0_[29] ));
  FDCE \reg_cmd_reg[2] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(reg_cmd0),
        .CLR(rst_n_IBUF),
        .D(axi_data_i[2]),
        .Q(\reg_cmd_reg_n_0_[2] ));
  FDCE \reg_cmd_reg[30] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(reg_cmd0),
        .CLR(rst_n_IBUF),
        .D(axi_data_i[30]),
        .Q(\reg_cmd_reg_n_0_[30] ));
  FDCE \reg_cmd_reg[31] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(reg_cmd0),
        .CLR(rst_n_IBUF),
        .D(axi_data_i[31]),
        .Q(\reg_cmd_reg_n_0_[31] ));
  FDCE \reg_cmd_reg[3] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(reg_cmd0),
        .CLR(rst_n_IBUF),
        .D(axi_data_i[3]),
        .Q(\reg_cmd_reg_n_0_[3] ));
  FDCE \reg_cmd_reg[4] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(reg_cmd0),
        .CLR(rst_n_IBUF),
        .D(axi_data_i[4]),
        .Q(\reg_cmd_reg_n_0_[4] ));
  FDCE \reg_cmd_reg[5] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(reg_cmd0),
        .CLR(rst_n_IBUF),
        .D(axi_data_i[5]),
        .Q(\reg_cmd_reg_n_0_[5] ));
  FDCE \reg_cmd_reg[6] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(reg_cmd0),
        .CLR(rst_n_IBUF),
        .D(axi_data_i[6]),
        .Q(\reg_cmd_reg_n_0_[6] ));
  FDCE \reg_cmd_reg[7] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(reg_cmd0),
        .CLR(rst_n_IBUF),
        .D(axi_data_i[7]),
        .Q(\reg_cmd_reg_n_0_[7] ));
  FDCE \reg_cmd_reg[8] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(reg_cmd0),
        .CLR(rst_n_IBUF),
        .D(axi_data_i[8]),
        .Q(\reg_cmd_reg_n_0_[8] ));
  FDCE \reg_cmd_reg[9] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(reg_cmd0),
        .CLR(rst_n_IBUF),
        .D(axi_data_i[9]),
        .Q(\reg_cmd_reg_n_0_[9] ));
  LUT2 #(
    .INIT(4'h8)) 
    \reg_crc_result[0]_i_1 
       (.I0(crc_done_i),
        .I1(crc_result_i[0]),
        .O(\reg_crc_result[0]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \reg_crc_result[10]_i_1 
       (.I0(crc_done_i),
        .I1(crc_result_i[10]),
        .O(\reg_crc_result[10]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \reg_crc_result[11]_i_1 
       (.I0(crc_done_i),
        .I1(crc_result_i[11]),
        .O(\reg_crc_result[11]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \reg_crc_result[12]_i_1 
       (.I0(crc_done_i),
        .I1(crc_result_i[12]),
        .O(\reg_crc_result[12]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \reg_crc_result[13]_i_1 
       (.I0(crc_done_i),
        .I1(crc_result_i[13]),
        .O(\reg_crc_result[13]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \reg_crc_result[14]_i_1 
       (.I0(crc_done_i),
        .I1(crc_result_i[14]),
        .O(\reg_crc_result[14]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \reg_crc_result[15]_i_1 
       (.I0(crc_done_i),
        .I1(crc_result_i[15]),
        .O(\reg_crc_result[15]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \reg_crc_result[16]_i_1 
       (.I0(crc_done_i),
        .I1(crc_result_i[16]),
        .O(\reg_crc_result[16]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \reg_crc_result[17]_i_1 
       (.I0(crc_done_i),
        .I1(crc_result_i[17]),
        .O(\reg_crc_result[17]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \reg_crc_result[18]_i_1 
       (.I0(crc_done_i),
        .I1(crc_result_i[18]),
        .O(\reg_crc_result[18]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \reg_crc_result[19]_i_1 
       (.I0(crc_done_i),
        .I1(crc_result_i[19]),
        .O(\reg_crc_result[19]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \reg_crc_result[1]_i_1 
       (.I0(crc_done_i),
        .I1(crc_result_i[1]),
        .O(\reg_crc_result[1]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \reg_crc_result[20]_i_1 
       (.I0(crc_done_i),
        .I1(crc_result_i[20]),
        .O(\reg_crc_result[20]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \reg_crc_result[21]_i_1 
       (.I0(crc_done_i),
        .I1(crc_result_i[21]),
        .O(\reg_crc_result[21]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \reg_crc_result[22]_i_1 
       (.I0(crc_done_i),
        .I1(crc_result_i[22]),
        .O(\reg_crc_result[22]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \reg_crc_result[23]_i_1 
       (.I0(crc_done_i),
        .I1(crc_result_i[23]),
        .O(\reg_crc_result[23]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \reg_crc_result[24]_i_1 
       (.I0(crc_done_i),
        .I1(crc_result_i[24]),
        .O(\reg_crc_result[24]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \reg_crc_result[25]_i_1 
       (.I0(crc_done_i),
        .I1(crc_result_i[25]),
        .O(\reg_crc_result[25]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \reg_crc_result[26]_i_1 
       (.I0(crc_done_i),
        .I1(crc_result_i[26]),
        .O(\reg_crc_result[26]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \reg_crc_result[27]_i_1 
       (.I0(crc_done_i),
        .I1(crc_result_i[27]),
        .O(\reg_crc_result[27]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \reg_crc_result[28]_i_1 
       (.I0(crc_done_i),
        .I1(crc_result_i[28]),
        .O(\reg_crc_result[28]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \reg_crc_result[29]_i_1 
       (.I0(crc_done_i),
        .I1(crc_result_i[29]),
        .O(\reg_crc_result[29]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \reg_crc_result[2]_i_1 
       (.I0(crc_done_i),
        .I1(crc_result_i[2]),
        .O(\reg_crc_result[2]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \reg_crc_result[30]_i_1 
       (.I0(crc_done_i),
        .I1(crc_result_i[30]),
        .O(\reg_crc_result[30]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAABAAAAAAAAAAAAA)) 
    \reg_crc_result[31]_i_1 
       (.I0(crc_done_i),
        .I1(\reg_crc_result[31]_i_3_n_0 ),
        .I2(axi_en_i),
        .I3(axi_vd_reg_i_3_n_0),
        .I4(\reg_crc_result[31]_i_4_n_0 ),
        .I5(axi_addr_i[5]),
        .O(\reg_crc_result[31]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \reg_crc_result[31]_i_2 
       (.I0(crc_done_i),
        .I1(crc_result_i[31]),
        .O(\reg_crc_result[31]_i_2_n_0 ));
  LUT4 #(
    .INIT(16'h0001)) 
    \reg_crc_result[31]_i_3 
       (.I0(axi_we_i[2]),
        .I1(axi_we_i[3]),
        .I2(axi_we_i[0]),
        .I3(axi_we_i[1]),
        .O(\reg_crc_result[31]_i_3_n_0 ));
  LUT5 #(
    .INIT(32'h00000001)) 
    \reg_crc_result[31]_i_4 
       (.I0(axi_addr_i[7]),
        .I1(axi_addr_i[6]),
        .I2(axi_addr_i[4]),
        .I3(axi_addr_i[3]),
        .I4(axi_addr_i[2]),
        .O(\reg_crc_result[31]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \reg_crc_result[3]_i_1 
       (.I0(crc_done_i),
        .I1(crc_result_i[3]),
        .O(\reg_crc_result[3]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \reg_crc_result[4]_i_1 
       (.I0(crc_done_i),
        .I1(crc_result_i[4]),
        .O(\reg_crc_result[4]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \reg_crc_result[5]_i_1 
       (.I0(crc_done_i),
        .I1(crc_result_i[5]),
        .O(\reg_crc_result[5]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \reg_crc_result[6]_i_1 
       (.I0(crc_done_i),
        .I1(crc_result_i[6]),
        .O(\reg_crc_result[6]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \reg_crc_result[7]_i_1 
       (.I0(crc_done_i),
        .I1(crc_result_i[7]),
        .O(\reg_crc_result[7]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \reg_crc_result[8]_i_1 
       (.I0(crc_done_i),
        .I1(crc_result_i[8]),
        .O(\reg_crc_result[8]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \reg_crc_result[9]_i_1 
       (.I0(crc_done_i),
        .I1(crc_result_i[9]),
        .O(\reg_crc_result[9]_i_1_n_0 ));
  FDCE \reg_crc_result_reg[0] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(\reg_crc_result[31]_i_1_n_0 ),
        .CLR(rst_n_IBUF),
        .D(\reg_crc_result[0]_i_1_n_0 ),
        .Q(reg_crc_result__0[0]));
  FDCE \reg_crc_result_reg[10] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(\reg_crc_result[31]_i_1_n_0 ),
        .CLR(rst_n_IBUF),
        .D(\reg_crc_result[10]_i_1_n_0 ),
        .Q(reg_crc_result__0[10]));
  FDCE \reg_crc_result_reg[11] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(\reg_crc_result[31]_i_1_n_0 ),
        .CLR(rst_n_IBUF),
        .D(\reg_crc_result[11]_i_1_n_0 ),
        .Q(reg_crc_result__0[11]));
  FDCE \reg_crc_result_reg[12] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(\reg_crc_result[31]_i_1_n_0 ),
        .CLR(rst_n_IBUF),
        .D(\reg_crc_result[12]_i_1_n_0 ),
        .Q(reg_crc_result__0[12]));
  FDCE \reg_crc_result_reg[13] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(\reg_crc_result[31]_i_1_n_0 ),
        .CLR(rst_n_IBUF),
        .D(\reg_crc_result[13]_i_1_n_0 ),
        .Q(reg_crc_result__0[13]));
  FDCE \reg_crc_result_reg[14] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(\reg_crc_result[31]_i_1_n_0 ),
        .CLR(rst_n_IBUF),
        .D(\reg_crc_result[14]_i_1_n_0 ),
        .Q(reg_crc_result__0[14]));
  FDCE \reg_crc_result_reg[15] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(\reg_crc_result[31]_i_1_n_0 ),
        .CLR(rst_n_IBUF),
        .D(\reg_crc_result[15]_i_1_n_0 ),
        .Q(reg_crc_result__0[15]));
  FDCE \reg_crc_result_reg[16] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(\reg_crc_result[31]_i_1_n_0 ),
        .CLR(rst_n_IBUF),
        .D(\reg_crc_result[16]_i_1_n_0 ),
        .Q(reg_crc_result__0[16]));
  FDCE \reg_crc_result_reg[17] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(\reg_crc_result[31]_i_1_n_0 ),
        .CLR(rst_n_IBUF),
        .D(\reg_crc_result[17]_i_1_n_0 ),
        .Q(reg_crc_result__0[17]));
  FDCE \reg_crc_result_reg[18] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(\reg_crc_result[31]_i_1_n_0 ),
        .CLR(rst_n_IBUF),
        .D(\reg_crc_result[18]_i_1_n_0 ),
        .Q(reg_crc_result__0[18]));
  FDCE \reg_crc_result_reg[19] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(\reg_crc_result[31]_i_1_n_0 ),
        .CLR(rst_n_IBUF),
        .D(\reg_crc_result[19]_i_1_n_0 ),
        .Q(reg_crc_result__0[19]));
  FDCE \reg_crc_result_reg[1] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(\reg_crc_result[31]_i_1_n_0 ),
        .CLR(rst_n_IBUF),
        .D(\reg_crc_result[1]_i_1_n_0 ),
        .Q(reg_crc_result__0[1]));
  FDCE \reg_crc_result_reg[20] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(\reg_crc_result[31]_i_1_n_0 ),
        .CLR(rst_n_IBUF),
        .D(\reg_crc_result[20]_i_1_n_0 ),
        .Q(reg_crc_result__0[20]));
  FDCE \reg_crc_result_reg[21] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(\reg_crc_result[31]_i_1_n_0 ),
        .CLR(rst_n_IBUF),
        .D(\reg_crc_result[21]_i_1_n_0 ),
        .Q(reg_crc_result__0[21]));
  FDCE \reg_crc_result_reg[22] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(\reg_crc_result[31]_i_1_n_0 ),
        .CLR(rst_n_IBUF),
        .D(\reg_crc_result[22]_i_1_n_0 ),
        .Q(reg_crc_result__0[22]));
  FDCE \reg_crc_result_reg[23] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(\reg_crc_result[31]_i_1_n_0 ),
        .CLR(rst_n_IBUF),
        .D(\reg_crc_result[23]_i_1_n_0 ),
        .Q(reg_crc_result__0[23]));
  FDCE \reg_crc_result_reg[24] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(\reg_crc_result[31]_i_1_n_0 ),
        .CLR(rst_n_IBUF),
        .D(\reg_crc_result[24]_i_1_n_0 ),
        .Q(reg_crc_result__0[24]));
  FDCE \reg_crc_result_reg[25] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(\reg_crc_result[31]_i_1_n_0 ),
        .CLR(rst_n_IBUF),
        .D(\reg_crc_result[25]_i_1_n_0 ),
        .Q(reg_crc_result__0[25]));
  FDCE \reg_crc_result_reg[26] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(\reg_crc_result[31]_i_1_n_0 ),
        .CLR(rst_n_IBUF),
        .D(\reg_crc_result[26]_i_1_n_0 ),
        .Q(reg_crc_result__0[26]));
  FDCE \reg_crc_result_reg[27] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(\reg_crc_result[31]_i_1_n_0 ),
        .CLR(rst_n_IBUF),
        .D(\reg_crc_result[27]_i_1_n_0 ),
        .Q(reg_crc_result__0[27]));
  FDCE \reg_crc_result_reg[28] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(\reg_crc_result[31]_i_1_n_0 ),
        .CLR(rst_n_IBUF),
        .D(\reg_crc_result[28]_i_1_n_0 ),
        .Q(reg_crc_result__0[28]));
  FDCE \reg_crc_result_reg[29] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(\reg_crc_result[31]_i_1_n_0 ),
        .CLR(rst_n_IBUF),
        .D(\reg_crc_result[29]_i_1_n_0 ),
        .Q(reg_crc_result__0[29]));
  FDCE \reg_crc_result_reg[2] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(\reg_crc_result[31]_i_1_n_0 ),
        .CLR(rst_n_IBUF),
        .D(\reg_crc_result[2]_i_1_n_0 ),
        .Q(reg_crc_result__0[2]));
  FDCE \reg_crc_result_reg[30] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(\reg_crc_result[31]_i_1_n_0 ),
        .CLR(rst_n_IBUF),
        .D(\reg_crc_result[30]_i_1_n_0 ),
        .Q(reg_crc_result__0[30]));
  FDCE \reg_crc_result_reg[31] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(\reg_crc_result[31]_i_1_n_0 ),
        .CLR(rst_n_IBUF),
        .D(\reg_crc_result[31]_i_2_n_0 ),
        .Q(reg_crc_result__0[31]));
  FDCE \reg_crc_result_reg[3] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(\reg_crc_result[31]_i_1_n_0 ),
        .CLR(rst_n_IBUF),
        .D(\reg_crc_result[3]_i_1_n_0 ),
        .Q(reg_crc_result__0[3]));
  FDCE \reg_crc_result_reg[4] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(\reg_crc_result[31]_i_1_n_0 ),
        .CLR(rst_n_IBUF),
        .D(\reg_crc_result[4]_i_1_n_0 ),
        .Q(reg_crc_result__0[4]));
  FDCE \reg_crc_result_reg[5] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(\reg_crc_result[31]_i_1_n_0 ),
        .CLR(rst_n_IBUF),
        .D(\reg_crc_result[5]_i_1_n_0 ),
        .Q(reg_crc_result__0[5]));
  FDCE \reg_crc_result_reg[6] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(\reg_crc_result[31]_i_1_n_0 ),
        .CLR(rst_n_IBUF),
        .D(\reg_crc_result[6]_i_1_n_0 ),
        .Q(reg_crc_result__0[6]));
  FDCE \reg_crc_result_reg[7] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(\reg_crc_result[31]_i_1_n_0 ),
        .CLR(rst_n_IBUF),
        .D(\reg_crc_result[7]_i_1_n_0 ),
        .Q(reg_crc_result__0[7]));
  FDCE \reg_crc_result_reg[8] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(\reg_crc_result[31]_i_1_n_0 ),
        .CLR(rst_n_IBUF),
        .D(\reg_crc_result[8]_i_1_n_0 ),
        .Q(reg_crc_result__0[8]));
  FDCE \reg_crc_result_reg[9] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(\reg_crc_result[31]_i_1_n_0 ),
        .CLR(rst_n_IBUF),
        .D(\reg_crc_result[9]_i_1_n_0 ),
        .Q(reg_crc_result__0[9]));
  LUT6 #(
    .INIT(64'h0000000100000000)) 
    \reg_ctrl[31]_i_1 
       (.I0(axi_addr_i[5]),
        .I1(\reg_ctrl[31]_i_2_n_0 ),
        .I2(axi_addr_i[4]),
        .I3(axi_addr_i[3]),
        .I4(axi_addr_i[2]),
        .I5(\reg_ctrl[31]_i_3_n_0 ),
        .O(reg_ctrl));
  LUT2 #(
    .INIT(4'hE)) 
    \reg_ctrl[31]_i_2 
       (.I0(axi_addr_i[6]),
        .I1(axi_addr_i[7]),
        .O(\reg_ctrl[31]_i_2_n_0 ));
  LUT4 #(
    .INIT(16'h0010)) 
    \reg_ctrl[31]_i_3 
       (.I0(axi_addr_i[0]),
        .I1(axi_addr_i[1]),
        .I2(axi_en_i),
        .I3(\reg_crc_result[31]_i_3_n_0 ),
        .O(\reg_ctrl[31]_i_3_n_0 ));
  FDCE \reg_ctrl_reg[0] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(reg_ctrl),
        .CLR(rst_n_IBUF),
        .D(axi_data_i[0]),
        .Q(\reg_ctrl_reg_n_0_[0] ));
  FDCE \reg_ctrl_reg[10] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(reg_ctrl),
        .CLR(rst_n_IBUF),
        .D(axi_data_i[10]),
        .Q(\reg_ctrl_reg_n_0_[10] ));
  FDCE \reg_ctrl_reg[11] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(reg_ctrl),
        .CLR(rst_n_IBUF),
        .D(axi_data_i[11]),
        .Q(\reg_ctrl_reg_n_0_[11] ));
  FDCE \reg_ctrl_reg[12] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(reg_ctrl),
        .CLR(rst_n_IBUF),
        .D(axi_data_i[12]),
        .Q(\reg_ctrl_reg_n_0_[12] ));
  FDCE \reg_ctrl_reg[13] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(reg_ctrl),
        .CLR(rst_n_IBUF),
        .D(axi_data_i[13]),
        .Q(\reg_ctrl_reg_n_0_[13] ));
  FDCE \reg_ctrl_reg[14] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(reg_ctrl),
        .CLR(rst_n_IBUF),
        .D(axi_data_i[14]),
        .Q(\reg_ctrl_reg_n_0_[14] ));
  FDCE \reg_ctrl_reg[15] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(reg_ctrl),
        .CLR(rst_n_IBUF),
        .D(axi_data_i[15]),
        .Q(\reg_ctrl_reg_n_0_[15] ));
  FDCE \reg_ctrl_reg[16] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(reg_ctrl),
        .CLR(rst_n_IBUF),
        .D(axi_data_i[16]),
        .Q(\reg_ctrl_reg_n_0_[16] ));
  FDCE \reg_ctrl_reg[17] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(reg_ctrl),
        .CLR(rst_n_IBUF),
        .D(axi_data_i[17]),
        .Q(\reg_ctrl_reg_n_0_[17] ));
  FDCE \reg_ctrl_reg[18] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(reg_ctrl),
        .CLR(rst_n_IBUF),
        .D(axi_data_i[18]),
        .Q(\reg_ctrl_reg_n_0_[18] ));
  FDCE \reg_ctrl_reg[19] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(reg_ctrl),
        .CLR(rst_n_IBUF),
        .D(axi_data_i[19]),
        .Q(\reg_ctrl_reg_n_0_[19] ));
  FDCE \reg_ctrl_reg[1] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(reg_ctrl),
        .CLR(rst_n_IBUF),
        .D(axi_data_i[1]),
        .Q(\reg_ctrl_reg_n_0_[1] ));
  FDCE \reg_ctrl_reg[20] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(reg_ctrl),
        .CLR(rst_n_IBUF),
        .D(axi_data_i[20]),
        .Q(\reg_ctrl_reg_n_0_[20] ));
  FDCE \reg_ctrl_reg[21] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(reg_ctrl),
        .CLR(rst_n_IBUF),
        .D(axi_data_i[21]),
        .Q(\reg_ctrl_reg_n_0_[21] ));
  FDCE \reg_ctrl_reg[22] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(reg_ctrl),
        .CLR(rst_n_IBUF),
        .D(axi_data_i[22]),
        .Q(\reg_ctrl_reg_n_0_[22] ));
  FDCE \reg_ctrl_reg[23] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(reg_ctrl),
        .CLR(rst_n_IBUF),
        .D(axi_data_i[23]),
        .Q(\reg_ctrl_reg_n_0_[23] ));
  FDCE \reg_ctrl_reg[24] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(reg_ctrl),
        .CLR(rst_n_IBUF),
        .D(axi_data_i[24]),
        .Q(\reg_ctrl_reg_n_0_[24] ));
  FDCE \reg_ctrl_reg[25] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(reg_ctrl),
        .CLR(rst_n_IBUF),
        .D(axi_data_i[25]),
        .Q(\reg_ctrl_reg_n_0_[25] ));
  FDCE \reg_ctrl_reg[26] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(reg_ctrl),
        .CLR(rst_n_IBUF),
        .D(axi_data_i[26]),
        .Q(\reg_ctrl_reg_n_0_[26] ));
  FDCE \reg_ctrl_reg[27] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(reg_ctrl),
        .CLR(rst_n_IBUF),
        .D(axi_data_i[27]),
        .Q(\reg_ctrl_reg_n_0_[27] ));
  FDCE \reg_ctrl_reg[28] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(reg_ctrl),
        .CLR(rst_n_IBUF),
        .D(axi_data_i[28]),
        .Q(\reg_ctrl_reg_n_0_[28] ));
  FDCE \reg_ctrl_reg[29] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(reg_ctrl),
        .CLR(rst_n_IBUF),
        .D(axi_data_i[29]),
        .Q(\reg_ctrl_reg_n_0_[29] ));
  FDCE \reg_ctrl_reg[2] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(reg_ctrl),
        .CLR(rst_n_IBUF),
        .D(axi_data_i[2]),
        .Q(\reg_ctrl_reg_n_0_[2] ));
  FDCE \reg_ctrl_reg[30] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(reg_ctrl),
        .CLR(rst_n_IBUF),
        .D(axi_data_i[30]),
        .Q(\reg_ctrl_reg_n_0_[30] ));
  FDCE \reg_ctrl_reg[31] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(reg_ctrl),
        .CLR(rst_n_IBUF),
        .D(axi_data_i[31]),
        .Q(\reg_ctrl_reg_n_0_[31] ));
  FDCE \reg_ctrl_reg[3] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(reg_ctrl),
        .CLR(rst_n_IBUF),
        .D(axi_data_i[3]),
        .Q(\reg_ctrl_reg_n_0_[3] ));
  FDCE \reg_ctrl_reg[4] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(reg_ctrl),
        .CLR(rst_n_IBUF),
        .D(axi_data_i[4]),
        .Q(\reg_ctrl_reg_n_0_[4] ));
  FDCE \reg_ctrl_reg[5] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(reg_ctrl),
        .CLR(rst_n_IBUF),
        .D(axi_data_i[5]),
        .Q(\reg_ctrl_reg_n_0_[5] ));
  FDCE \reg_ctrl_reg[6] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(reg_ctrl),
        .CLR(rst_n_IBUF),
        .D(axi_data_i[6]),
        .Q(\reg_ctrl_reg_n_0_[6] ));
  FDCE \reg_ctrl_reg[7] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(reg_ctrl),
        .CLR(rst_n_IBUF),
        .D(axi_data_i[7]),
        .Q(\reg_ctrl_reg_n_0_[7] ));
  FDCE \reg_ctrl_reg[8] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(reg_ctrl),
        .CLR(rst_n_IBUF),
        .D(axi_data_i[8]),
        .Q(\reg_ctrl_reg_n_0_[8] ));
  FDCE \reg_ctrl_reg[9] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(reg_ctrl),
        .CLR(rst_n_IBUF),
        .D(axi_data_i[9]),
        .Q(\reg_ctrl_reg_n_0_[9] ));
  LUT2 #(
    .INIT(4'h8)) 
    \reg_uart_result[0]_i_1 
       (.I0(uart_done),
        .I1(uart_freq[0]),
        .O(p_1_in__0[0]));
  LUT2 #(
    .INIT(4'h8)) 
    \reg_uart_result[10]_i_1 
       (.I0(uart_done),
        .I1(uart_freq[10]),
        .O(p_1_in__0[10]));
  LUT2 #(
    .INIT(4'h8)) 
    \reg_uart_result[11]_i_1 
       (.I0(uart_done),
        .I1(uart_freq[11]),
        .O(p_1_in__0[11]));
  LUT2 #(
    .INIT(4'h8)) 
    \reg_uart_result[12]_i_1 
       (.I0(uart_done),
        .I1(uart_freq[12]),
        .O(p_1_in__0[12]));
  LUT2 #(
    .INIT(4'h8)) 
    \reg_uart_result[13]_i_1 
       (.I0(uart_done),
        .I1(uart_freq[13]),
        .O(p_1_in__0[13]));
  LUT2 #(
    .INIT(4'h8)) 
    \reg_uart_result[14]_i_1 
       (.I0(uart_done),
        .I1(uart_freq[14]),
        .O(p_1_in__0[14]));
  LUT2 #(
    .INIT(4'h8)) 
    \reg_uart_result[15]_i_1 
       (.I0(uart_done),
        .I1(uart_freq[15]),
        .O(p_1_in__0[15]));
  LUT2 #(
    .INIT(4'h8)) 
    \reg_uart_result[16]_i_1 
       (.I0(uart_done),
        .I1(uart_freq[16]),
        .O(p_1_in__0[16]));
  LUT2 #(
    .INIT(4'h8)) 
    \reg_uart_result[17]_i_1 
       (.I0(uart_done),
        .I1(uart_freq[17]),
        .O(p_1_in__0[17]));
  LUT2 #(
    .INIT(4'h8)) 
    \reg_uart_result[18]_i_1 
       (.I0(uart_done),
        .I1(uart_freq[18]),
        .O(p_1_in__0[18]));
  LUT2 #(
    .INIT(4'h8)) 
    \reg_uart_result[19]_i_1 
       (.I0(uart_done),
        .I1(uart_freq[19]),
        .O(p_1_in__0[19]));
  LUT2 #(
    .INIT(4'h8)) 
    \reg_uart_result[1]_i_1 
       (.I0(uart_done),
        .I1(uart_freq[1]),
        .O(p_1_in__0[1]));
  LUT2 #(
    .INIT(4'h8)) 
    \reg_uart_result[20]_i_1 
       (.I0(uart_done),
        .I1(uart_freq[20]),
        .O(p_1_in__0[20]));
  LUT2 #(
    .INIT(4'h8)) 
    \reg_uart_result[21]_i_1 
       (.I0(uart_done),
        .I1(uart_freq[21]),
        .O(p_1_in__0[21]));
  LUT2 #(
    .INIT(4'h8)) 
    \reg_uart_result[22]_i_1 
       (.I0(uart_done),
        .I1(uart_freq[22]),
        .O(p_1_in__0[22]));
  LUT6 #(
    .INIT(64'hAAAAABAAAAAAAAAA)) 
    \reg_uart_result[23]_i_1 
       (.I0(uart_done),
        .I1(\reg_cmd[31]_i_2_n_0 ),
        .I2(axi_addr_i[2]),
        .I3(axi_addr_i[3]),
        .I4(axi_addr_i[4]),
        .I5(\reg_ctrl[31]_i_3_n_0 ),
        .O(\reg_uart_result[23]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \reg_uart_result[23]_i_2 
       (.I0(uart_done),
        .I1(uart_freq[23]),
        .O(p_1_in__0[23]));
  LUT2 #(
    .INIT(4'h8)) 
    \reg_uart_result[2]_i_1 
       (.I0(uart_done),
        .I1(uart_freq[2]),
        .O(p_1_in__0[2]));
  LUT2 #(
    .INIT(4'h8)) 
    \reg_uart_result[3]_i_1 
       (.I0(uart_done),
        .I1(uart_freq[3]),
        .O(p_1_in__0[3]));
  LUT2 #(
    .INIT(4'h8)) 
    \reg_uart_result[4]_i_1 
       (.I0(uart_done),
        .I1(uart_freq[4]),
        .O(p_1_in__0[4]));
  LUT2 #(
    .INIT(4'h8)) 
    \reg_uart_result[5]_i_1 
       (.I0(uart_done),
        .I1(uart_freq[5]),
        .O(p_1_in__0[5]));
  LUT2 #(
    .INIT(4'h8)) 
    \reg_uart_result[6]_i_1 
       (.I0(uart_done),
        .I1(uart_freq[6]),
        .O(p_1_in__0[6]));
  LUT2 #(
    .INIT(4'h8)) 
    \reg_uart_result[7]_i_1 
       (.I0(uart_done),
        .I1(uart_freq[7]),
        .O(p_1_in__0[7]));
  LUT2 #(
    .INIT(4'h8)) 
    \reg_uart_result[8]_i_1 
       (.I0(uart_done),
        .I1(uart_freq[8]),
        .O(p_1_in__0[8]));
  LUT2 #(
    .INIT(4'h8)) 
    \reg_uart_result[9]_i_1 
       (.I0(uart_done),
        .I1(uart_freq[9]),
        .O(p_1_in__0[9]));
  FDCE \reg_uart_result_reg[0] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(\reg_uart_result[23]_i_1_n_0 ),
        .CLR(rst_n_IBUF),
        .D(p_1_in__0[0]),
        .Q(reg_uart_result[0]));
  FDCE \reg_uart_result_reg[10] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(\reg_uart_result[23]_i_1_n_0 ),
        .CLR(rst_n_IBUF),
        .D(p_1_in__0[10]),
        .Q(reg_uart_result[10]));
  FDCE \reg_uart_result_reg[11] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(\reg_uart_result[23]_i_1_n_0 ),
        .CLR(rst_n_IBUF),
        .D(p_1_in__0[11]),
        .Q(reg_uart_result[11]));
  FDCE \reg_uart_result_reg[12] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(\reg_uart_result[23]_i_1_n_0 ),
        .CLR(rst_n_IBUF),
        .D(p_1_in__0[12]),
        .Q(reg_uart_result[12]));
  FDCE \reg_uart_result_reg[13] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(\reg_uart_result[23]_i_1_n_0 ),
        .CLR(rst_n_IBUF),
        .D(p_1_in__0[13]),
        .Q(reg_uart_result[13]));
  FDCE \reg_uart_result_reg[14] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(\reg_uart_result[23]_i_1_n_0 ),
        .CLR(rst_n_IBUF),
        .D(p_1_in__0[14]),
        .Q(reg_uart_result[14]));
  FDCE \reg_uart_result_reg[15] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(\reg_uart_result[23]_i_1_n_0 ),
        .CLR(rst_n_IBUF),
        .D(p_1_in__0[15]),
        .Q(reg_uart_result[15]));
  FDCE \reg_uart_result_reg[16] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(\reg_uart_result[23]_i_1_n_0 ),
        .CLR(rst_n_IBUF),
        .D(p_1_in__0[16]),
        .Q(reg_uart_result[16]));
  FDCE \reg_uart_result_reg[17] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(\reg_uart_result[23]_i_1_n_0 ),
        .CLR(rst_n_IBUF),
        .D(p_1_in__0[17]),
        .Q(reg_uart_result[17]));
  FDCE \reg_uart_result_reg[18] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(\reg_uart_result[23]_i_1_n_0 ),
        .CLR(rst_n_IBUF),
        .D(p_1_in__0[18]),
        .Q(reg_uart_result[18]));
  FDCE \reg_uart_result_reg[19] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(\reg_uart_result[23]_i_1_n_0 ),
        .CLR(rst_n_IBUF),
        .D(p_1_in__0[19]),
        .Q(reg_uart_result[19]));
  FDCE \reg_uart_result_reg[1] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(\reg_uart_result[23]_i_1_n_0 ),
        .CLR(rst_n_IBUF),
        .D(p_1_in__0[1]),
        .Q(reg_uart_result[1]));
  FDCE \reg_uart_result_reg[20] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(\reg_uart_result[23]_i_1_n_0 ),
        .CLR(rst_n_IBUF),
        .D(p_1_in__0[20]),
        .Q(reg_uart_result[20]));
  FDCE \reg_uart_result_reg[21] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(\reg_uart_result[23]_i_1_n_0 ),
        .CLR(rst_n_IBUF),
        .D(p_1_in__0[21]),
        .Q(reg_uart_result[21]));
  FDCE \reg_uart_result_reg[22] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(\reg_uart_result[23]_i_1_n_0 ),
        .CLR(rst_n_IBUF),
        .D(p_1_in__0[22]),
        .Q(reg_uart_result[22]));
  FDCE \reg_uart_result_reg[23] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(\reg_uart_result[23]_i_1_n_0 ),
        .CLR(rst_n_IBUF),
        .D(p_1_in__0[23]),
        .Q(reg_uart_result[23]));
  FDCE \reg_uart_result_reg[2] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(\reg_uart_result[23]_i_1_n_0 ),
        .CLR(rst_n_IBUF),
        .D(p_1_in__0[2]),
        .Q(reg_uart_result[2]));
  FDCE \reg_uart_result_reg[3] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(\reg_uart_result[23]_i_1_n_0 ),
        .CLR(rst_n_IBUF),
        .D(p_1_in__0[3]),
        .Q(reg_uart_result[3]));
  FDCE \reg_uart_result_reg[4] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(\reg_uart_result[23]_i_1_n_0 ),
        .CLR(rst_n_IBUF),
        .D(p_1_in__0[4]),
        .Q(reg_uart_result[4]));
  FDCE \reg_uart_result_reg[5] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(\reg_uart_result[23]_i_1_n_0 ),
        .CLR(rst_n_IBUF),
        .D(p_1_in__0[5]),
        .Q(reg_uart_result[5]));
  FDCE \reg_uart_result_reg[6] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(\reg_uart_result[23]_i_1_n_0 ),
        .CLR(rst_n_IBUF),
        .D(p_1_in__0[6]),
        .Q(reg_uart_result[6]));
  FDCE \reg_uart_result_reg[7] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(\reg_uart_result[23]_i_1_n_0 ),
        .CLR(rst_n_IBUF),
        .D(p_1_in__0[7]),
        .Q(reg_uart_result[7]));
  FDCE \reg_uart_result_reg[8] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(\reg_uart_result[23]_i_1_n_0 ),
        .CLR(rst_n_IBUF),
        .D(p_1_in__0[8]),
        .Q(reg_uart_result[8]));
  FDCE \reg_uart_result_reg[9] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(\reg_uart_result[23]_i_1_n_0 ),
        .CLR(rst_n_IBUF),
        .D(p_1_in__0[9]),
        .Q(reg_uart_result[9]));
  LUT6 #(
    .INIT(64'h0000000200000000)) 
    start_crc_pulse_i_1
       (.I0(axi_addr_i[5]),
        .I1(\reg_ctrl[31]_i_2_n_0 ),
        .I2(axi_addr_i[4]),
        .I3(axi_addr_i[3]),
        .I4(axi_addr_i[2]),
        .I5(\reg_ctrl[31]_i_3_n_0 ),
        .O(crc_done_flag));
  FDCE start_crc_pulse_reg
       (.C(sys_clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(rst_n_IBUF),
        .D(crc_done_flag),
        .Q(start_crc_pulse__0));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  FDCE start_crc_reg
       (.C(sys_clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(rst_n_IBUF),
        .D(start_crc_pulse__0),
        .Q(start_crc));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  FDCE \uart_cmd_reg[0] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(rst_n_IBUF),
        .D(\reg_cmd_reg_n_0_[0] ),
        .Q(uart_cmd[0]));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  FDCE \uart_cmd_reg[1] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(rst_n_IBUF),
        .D(\reg_cmd_reg_n_0_[1] ),
        .Q(uart_cmd[1]));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  FDCE \uart_cmd_reg[2] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(rst_n_IBUF),
        .D(\reg_cmd_reg_n_0_[2] ),
        .Q(uart_cmd[2]));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  FDCE \uart_cmd_reg[3] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(rst_n_IBUF),
        .D(\reg_cmd_reg_n_0_[3] ),
        .Q(uart_cmd[3]));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  FDCE \uart_cmd_reg[4] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(rst_n_IBUF),
        .D(\reg_cmd_reg_n_0_[4] ),
        .Q(uart_cmd[4]));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  FDCE \uart_cmd_reg[5] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(rst_n_IBUF),
        .D(\reg_cmd_reg_n_0_[5] ),
        .Q(uart_cmd[5]));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  FDCE \uart_cmd_reg[6] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(rst_n_IBUF),
        .D(\reg_cmd_reg_n_0_[6] ),
        .Q(uart_cmd[6]));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  FDCE \uart_cmd_reg[7] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(rst_n_IBUF),
        .D(\reg_cmd_reg_n_0_[7] ),
        .Q(uart_cmd[7]));
  LUT4 #(
    .INIT(16'h2F20)) 
    uart_done_flag_i_1
       (.I0(uart_done),
        .I1(urr_error),
        .I2(uart_error_flag),
        .I3(data3[0]),
        .O(uart_done_flag_i_1_n_0));
  LUT6 #(
    .INIT(64'hFFFFFFFFAAAAAABA)) 
    uart_done_flag_i_2
       (.I0(urr_error),
        .I1(\reg_crc_result[31]_i_3_n_0 ),
        .I2(axi_en_i),
        .I3(axi_vd_reg_i_3_n_0),
        .I4(uart_done_flag_i_3_n_0),
        .I5(uart_done),
        .O(uart_error_flag));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFEFFFF)) 
    uart_done_flag_i_3
       (.I0(axi_addr_i[6]),
        .I1(axi_addr_i[7]),
        .I2(axi_addr_i[5]),
        .I3(axi_addr_i[2]),
        .I4(axi_addr_i[3]),
        .I5(axi_addr_i[4]),
        .O(uart_done_flag_i_3_n_0));
  FDCE uart_done_flag_reg
       (.C(sys_clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(rst_n_IBUF),
        .D(uart_done_flag_i_1_n_0),
        .Q(data3[0]));
  LUT3 #(
    .INIT(8'hB8)) 
    uart_error_flag_i_1
       (.I0(urr_error),
        .I1(uart_error_flag),
        .I2(data3[1]),
        .O(uart_error_flag_i_1_n_0));
  FDCE uart_error_flag_reg
       (.C(sys_clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(rst_n_IBUF),
        .D(uart_error_flag_i_1_n_0),
        .Q(data3[1]));
  FDCE uart_start_pulse_reg
       (.C(sys_clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(rst_n_IBUF),
        .D(reg_cmd0),
        .Q(uart_start_pulse));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  FDCE uart_start_reg
       (.C(sys_clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(rst_n_IBUF),
        .D(uart_start_pulse),
        .Q(uart_start));
endmodule

module crc
   (crc_raw,
    mem_reg,
    \crc_reg_reg[0] ,
    \crc_reg_reg[4] ,
    \crc_reg_reg[1] ,
    mem_reg_0,
    \crc_reg_reg[7] ,
    mem_reg_1,
    mem_reg_2,
    \crc_reg_reg[7]_0 ,
    mem_reg_3,
    \crc_reg_reg[1]_0 ,
    \crc_reg_reg[1]_1 ,
    D,
    mem_reg_4,
    \crc_reg_reg[5] ,
    \crc_reg_reg[3] ,
    mem_reg_5,
    \crc_reg_reg[0]_0 ,
    \crc_reg_reg[6] ,
    mem_reg_6,
    mem_reg_7,
    out,
    \crc_reg_reg[30] );
  output [4:0]crc_raw;
  output mem_reg;
  output \crc_reg_reg[0] ;
  output \crc_reg_reg[4] ;
  output \crc_reg_reg[1] ;
  output mem_reg_0;
  output \crc_reg_reg[7] ;
  output mem_reg_1;
  output mem_reg_2;
  output \crc_reg_reg[7]_0 ;
  output mem_reg_3;
  output \crc_reg_reg[1]_0 ;
  output \crc_reg_reg[1]_1 ;
  output [0:0]D;
  output mem_reg_4;
  output \crc_reg_reg[5] ;
  output \crc_reg_reg[3] ;
  output mem_reg_5;
  output \crc_reg_reg[0]_0 ;
  output \crc_reg_reg[6] ;
  output mem_reg_6;
  output mem_reg_7;
  input [12:0]out;
  input [7:0]\crc_reg_reg[30] ;

  wire [0:0]D;
  wire [4:0]crc_raw;
  wire \crc_reg_reg[0] ;
  wire \crc_reg_reg[0]_0 ;
  wire \crc_reg_reg[1] ;
  wire \crc_reg_reg[1]_0 ;
  wire \crc_reg_reg[1]_1 ;
  wire [7:0]\crc_reg_reg[30] ;
  wire \crc_reg_reg[3] ;
  wire \crc_reg_reg[4] ;
  wire \crc_reg_reg[5] ;
  wire \crc_reg_reg[6] ;
  wire \crc_reg_reg[7] ;
  wire \crc_reg_reg[7]_0 ;
  wire mem_reg;
  wire mem_reg_0;
  wire mem_reg_1;
  wire mem_reg_2;
  wire mem_reg_3;
  wire mem_reg_4;
  wire mem_reg_5;
  wire mem_reg_6;
  wire mem_reg_7;
  wire [12:0]out;

  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \i_/crc_reg[11]_i_2 
       (.I0(\crc_reg_reg[30] [3]),
        .I1(out[3]),
        .O(mem_reg_7));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \i_/crc_reg[13]_i_2 
       (.I0(out[0]),
        .I1(\crc_reg_reg[30] [0]),
        .O(\crc_reg_reg[0]_0 ));
  LUT6 #(
    .INIT(64'h6996966996696996)) 
    \i_/crc_reg[16]_i_2 
       (.I0(out[9]),
        .I1(\crc_reg_reg[30] [2]),
        .I2(out[2]),
        .I3(\crc_reg_reg[30] [3]),
        .I4(out[3]),
        .I5(\crc_reg_reg[4] ),
        .O(crc_raw[1]));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT5 #(
    .INIT(32'h96696996)) 
    \i_/crc_reg[17]_i_2 
       (.I0(out[10]),
        .I1(\crc_reg_reg[30] [3]),
        .I2(out[3]),
        .I3(\crc_reg_reg[4] ),
        .I4(\crc_reg_reg[1] ),
        .O(crc_raw[2]));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT5 #(
    .INIT(32'h96696996)) 
    \i_/crc_reg[21]_i_2 
       (.I0(out[7]),
        .I1(\crc_reg_reg[30] [7]),
        .I2(out[11]),
        .I3(out[5]),
        .I4(\crc_reg_reg[30] [5]),
        .O(\crc_reg_reg[7] ));
  LUT2 #(
    .INIT(4'h6)) 
    \i_/crc_reg[21]_i_3 
       (.I0(\crc_reg_reg[30] [2]),
        .I1(out[2]),
        .O(mem_reg_1));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \i_/crc_reg[21]_i_4 
       (.I0(\crc_reg_reg[30] [4]),
        .I1(out[4]),
        .O(mem_reg_6));
  LUT6 #(
    .INIT(64'h6996966996696996)) 
    \i_/crc_reg[22]_i_2 
       (.I0(out[12]),
        .I1(out[5]),
        .I2(\crc_reg_reg[30] [5]),
        .I3(\crc_reg_reg[30] [3]),
        .I4(out[3]),
        .I5(mem_reg_4),
        .O(crc_raw[3]));
  LUT6 #(
    .INIT(64'h6996966996696996)) 
    \i_/crc_reg[24]_i_2 
       (.I0(out[5]),
        .I1(\crc_reg_reg[30] [5]),
        .I2(mem_reg_1),
        .I3(\crc_reg_reg[30] [7]),
        .I4(out[7]),
        .I5(\crc_reg_reg[4] ),
        .O(crc_raw[4]));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT5 #(
    .INIT(32'h96696996)) 
    \i_/crc_reg[25]_i_2 
       (.I0(\crc_reg_reg[30] [2]),
        .I1(out[2]),
        .I2(out[6]),
        .I3(\crc_reg_reg[30] [6]),
        .I4(\crc_reg_reg[1] ),
        .O(mem_reg_0));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT4 #(
    .INIT(16'h6996)) 
    \i_/crc_reg[25]_i_3 
       (.I0(out[3]),
        .I1(\crc_reg_reg[30] [3]),
        .I2(\crc_reg_reg[30] [0]),
        .I3(out[0]),
        .O(\crc_reg_reg[3] ));
  LUT6 #(
    .INIT(64'h6996966996696996)) 
    \i_/crc_reg[26]_i_2 
       (.I0(out[0]),
        .I1(\crc_reg_reg[30] [0]),
        .I2(\crc_reg_reg[30] [4]),
        .I3(out[4]),
        .I4(out[1]),
        .I5(\crc_reg_reg[30] [1]),
        .O(\crc_reg_reg[0] ));
  LUT4 #(
    .INIT(16'h6996)) 
    \i_/crc_reg[26]_i_3 
       (.I0(out[7]),
        .I1(\crc_reg_reg[30] [7]),
        .I2(out[3]),
        .I3(\crc_reg_reg[30] [3]),
        .O(\crc_reg_reg[7]_0 ));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT4 #(
    .INIT(16'h6996)) 
    \i_/crc_reg[26]_i_4 
       (.I0(\crc_reg_reg[30] [6]),
        .I1(out[6]),
        .I2(out[2]),
        .I3(\crc_reg_reg[30] [2]),
        .O(mem_reg_4));
  LUT6 #(
    .INIT(64'h6996966996696996)) 
    \i_/crc_reg[27]_i_2 
       (.I0(\crc_reg_reg[30] [3]),
        .I1(out[3]),
        .I2(\crc_reg_reg[30] [7]),
        .I3(out[7]),
        .I4(out[4]),
        .I5(\crc_reg_reg[30] [4]),
        .O(mem_reg_2));
  LUT2 #(
    .INIT(4'h6)) 
    \i_/crc_reg[28]_i_2 
       (.I0(out[5]),
        .I1(\crc_reg_reg[30] [5]),
        .O(\crc_reg_reg[5] ));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \i_/crc_reg[28]_i_3 
       (.I0(out[6]),
        .I1(\crc_reg_reg[30] [6]),
        .O(\crc_reg_reg[6] ));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT4 #(
    .INIT(16'h6996)) 
    \i_/crc_reg[28]_i_4 
       (.I0(out[4]),
        .I1(\crc_reg_reg[30] [4]),
        .I2(\crc_reg_reg[30] [0]),
        .I3(out[0]),
        .O(\crc_reg_reg[4] ));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT4 #(
    .INIT(16'h6996)) 
    \i_/crc_reg[29]_i_2 
       (.I0(\crc_reg_reg[30] [6]),
        .I1(out[6]),
        .I2(\crc_reg_reg[30] [0]),
        .I3(out[0]),
        .O(mem_reg_5));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \i_/crc_reg[29]_i_3 
       (.I0(\crc_reg_reg[30] [7]),
        .I1(out[7]),
        .O(mem_reg_3));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT4 #(
    .INIT(16'h6996)) 
    \i_/crc_reg[29]_i_4 
       (.I0(out[1]),
        .I1(\crc_reg_reg[30] [1]),
        .I2(\crc_reg_reg[30] [5]),
        .I3(out[5]),
        .O(\crc_reg_reg[1] ));
  LUT6 #(
    .INIT(64'h9669699669969669)) 
    \i_/crc_reg[30]_i_3 
       (.I0(out[1]),
        .I1(\crc_reg_reg[30] [1]),
        .I2(out[7]),
        .I3(\crc_reg_reg[30] [7]),
        .I4(\crc_reg_reg[30] [6]),
        .I5(out[6]),
        .O(\crc_reg_reg[1]_0 ));
  LUT6 #(
    .INIT(64'h6996966996696996)) 
    \i_/crc_reg[30]_i_4 
       (.I0(out[1]),
        .I1(\crc_reg_reg[30] [1]),
        .I2(out[7]),
        .I3(\crc_reg_reg[30] [7]),
        .I4(\crc_reg_reg[30] [6]),
        .I5(out[6]),
        .O(\crc_reg_reg[1]_1 ));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \i_/crc_reg[31]_i_4 
       (.I0(\crc_reg_reg[30] [1]),
        .I1(out[1]),
        .O(mem_reg));
  LUT6 #(
    .INIT(64'h6996966996696996)) 
    \i_/crc_reg[8]_i_2 
       (.I0(out[8]),
        .I1(mem_reg),
        .I2(out[6]),
        .I3(\crc_reg_reg[30] [6]),
        .I4(\crc_reg_reg[30] [7]),
        .I5(out[7]),
        .O(crc_raw[0]));
  LUT1 #(
    .INIT(2'h1)) 
    \i_/crc_result[6]_i_1 
       (.I0(out[6]),
        .O(D));
endmodule

module crc_wrapper
   (crc_raw,
    mem_reg,
    \crc_reg_reg[0] ,
    \crc_reg_reg[4] ,
    \crc_reg_reg[1] ,
    mem_reg_0,
    \crc_reg_reg[7] ,
    mem_reg_1,
    mem_reg_2,
    \crc_reg_reg[7]_0 ,
    mem_reg_3,
    \crc_reg_reg[1]_0 ,
    \crc_reg_reg[1]_1 ,
    D,
    mem_reg_4,
    \crc_reg_reg[5] ,
    \crc_reg_reg[3] ,
    mem_reg_5,
    \crc_reg_reg[0]_0 ,
    \crc_reg_reg[6] ,
    mem_reg_6,
    mem_reg_7,
    out,
    \crc_reg_reg[30] );
  output [4:0]crc_raw;
  output mem_reg;
  output \crc_reg_reg[0] ;
  output \crc_reg_reg[4] ;
  output \crc_reg_reg[1] ;
  output mem_reg_0;
  output \crc_reg_reg[7] ;
  output mem_reg_1;
  output mem_reg_2;
  output \crc_reg_reg[7]_0 ;
  output mem_reg_3;
  output \crc_reg_reg[1]_0 ;
  output \crc_reg_reg[1]_1 ;
  output [0:0]D;
  output mem_reg_4;
  output \crc_reg_reg[5] ;
  output \crc_reg_reg[3] ;
  output mem_reg_5;
  output \crc_reg_reg[0]_0 ;
  output \crc_reg_reg[6] ;
  output mem_reg_6;
  output mem_reg_7;
  input [12:0]out;
  input [7:0]\crc_reg_reg[30] ;

  wire [0:0]D;
  wire [4:0]crc_raw;
  wire \crc_reg_reg[0] ;
  wire \crc_reg_reg[0]_0 ;
  wire \crc_reg_reg[1] ;
  wire \crc_reg_reg[1]_0 ;
  wire \crc_reg_reg[1]_1 ;
  wire [7:0]\crc_reg_reg[30] ;
  wire \crc_reg_reg[3] ;
  wire \crc_reg_reg[4] ;
  wire \crc_reg_reg[5] ;
  wire \crc_reg_reg[6] ;
  wire \crc_reg_reg[7] ;
  wire \crc_reg_reg[7]_0 ;
  wire mem_reg;
  wire mem_reg_0;
  wire mem_reg_1;
  wire mem_reg_2;
  wire mem_reg_3;
  wire mem_reg_4;
  wire mem_reg_5;
  wire mem_reg_6;
  wire mem_reg_7;
  wire [12:0]out;

  crc u_crc
       (.D(D),
        .crc_raw(crc_raw),
        .\crc_reg_reg[0] (\crc_reg_reg[0] ),
        .\crc_reg_reg[0]_0 (\crc_reg_reg[0]_0 ),
        .\crc_reg_reg[1] (\crc_reg_reg[1] ),
        .\crc_reg_reg[1]_0 (\crc_reg_reg[1]_0 ),
        .\crc_reg_reg[1]_1 (\crc_reg_reg[1]_1 ),
        .\crc_reg_reg[30] (\crc_reg_reg[30] ),
        .\crc_reg_reg[3] (\crc_reg_reg[3] ),
        .\crc_reg_reg[4] (\crc_reg_reg[4] ),
        .\crc_reg_reg[5] (\crc_reg_reg[5] ),
        .\crc_reg_reg[6] (\crc_reg_reg[6] ),
        .\crc_reg_reg[7] (\crc_reg_reg[7] ),
        .\crc_reg_reg[7]_0 (\crc_reg_reg[7]_0 ),
        .mem_reg(mem_reg),
        .mem_reg_0(mem_reg_0),
        .mem_reg_1(mem_reg_1),
        .mem_reg_2(mem_reg_2),
        .mem_reg_3(mem_reg_3),
        .mem_reg_4(mem_reg_4),
        .mem_reg_5(mem_reg_5),
        .mem_reg_6(mem_reg_6),
        .mem_reg_7(mem_reg_7),
        .out(out));
endmodule

module fifo
   (in0,
    module_enable_reg,
    Q,
    fifo_full,
    fifo_empty,
    sys_clk_IBUF_BUFG,
    rst_n,
    out,
    mem_reg_0,
    mem_reg_1,
    rst_n_IBUF,
    \cnt_reg[1]_0 ,
    \cnt_reg[1]_1 );
  output [7:0]in0;
  output module_enable_reg;
  output [7:0]Q;
  output fifo_full;
  output fifo_empty;
  input sys_clk_IBUF_BUFG;
  input rst_n;
  input [7:0]out;
  input mem_reg_0;
  input mem_reg_1;
  input rst_n_IBUF;
  input \cnt_reg[1]_0 ;
  input \cnt_reg[1]_1 ;

  wire [7:0]\^Q ;
  wire [0:0]cnt0;
  wire [8:7]cnt00_in;
  wire \cnt[1]_i_2_n_0 ;
  wire \cnt[5]_i_2_n_0 ;
  wire \cnt[6]_i_2_n_0 ;
  wire \cnt[8]_i_1_n_0 ;
  wire \cnt[8]_i_3_n_0 ;
  wire \cnt[8]_i_4_n_0 ;
  wire \cnt[8]_i_5_n_0 ;
  wire \cnt_reg[1]_0 ;
  wire \cnt_reg[1]_1 ;
  wire \cnt_reg_n_0_[8] ;
  wire fifo_full;
  wire [7:0]in0;
  wire mem_reg_0;
  wire mem_reg_1;
  wire mem_reg_i_2_n_0;
  wire mem_reg_i_3_n_0;
  wire mem_reg_i_4_n_0;
  wire mem_reg_i_5_n_0;
  wire module_enable_reg;
  wire [7:0]out;
  wire [8:1]p_2_in__0;
  wire [7:0]rd_ptr;
  wire \rd_ptr[0]_i_1_n_0 ;
  wire \rd_ptr[1]_i_1_n_0 ;
  wire \rd_ptr[2]_i_1_n_0 ;
  wire \rd_ptr[2]_i_2_n_0 ;
  wire \rd_ptr[2]_i_3_n_0 ;
  wire \rd_ptr[3]_i_1_n_0 ;
  wire \rd_ptr[4]_i_1_n_0 ;
  wire \rd_ptr[5]_i_1_n_0 ;
  wire \rd_ptr[5]_i_2_n_0 ;
  wire \rd_ptr[6]_i_1_n_0 ;
  wire \rd_ptr[7]_i_1_n_0 ;
  wire rst_n;
  wire rst_n_IBUF;
  wire sys_clk_IBUF_BUFG;
  wire [7:0]wr_ptr;
  wire \wr_ptr[0]_i_1_n_0 ;
  wire \wr_ptr[1]_i_1_n_0 ;
  wire \wr_ptr[2]_i_1_n_0 ;
  wire \wr_ptr[3]_i_1_n_0 ;
  wire \wr_ptr[4]_i_1_n_0 ;
  wire \wr_ptr[5]_i_1_n_0 ;
  wire \wr_ptr[6]_i_1_n_0 ;
  wire \wr_ptr[7]_i_1_n_0 ;
  wire \wr_ptr[7]_i_2_n_0 ;
  wire \wr_ptr[7]_i_3_n_0 ;
  wire \wr_ptr[7]_i_4_n_0 ;
  wire [15:0]NLW_mem_reg_DOADO_UNCONNECTED;
  wire [15:8]NLW_mem_reg_DOBDO_UNCONNECTED;
  wire [1:0]NLW_mem_reg_DOPADOP_UNCONNECTED;
  wire [1:0]NLW_mem_reg_DOPBDOP_UNCONNECTED;

  LUT3 #(
    .INIT(8'hF7)) 
    \baud_cnt[15]_i_2 
       (.I0(mem_reg_0),
        .I1(mem_reg_1),
        .I2(rst_n_IBUF),
        .O(module_enable_reg));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT1 #(
    .INIT(2'h1)) 
    \cnt[0]_i_1 
       (.I0(\^Q [0]),
        .O(cnt0));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT5 #(
    .INIT(32'h69C36969)) 
    \cnt[1]_i_1 
       (.I0(\cnt_reg[1]_0 ),
        .I1(\^Q [0]),
        .I2(\^Q [1]),
        .I3(\cnt[1]_i_2_n_0 ),
        .I4(\cnt_reg[1]_1 ),
        .O(p_2_in__0[1]));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT5 #(
    .INIT(32'hFFFFFF7F)) 
    \cnt[1]_i_2 
       (.I0(\^Q [7]),
        .I1(\^Q [3]),
        .I2(\^Q [6]),
        .I3(\cnt_reg_n_0_[8] ),
        .I4(mem_reg_i_5_n_0),
        .O(\cnt[1]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT4 #(
    .INIT(16'hBD42)) 
    \cnt[2]_i_1 
       (.I0(\cnt[8]_i_5_n_0 ),
        .I1(\^Q [1]),
        .I2(\^Q [0]),
        .I3(\^Q [2]),
        .O(p_2_in__0[2]));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT5 #(
    .INIT(32'hBFFD4002)) 
    \cnt[3]_i_1 
       (.I0(\cnt[8]_i_5_n_0 ),
        .I1(\^Q [2]),
        .I2(\^Q [0]),
        .I3(\^Q [1]),
        .I4(\^Q [3]),
        .O(p_2_in__0[3]));
  LUT6 #(
    .INIT(64'hBFFFFFFD40000002)) 
    \cnt[4]_i_1 
       (.I0(\cnt[8]_i_5_n_0 ),
        .I1(\^Q [3]),
        .I2(\^Q [1]),
        .I3(\^Q [0]),
        .I4(\^Q [2]),
        .I5(\^Q [4]),
        .O(p_2_in__0[4]));
  LUT6 #(
    .INIT(64'hF0EFFFEF0F100010)) 
    \cnt[5]_i_1 
       (.I0(\cnt[5]_i_2_n_0 ),
        .I1(\^Q [4]),
        .I2(\cnt[8]_i_5_n_0 ),
        .I3(\^Q [3]),
        .I4(\cnt[6]_i_2_n_0 ),
        .I5(\^Q [5]),
        .O(p_2_in__0[5]));
  LUT3 #(
    .INIT(8'hFE)) 
    \cnt[5]_i_2 
       (.I0(\^Q [1]),
        .I1(\^Q [0]),
        .I2(\^Q [2]),
        .O(\cnt[5]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hCFBBFFBB30440044)) 
    \cnt[6]_i_1 
       (.I0(mem_reg_i_5_n_0),
        .I1(\cnt[8]_i_5_n_0 ),
        .I2(\cnt[6]_i_2_n_0 ),
        .I3(\^Q [3]),
        .I4(\^Q [5]),
        .I5(\^Q [6]),
        .O(p_2_in__0[6]));
  (* SOFT_HLUTNM = "soft_lutpair20" *) 
  LUT4 #(
    .INIT(16'h8000)) 
    \cnt[6]_i_2 
       (.I0(\^Q [2]),
        .I1(\^Q [0]),
        .I2(\^Q [1]),
        .I3(\^Q [4]),
        .O(\cnt[6]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFE01FFFFFE010000)) 
    \cnt[7]_i_1 
       (.I0(mem_reg_i_5_n_0),
        .I1(\^Q [3]),
        .I2(\^Q [6]),
        .I3(\^Q [7]),
        .I4(\cnt[8]_i_5_n_0 ),
        .I5(cnt00_in[7]),
        .O(p_2_in__0[7]));
  LUT5 #(
    .INIT(32'h7FFF8000)) 
    \cnt[7]_i_2 
       (.I0(\cnt[6]_i_2_n_0 ),
        .I1(\^Q [5]),
        .I2(\^Q [6]),
        .I3(\^Q [3]),
        .I4(\^Q [7]),
        .O(cnt00_in[7]));
  LUT6 #(
    .INIT(64'h4001BFFFFFFE0000)) 
    \cnt[8]_i_1 
       (.I0(\cnt[8]_i_3_n_0 ),
        .I1(\^Q [6]),
        .I2(\^Q [3]),
        .I3(\^Q [7]),
        .I4(\cnt_reg[1]_1 ),
        .I5(\cnt_reg[1]_0 ),
        .O(\cnt[8]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hE1FFE100)) 
    \cnt[8]_i_2 
       (.I0(mem_reg_i_5_n_0),
        .I1(\cnt[8]_i_4_n_0 ),
        .I2(\cnt_reg_n_0_[8] ),
        .I3(\cnt[8]_i_5_n_0 ),
        .I4(cnt00_in[8]),
        .O(p_2_in__0[8]));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
    \cnt[8]_i_3 
       (.I0(\^Q [5]),
        .I1(\^Q [2]),
        .I2(\^Q [0]),
        .I3(\^Q [1]),
        .I4(\^Q [4]),
        .I5(\cnt_reg_n_0_[8] ),
        .O(\cnt[8]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair19" *) 
  LUT3 #(
    .INIT(8'hFE)) 
    \cnt[8]_i_4 
       (.I0(\^Q [6]),
        .I1(\^Q [3]),
        .I2(\^Q [7]),
        .O(\cnt[8]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h00008000FFFFFFFF)) 
    \cnt[8]_i_5 
       (.I0(\cnt_reg[1]_1 ),
        .I1(\^Q [7]),
        .I2(\^Q [3]),
        .I3(\^Q [6]),
        .I4(\cnt[8]_i_3_n_0 ),
        .I5(\cnt_reg[1]_0 ),
        .O(\cnt[8]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'h7FFFFFFF80000000)) 
    \cnt[8]_i_6 
       (.I0(\cnt[6]_i_2_n_0 ),
        .I1(\^Q [5]),
        .I2(\^Q [7]),
        .I3(\^Q [3]),
        .I4(\^Q [6]),
        .I5(\cnt_reg_n_0_[8] ),
        .O(cnt00_in[8]));
  FDRE \cnt_reg[0] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(\cnt[8]_i_1_n_0 ),
        .D(cnt0),
        .Q(\^Q [0]),
        .R(module_enable_reg));
  FDRE \cnt_reg[1] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(\cnt[8]_i_1_n_0 ),
        .D(p_2_in__0[1]),
        .Q(\^Q [1]),
        .R(module_enable_reg));
  FDRE \cnt_reg[2] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(\cnt[8]_i_1_n_0 ),
        .D(p_2_in__0[2]),
        .Q(\^Q [2]),
        .R(module_enable_reg));
  FDRE \cnt_reg[3] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(\cnt[8]_i_1_n_0 ),
        .D(p_2_in__0[3]),
        .Q(\^Q [3]),
        .R(module_enable_reg));
  FDRE \cnt_reg[4] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(\cnt[8]_i_1_n_0 ),
        .D(p_2_in__0[4]),
        .Q(\^Q [4]),
        .R(module_enable_reg));
  FDRE \cnt_reg[5] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(\cnt[8]_i_1_n_0 ),
        .D(p_2_in__0[5]),
        .Q(\^Q [5]),
        .R(module_enable_reg));
  FDRE \cnt_reg[6] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(\cnt[8]_i_1_n_0 ),
        .D(p_2_in__0[6]),
        .Q(\^Q [6]),
        .R(module_enable_reg));
  FDRE \cnt_reg[7] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(\cnt[8]_i_1_n_0 ),
        .D(p_2_in__0[7]),
        .Q(\^Q [7]),
        .R(module_enable_reg));
  FDRE \cnt_reg[8] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(\cnt[8]_i_1_n_0 ),
        .D(p_2_in__0[8]),
        .Q(\cnt_reg_n_0_[8] ),
        .R(module_enable_reg));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT5 #(
    .INIT(32'h10000000)) 
    fifo_full_inferred_i_1
       (.I0(mem_reg_i_5_n_0),
        .I1(\cnt_reg_n_0_[8] ),
        .I2(\^Q [6]),
        .I3(\^Q [3]),
        .I4(\^Q [7]),
        .O(fifo_full));
  (* \MEM.PORTA.DATA_BIT_LAYOUT  = "p0_d8" *) 
  (* \MEM.PORTB.DATA_BIT_LAYOUT  = "p0_d8" *) 
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-6 {cell *THIS*}}" *) 
  (* RTL_RAM_BITS = "1600" *) 
  (* RTL_RAM_NAME = "u_urr_crc/u_fifo/mem_reg" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "0" *) 
  (* ram_addr_end = "1023" *) 
  (* ram_offset = "768" *) 
  (* ram_slice_begin = "0" *) 
  (* ram_slice_end = "7" *) 
  RAMB18E1 #(
    .DOA_REG(0),
    .DOB_REG(0),
    .INIT_A(18'h00000),
    .INIT_B(18'h00000),
    .RAM_MODE("TDP"),
    .RDADDR_COLLISION_HWCONFIG("DELAYED_WRITE"),
    .READ_WIDTH_A(18),
    .READ_WIDTH_B(18),
    .RSTREG_PRIORITY_A("RSTREG"),
    .RSTREG_PRIORITY_B("RSTREG"),
    .SIM_COLLISION_CHECK("ALL"),
    .SIM_DEVICE("7SERIES"),
    .SRVAL_A(18'h00000),
    .SRVAL_B(18'h00000),
    .WRITE_MODE_A("READ_FIRST"),
    .WRITE_MODE_B("WRITE_FIRST"),
    .WRITE_WIDTH_A(18),
    .WRITE_WIDTH_B(18)) 
    mem_reg
       (.ADDRARDADDR({1'b1,1'b1,wr_ptr,1'b1,1'b1,1'b1,1'b1}),
        .ADDRBWRADDR({1'b1,1'b1,rd_ptr,1'b1,1'b1,1'b1,1'b1}),
        .CLKARDCLK(sys_clk_IBUF_BUFG),
        .CLKBWRCLK(sys_clk_IBUF_BUFG),
        .DIADI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,out}),
        .DIBDI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .DIPADIP({1'b0,1'b0}),
        .DIPBDIP({1'b0,1'b0}),
        .DOADO(NLW_mem_reg_DOADO_UNCONNECTED[15:0]),
        .DOBDO({NLW_mem_reg_DOBDO_UNCONNECTED[15:8],in0}),
        .DOPADOP(NLW_mem_reg_DOPADOP_UNCONNECTED[1:0]),
        .DOPBDOP(NLW_mem_reg_DOPBDOP_UNCONNECTED[1:0]),
        .ENARDEN(rst_n),
        .ENBWREN(mem_reg_i_2_n_0),
        .REGCEAREGCE(1'b0),
        .REGCEB(1'b0),
        .RSTRAMARSTRAM(1'b0),
        .RSTRAMB(module_enable_reg),
        .RSTREGARSTREG(1'b0),
        .RSTREGB(1'b0),
        .WEA({mem_reg_i_3_n_0,mem_reg_i_3_n_0}),
        .WEBWE({1'b0,1'b0,1'b0,1'b0}));
  LUT4 #(
    .INIT(16'hFFBF)) 
    mem_reg_i_2
       (.I0(mem_reg_i_4_n_0),
        .I1(mem_reg_0),
        .I2(mem_reg_1),
        .I3(rst_n_IBUF),
        .O(mem_reg_i_2_n_0));
  LUT6 #(
    .INIT(64'hEFFFFFFF00000000)) 
    mem_reg_i_3
       (.I0(mem_reg_i_5_n_0),
        .I1(\cnt_reg_n_0_[8] ),
        .I2(\^Q [6]),
        .I3(\^Q [3]),
        .I4(\^Q [7]),
        .I5(\cnt_reg[1]_0 ),
        .O(mem_reg_i_3_n_0));
  LUT6 #(
    .INIT(64'hFFFFFFFE00000000)) 
    mem_reg_i_4
       (.I0(mem_reg_i_5_n_0),
        .I1(\cnt_reg_n_0_[8] ),
        .I2(\^Q [6]),
        .I3(\^Q [3]),
        .I4(\^Q [7]),
        .I5(\cnt_reg[1]_1 ),
        .O(mem_reg_i_4_n_0));
  (* SOFT_HLUTNM = "soft_lutpair20" *) 
  LUT5 #(
    .INIT(32'hFFFFFFFE)) 
    mem_reg_i_5
       (.I0(\^Q [4]),
        .I1(\^Q [1]),
        .I2(\^Q [0]),
        .I3(\^Q [2]),
        .I4(\^Q [5]),
        .O(mem_reg_i_5_n_0));
  LUT2 #(
    .INIT(4'h2)) 
    \rd_ptr[0]_i_1 
       (.I0(mem_reg_i_4_n_0),
        .I1(rd_ptr[0]),
        .O(\rd_ptr[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair22" *) 
  LUT3 #(
    .INIT(8'h28)) 
    \rd_ptr[1]_i_1 
       (.I0(mem_reg_i_4_n_0),
        .I1(rd_ptr[1]),
        .I2(rd_ptr[0]),
        .O(\rd_ptr[1]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hFF02)) 
    \rd_ptr[2]_i_1 
       (.I0(\rd_ptr[2]_i_3_n_0 ),
        .I1(rd_ptr[0]),
        .I2(rd_ptr[1]),
        .I3(mem_reg_i_4_n_0),
        .O(\rd_ptr[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair18" *) 
  LUT4 #(
    .INIT(16'h2888)) 
    \rd_ptr[2]_i_2 
       (.I0(mem_reg_i_4_n_0),
        .I1(rd_ptr[2]),
        .I2(rd_ptr[0]),
        .I3(rd_ptr[1]),
        .O(\rd_ptr[2]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h0010000000000000)) 
    \rd_ptr[2]_i_3 
       (.I0(rd_ptr[4]),
        .I1(rd_ptr[5]),
        .I2(rd_ptr[3]),
        .I3(rd_ptr[2]),
        .I4(rd_ptr[7]),
        .I5(rd_ptr[6]),
        .O(\rd_ptr[2]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair18" *) 
  LUT5 #(
    .INIT(32'h28888888)) 
    \rd_ptr[3]_i_1 
       (.I0(mem_reg_i_4_n_0),
        .I1(rd_ptr[3]),
        .I2(rd_ptr[1]),
        .I3(rd_ptr[0]),
        .I4(rd_ptr[2]),
        .O(\rd_ptr[3]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h2888888888888888)) 
    \rd_ptr[4]_i_1 
       (.I0(mem_reg_i_4_n_0),
        .I1(rd_ptr[4]),
        .I2(rd_ptr[2]),
        .I3(rd_ptr[0]),
        .I4(rd_ptr[1]),
        .I5(rd_ptr[3]),
        .O(\rd_ptr[4]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT4 #(
    .INIT(16'h2888)) 
    \rd_ptr[5]_i_1 
       (.I0(mem_reg_i_4_n_0),
        .I1(rd_ptr[5]),
        .I2(\rd_ptr[5]_i_2_n_0 ),
        .I3(rd_ptr[4]),
        .O(\rd_ptr[5]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair22" *) 
  LUT4 #(
    .INIT(16'h8000)) 
    \rd_ptr[5]_i_2 
       (.I0(rd_ptr[2]),
        .I1(rd_ptr[0]),
        .I2(rd_ptr[1]),
        .I3(rd_ptr[3]),
        .O(\rd_ptr[5]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT5 #(
    .INIT(32'h28888888)) 
    \rd_ptr[6]_i_1 
       (.I0(mem_reg_i_4_n_0),
        .I1(rd_ptr[6]),
        .I2(rd_ptr[5]),
        .I3(rd_ptr[4]),
        .I4(\rd_ptr[5]_i_2_n_0 ),
        .O(\rd_ptr[6]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h2888888888888888)) 
    \rd_ptr[7]_i_1 
       (.I0(mem_reg_i_4_n_0),
        .I1(rd_ptr[7]),
        .I2(rd_ptr[4]),
        .I3(rd_ptr[5]),
        .I4(rd_ptr[6]),
        .I5(\rd_ptr[5]_i_2_n_0 ),
        .O(\rd_ptr[7]_i_1_n_0 ));
  FDRE \rd_ptr_reg[0] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(\rd_ptr[2]_i_1_n_0 ),
        .D(\rd_ptr[0]_i_1_n_0 ),
        .Q(rd_ptr[0]),
        .R(module_enable_reg));
  FDRE \rd_ptr_reg[1] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(\rd_ptr[2]_i_1_n_0 ),
        .D(\rd_ptr[1]_i_1_n_0 ),
        .Q(rd_ptr[1]),
        .R(module_enable_reg));
  FDRE \rd_ptr_reg[2] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(\rd_ptr[2]_i_1_n_0 ),
        .D(\rd_ptr[2]_i_2_n_0 ),
        .Q(rd_ptr[2]),
        .R(module_enable_reg));
  FDRE \rd_ptr_reg[3] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(\rd_ptr[2]_i_1_n_0 ),
        .D(\rd_ptr[3]_i_1_n_0 ),
        .Q(rd_ptr[3]),
        .R(module_enable_reg));
  FDRE \rd_ptr_reg[4] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(\rd_ptr[2]_i_1_n_0 ),
        .D(\rd_ptr[4]_i_1_n_0 ),
        .Q(rd_ptr[4]),
        .R(module_enable_reg));
  FDRE \rd_ptr_reg[5] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(\rd_ptr[2]_i_1_n_0 ),
        .D(\rd_ptr[5]_i_1_n_0 ),
        .Q(rd_ptr[5]),
        .R(module_enable_reg));
  FDRE \rd_ptr_reg[6] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(\rd_ptr[2]_i_1_n_0 ),
        .D(\rd_ptr[6]_i_1_n_0 ),
        .Q(rd_ptr[6]),
        .R(module_enable_reg));
  FDRE \rd_ptr_reg[7] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(\rd_ptr[2]_i_1_n_0 ),
        .D(\rd_ptr[7]_i_1_n_0 ),
        .Q(rd_ptr[7]),
        .R(module_enable_reg));
  LUT2 #(
    .INIT(4'h2)) 
    \wr_ptr[0]_i_1 
       (.I0(mem_reg_i_3_n_0),
        .I1(wr_ptr[0]),
        .O(\wr_ptr[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair21" *) 
  LUT3 #(
    .INIT(8'h28)) 
    \wr_ptr[1]_i_1 
       (.I0(mem_reg_i_3_n_0),
        .I1(wr_ptr[1]),
        .I2(wr_ptr[0]),
        .O(\wr_ptr[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT4 #(
    .INIT(16'h2888)) 
    \wr_ptr[2]_i_1 
       (.I0(mem_reg_i_3_n_0),
        .I1(wr_ptr[2]),
        .I2(wr_ptr[0]),
        .I3(wr_ptr[1]),
        .O(\wr_ptr[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT5 #(
    .INIT(32'h28888888)) 
    \wr_ptr[3]_i_1 
       (.I0(mem_reg_i_3_n_0),
        .I1(wr_ptr[3]),
        .I2(wr_ptr[1]),
        .I3(wr_ptr[0]),
        .I4(wr_ptr[2]),
        .O(\wr_ptr[3]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h2888888888888888)) 
    \wr_ptr[4]_i_1 
       (.I0(mem_reg_i_3_n_0),
        .I1(wr_ptr[4]),
        .I2(wr_ptr[2]),
        .I3(wr_ptr[0]),
        .I4(wr_ptr[1]),
        .I5(wr_ptr[3]),
        .O(\wr_ptr[4]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT4 #(
    .INIT(16'h2888)) 
    \wr_ptr[5]_i_1 
       (.I0(mem_reg_i_3_n_0),
        .I1(wr_ptr[5]),
        .I2(\wr_ptr[7]_i_4_n_0 ),
        .I3(wr_ptr[4]),
        .O(\wr_ptr[5]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT5 #(
    .INIT(32'h28888888)) 
    \wr_ptr[6]_i_1 
       (.I0(mem_reg_i_3_n_0),
        .I1(wr_ptr[6]),
        .I2(wr_ptr[5]),
        .I3(wr_ptr[4]),
        .I4(\wr_ptr[7]_i_4_n_0 ),
        .O(\wr_ptr[6]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hFF02)) 
    \wr_ptr[7]_i_1 
       (.I0(\wr_ptr[7]_i_3_n_0 ),
        .I1(wr_ptr[0]),
        .I2(wr_ptr[1]),
        .I3(mem_reg_i_3_n_0),
        .O(\wr_ptr[7]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h2888888888888888)) 
    \wr_ptr[7]_i_2 
       (.I0(mem_reg_i_3_n_0),
        .I1(wr_ptr[7]),
        .I2(wr_ptr[4]),
        .I3(wr_ptr[5]),
        .I4(wr_ptr[6]),
        .I5(\wr_ptr[7]_i_4_n_0 ),
        .O(\wr_ptr[7]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h0010000000000000)) 
    \wr_ptr[7]_i_3 
       (.I0(wr_ptr[4]),
        .I1(wr_ptr[5]),
        .I2(wr_ptr[3]),
        .I3(wr_ptr[2]),
        .I4(wr_ptr[7]),
        .I5(wr_ptr[6]),
        .O(\wr_ptr[7]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair21" *) 
  LUT4 #(
    .INIT(16'h8000)) 
    \wr_ptr[7]_i_4 
       (.I0(wr_ptr[2]),
        .I1(wr_ptr[0]),
        .I2(wr_ptr[1]),
        .I3(wr_ptr[3]),
        .O(\wr_ptr[7]_i_4_n_0 ));
  FDRE \wr_ptr_reg[0] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(\wr_ptr[7]_i_1_n_0 ),
        .D(\wr_ptr[0]_i_1_n_0 ),
        .Q(wr_ptr[0]),
        .R(module_enable_reg));
  FDRE \wr_ptr_reg[1] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(\wr_ptr[7]_i_1_n_0 ),
        .D(\wr_ptr[1]_i_1_n_0 ),
        .Q(wr_ptr[1]),
        .R(module_enable_reg));
  FDRE \wr_ptr_reg[2] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(\wr_ptr[7]_i_1_n_0 ),
        .D(\wr_ptr[2]_i_1_n_0 ),
        .Q(wr_ptr[2]),
        .R(module_enable_reg));
  FDRE \wr_ptr_reg[3] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(\wr_ptr[7]_i_1_n_0 ),
        .D(\wr_ptr[3]_i_1_n_0 ),
        .Q(wr_ptr[3]),
        .R(module_enable_reg));
  FDRE \wr_ptr_reg[4] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(\wr_ptr[7]_i_1_n_0 ),
        .D(\wr_ptr[4]_i_1_n_0 ),
        .Q(wr_ptr[4]),
        .R(module_enable_reg));
  FDRE \wr_ptr_reg[5] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(\wr_ptr[7]_i_1_n_0 ),
        .D(\wr_ptr[5]_i_1_n_0 ),
        .Q(wr_ptr[5]),
        .R(module_enable_reg));
  FDRE \wr_ptr_reg[6] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(\wr_ptr[7]_i_1_n_0 ),
        .D(\wr_ptr[6]_i_1_n_0 ),
        .Q(wr_ptr[6]),
        .R(module_enable_reg));
  FDRE \wr_ptr_reg[7] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(\wr_ptr[7]_i_1_n_0 ),
        .D(\wr_ptr[7]_i_2_n_0 ),
        .Q(wr_ptr[7]),
        .R(module_enable_reg));
endmodule

module pulse_stretcher
   (irq_con_o,
    rst_n_IBUF,
    out,
    sys_clk_IBUF_BUFG);
  output irq_con_o;
  input rst_n_IBUF;
  input out;
  input sys_clk_IBUF_BUFG;

  wire \counter[0]_i_1_n_0 ;
  wire \counter[1]_i_1_n_0 ;
  wire \counter[2]_i_1_n_0 ;
  wire \counter[3]_i_1_n_0 ;
  wire \counter[3]_i_2_n_0 ;
  wire \counter_reg_n_0_[0] ;
  wire \counter_reg_n_0_[1] ;
  wire \counter_reg_n_0_[2] ;
  wire \counter_reg_n_0_[3] ;
  wire imp_out0__0;
  wire imp_out_i_1_n_0;
  wire in_prev;
  wire in_sync;
  wire irq_con_o;
  wire out;
  wire rst_n_IBUF;
  wire sys_clk_IBUF_BUFG;

  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT4 #(
    .INIT(16'h14FF)) 
    \counter[0]_i_1 
       (.I0(irq_con_o),
        .I1(in_prev),
        .I2(in_sync),
        .I3(\counter_reg_n_0_[0] ),
        .O(\counter[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'hFF1414FF)) 
    \counter[1]_i_1 
       (.I0(irq_con_o),
        .I1(in_prev),
        .I2(in_sync),
        .I3(\counter_reg_n_0_[1] ),
        .I4(\counter_reg_n_0_[0] ),
        .O(\counter[1]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFF14FF14FF1414FF)) 
    \counter[2]_i_1 
       (.I0(irq_con_o),
        .I1(in_prev),
        .I2(in_sync),
        .I3(\counter_reg_n_0_[2] ),
        .I4(\counter_reg_n_0_[0] ),
        .I5(\counter_reg_n_0_[1] ),
        .O(\counter[2]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFE0000)) 
    \counter[3]_i_1 
       (.I0(\counter_reg_n_0_[0] ),
        .I1(\counter_reg_n_0_[1] ),
        .I2(\counter_reg_n_0_[3] ),
        .I3(\counter_reg_n_0_[2] ),
        .I4(irq_con_o),
        .I5(imp_out0__0),
        .O(\counter[3]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hEEEEEEEB)) 
    \counter[3]_i_2 
       (.I0(imp_out0__0),
        .I1(\counter_reg_n_0_[3] ),
        .I2(\counter_reg_n_0_[1] ),
        .I3(\counter_reg_n_0_[0] ),
        .I4(\counter_reg_n_0_[2] ),
        .O(\counter[3]_i_2_n_0 ));
  FDRE \counter_reg[0] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(\counter[3]_i_1_n_0 ),
        .D(\counter[0]_i_1_n_0 ),
        .Q(\counter_reg_n_0_[0] ),
        .R(rst_n_IBUF));
  FDRE \counter_reg[1] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(\counter[3]_i_1_n_0 ),
        .D(\counter[1]_i_1_n_0 ),
        .Q(\counter_reg_n_0_[1] ),
        .R(rst_n_IBUF));
  FDRE \counter_reg[2] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(\counter[3]_i_1_n_0 ),
        .D(\counter[2]_i_1_n_0 ),
        .Q(\counter_reg_n_0_[2] ),
        .R(rst_n_IBUF));
  FDRE \counter_reg[3] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(\counter[3]_i_1_n_0 ),
        .D(\counter[3]_i_2_n_0 ),
        .Q(\counter_reg_n_0_[3] ),
        .R(rst_n_IBUF));
  LUT3 #(
    .INIT(8'h06)) 
    imp_out0
       (.I0(in_sync),
        .I1(in_prev),
        .I2(irq_con_o),
        .O(imp_out0__0));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFE0000)) 
    imp_out_i_1
       (.I0(\counter_reg_n_0_[2] ),
        .I1(\counter_reg_n_0_[3] ),
        .I2(\counter_reg_n_0_[1] ),
        .I3(\counter_reg_n_0_[0] ),
        .I4(irq_con_o),
        .I5(imp_out0__0),
        .O(imp_out_i_1_n_0));
  FDRE imp_out_reg
       (.C(sys_clk_IBUF_BUFG),
        .CE(1'b1),
        .D(imp_out_i_1_n_0),
        .Q(irq_con_o),
        .R(rst_n_IBUF));
  FDRE in_prev_reg
       (.C(sys_clk_IBUF_BUFG),
        .CE(1'b1),
        .D(in_sync),
        .Q(in_prev),
        .R(rst_n_IBUF));
  FDRE in_sync_reg
       (.C(sys_clk_IBUF_BUFG),
        .CE(1'b1),
        .D(out),
        .Q(in_sync),
        .R(rst_n_IBUF));
endmodule

(* ORIG_REF_NAME = "pulse_stretcher" *) 
module pulse_stretcher_0
   (irq_o,
    rst_n_IBUF,
    imp_i,
    sys_clk_IBUF_BUFG);
  output irq_o;
  input rst_n_IBUF;
  input imp_i;
  input sys_clk_IBUF_BUFG;

  wire \counter[0]_i_1__0_n_0 ;
  wire \counter[1]_i_1__0_n_0 ;
  wire \counter[2]_i_1__0_n_0 ;
  wire \counter[3]_i_1__0_n_0 ;
  wire \counter[3]_i_2__0_n_0 ;
  wire \counter_reg_n_0_[0] ;
  wire \counter_reg_n_0_[1] ;
  wire \counter_reg_n_0_[2] ;
  wire \counter_reg_n_0_[3] ;
  wire imp_i;
  wire imp_out0__0;
  wire imp_out_i_1__0_n_0;
  wire in_prev;
  wire in_sync;
  wire irq_o;
  wire rst_n_IBUF;
  wire sys_clk_IBUF_BUFG;

  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT4 #(
    .INIT(16'h14FF)) 
    \counter[0]_i_1__0 
       (.I0(irq_o),
        .I1(in_prev),
        .I2(in_sync),
        .I3(\counter_reg_n_0_[0] ),
        .O(\counter[0]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT5 #(
    .INIT(32'hFF1414FF)) 
    \counter[1]_i_1__0 
       (.I0(irq_o),
        .I1(in_prev),
        .I2(in_sync),
        .I3(\counter_reg_n_0_[1] ),
        .I4(\counter_reg_n_0_[0] ),
        .O(\counter[1]_i_1__0_n_0 ));
  LUT6 #(
    .INIT(64'hFF14FF14FF1414FF)) 
    \counter[2]_i_1__0 
       (.I0(irq_o),
        .I1(in_prev),
        .I2(in_sync),
        .I3(\counter_reg_n_0_[2] ),
        .I4(\counter_reg_n_0_[0] ),
        .I5(\counter_reg_n_0_[1] ),
        .O(\counter[2]_i_1__0_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFE0000)) 
    \counter[3]_i_1__0 
       (.I0(\counter_reg_n_0_[0] ),
        .I1(\counter_reg_n_0_[1] ),
        .I2(\counter_reg_n_0_[3] ),
        .I3(\counter_reg_n_0_[2] ),
        .I4(irq_o),
        .I5(imp_out0__0),
        .O(\counter[3]_i_1__0_n_0 ));
  LUT5 #(
    .INIT(32'hEEEEEEEB)) 
    \counter[3]_i_2__0 
       (.I0(imp_out0__0),
        .I1(\counter_reg_n_0_[3] ),
        .I2(\counter_reg_n_0_[1] ),
        .I3(\counter_reg_n_0_[0] ),
        .I4(\counter_reg_n_0_[2] ),
        .O(\counter[3]_i_2__0_n_0 ));
  FDRE \counter_reg[0] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(\counter[3]_i_1__0_n_0 ),
        .D(\counter[0]_i_1__0_n_0 ),
        .Q(\counter_reg_n_0_[0] ),
        .R(rst_n_IBUF));
  FDRE \counter_reg[1] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(\counter[3]_i_1__0_n_0 ),
        .D(\counter[1]_i_1__0_n_0 ),
        .Q(\counter_reg_n_0_[1] ),
        .R(rst_n_IBUF));
  FDRE \counter_reg[2] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(\counter[3]_i_1__0_n_0 ),
        .D(\counter[2]_i_1__0_n_0 ),
        .Q(\counter_reg_n_0_[2] ),
        .R(rst_n_IBUF));
  FDRE \counter_reg[3] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(\counter[3]_i_1__0_n_0 ),
        .D(\counter[3]_i_2__0_n_0 ),
        .Q(\counter_reg_n_0_[3] ),
        .R(rst_n_IBUF));
  LUT3 #(
    .INIT(8'h06)) 
    imp_out0
       (.I0(in_sync),
        .I1(in_prev),
        .I2(irq_o),
        .O(imp_out0__0));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFE0000)) 
    imp_out_i_1__0
       (.I0(\counter_reg_n_0_[2] ),
        .I1(\counter_reg_n_0_[3] ),
        .I2(\counter_reg_n_0_[1] ),
        .I3(\counter_reg_n_0_[0] ),
        .I4(irq_o),
        .I5(imp_out0__0),
        .O(imp_out_i_1__0_n_0));
  FDRE imp_out_reg
       (.C(sys_clk_IBUF_BUFG),
        .CE(1'b1),
        .D(imp_out_i_1__0_n_0),
        .Q(irq_o),
        .R(rst_n_IBUF));
  FDRE in_prev_reg
       (.C(sys_clk_IBUF_BUFG),
        .CE(1'b1),
        .D(in_sync),
        .Q(in_prev),
        .R(rst_n_IBUF));
  FDRE in_sync_reg
       (.C(sys_clk_IBUF_BUFG),
        .CE(1'b1),
        .D(imp_i),
        .Q(in_sync),
        .R(rst_n_IBUF));
endmodule

module uart_rx
   (out,
    rx_valid,
    rx_error,
    rst_n,
    in0,
    rst,
    sys_clk_IBUF_BUFG,
    \baud_cnt_reg[1]_0 ,
    \baud_cnt_reg[1]_1 ,
    rst_n_IBUF);
  output [7:0]out;
  output rx_valid;
  output rx_error;
  output rst_n;
  input in0;
  input rst;
  input sys_clk_IBUF_BUFG;
  input \baud_cnt_reg[1]_0 ;
  input \baud_cnt_reg[1]_1 ;
  input rst_n_IBUF;

  (* DONT_TOUCH *) wire [15:0]baud_cnt;
  wire \baud_cnt[0]_i_1__0_n_0 ;
  wire \baud_cnt[0]_i_2_n_0 ;
  wire \baud_cnt[10]_i_1__0_n_0 ;
  wire \baud_cnt[11]_i_1__0_n_0 ;
  wire \baud_cnt[12]_i_1__0_n_0 ;
  wire \baud_cnt[13]_i_1__0_n_0 ;
  wire \baud_cnt[14]_i_1__0_n_0 ;
  wire \baud_cnt[15]_i_1__0_n_0 ;
  wire \baud_cnt[15]_i_2__0_n_0 ;
  wire \baud_cnt[15]_i_3__0_n_0 ;
  wire \baud_cnt[15]_i_4__0_n_0 ;
  wire \baud_cnt[15]_i_5__0_n_0 ;
  wire \baud_cnt[1]_i_1__0_n_0 ;
  wire \baud_cnt[2]_i_1__0_n_0 ;
  wire \baud_cnt[3]_i_1__0_n_0 ;
  wire \baud_cnt[4]_i_1__0_n_0 ;
  wire \baud_cnt[5]_i_1__0_n_0 ;
  wire \baud_cnt[6]_i_1__0_n_0 ;
  wire \baud_cnt[7]_i_1__0_n_0 ;
  wire \baud_cnt[8]_i_1__0_n_0 ;
  wire \baud_cnt[9]_i_1__0_n_0 ;
  wire \baud_cnt_reg[12]_i_2_n_0 ;
  wire \baud_cnt_reg[1]_0 ;
  wire \baud_cnt_reg[1]_1 ;
  wire \baud_cnt_reg[4]_i_2_n_0 ;
  wire \baud_cnt_reg[8]_i_2_n_0 ;
  (* DONT_TOUCH *) wire [3:0]bit_cnt;
  wire [3:1]bit_cnt0_in;
  wire \bit_cnt[0]_i_1__0_n_0 ;
  wire \bit_cnt[3]_i_2__0_n_0 ;
  wire \bit_cnt[3]_i_3_n_0 ;
  wire [15:1]data0;
  wire \data[7]_i_1_n_0 ;
  (* DONT_TOUCH *) wire error_reg;
  wire error_reg_i_1_n_0;
  (* DONT_TOUCH *) wire in0;
  (* DONT_TOUCH *) wire [7:0]out;
  (* DONT_TOUCH *) wire parity;
  wire parity_i_1_n_0;
  wire parity_i_2_n_0;
  wire parity_i_3_n_0;
  wire parity_i_4_n_0;
  wire parity_i_5_n_0;
  (* DONT_TOUCH *) wire receiving;
  wire receiving_i_1_n_0;
  wire receiving_i_2_n_0;
  wire receiving_i_3_n_0;
  wire receiving_i_4_n_0;
  wire receiving_i_5_n_0;
  wire receiving_i_6_n_0;
  wire receiving_i_7_n_0;
  wire rst;
  wire rst_n;
  wire rst_n_IBUF;
  (* DONT_TOUCH *) wire rx_error;
  (* DONT_TOUCH *) wire rx_falling;
  wire rx_falling_reg0;
  (* DONT_TOUCH *) wire rx_sync1;
  (* DONT_TOUCH *) wire rx_sync2;
  (* DONT_TOUCH *) wire rx_valid;
  (* DONT_TOUCH *) wire [8:0]shift_reg;
  wire \shift_reg[8]_i_1_n_0 ;
  wire sys_clk_IBUF_BUFG;
  (* DONT_TOUCH *) (* SRL_STYLE = "register" *) wire valid_reg;
  wire valid_reg_i_1_n_0;
  wire valid_reg_i_2_n_0;
  wire [2:0]\NLW_baud_cnt_reg[12]_i_2_CO_UNCONNECTED ;
  wire [3:0]\NLW_baud_cnt_reg[15]_i_6_CO_UNCONNECTED ;
  wire [3:3]\NLW_baud_cnt_reg[15]_i_6_O_UNCONNECTED ;
  wire [2:0]\NLW_baud_cnt_reg[4]_i_2_CO_UNCONNECTED ;
  wire [2:0]\NLW_baud_cnt_reg[8]_i_2_CO_UNCONNECTED ;

  LUT5 #(
    .INIT(32'hFFFF4FFF)) 
    \baud_cnt[0]_i_1__0 
       (.I0(receiving),
        .I1(rx_falling),
        .I2(\baud_cnt_reg[1]_0 ),
        .I3(\baud_cnt_reg[1]_1 ),
        .I4(rst_n_IBUF),
        .O(\baud_cnt[0]_i_1__0_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \baud_cnt[0]_i_2 
       (.I0(receiving),
        .I1(baud_cnt[0]),
        .O(\baud_cnt[0]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hFFFB0000)) 
    \baud_cnt[10]_i_1__0 
       (.I0(\baud_cnt[15]_i_2__0_n_0 ),
        .I1(\baud_cnt[15]_i_3__0_n_0 ),
        .I2(\baud_cnt[15]_i_4__0_n_0 ),
        .I3(\baud_cnt[15]_i_5__0_n_0 ),
        .I4(data0[10]),
        .O(\baud_cnt[10]_i_1__0_n_0 ));
  LUT5 #(
    .INIT(32'hFFFB0000)) 
    \baud_cnt[11]_i_1__0 
       (.I0(\baud_cnt[15]_i_2__0_n_0 ),
        .I1(\baud_cnt[15]_i_3__0_n_0 ),
        .I2(\baud_cnt[15]_i_4__0_n_0 ),
        .I3(\baud_cnt[15]_i_5__0_n_0 ),
        .I4(data0[11]),
        .O(\baud_cnt[11]_i_1__0_n_0 ));
  LUT5 #(
    .INIT(32'hFFFB0000)) 
    \baud_cnt[12]_i_1__0 
       (.I0(\baud_cnt[15]_i_2__0_n_0 ),
        .I1(\baud_cnt[15]_i_3__0_n_0 ),
        .I2(\baud_cnt[15]_i_4__0_n_0 ),
        .I3(\baud_cnt[15]_i_5__0_n_0 ),
        .I4(data0[12]),
        .O(\baud_cnt[12]_i_1__0_n_0 ));
  LUT5 #(
    .INIT(32'hFFFB0000)) 
    \baud_cnt[13]_i_1__0 
       (.I0(\baud_cnt[15]_i_2__0_n_0 ),
        .I1(\baud_cnt[15]_i_3__0_n_0 ),
        .I2(\baud_cnt[15]_i_4__0_n_0 ),
        .I3(\baud_cnt[15]_i_5__0_n_0 ),
        .I4(data0[13]),
        .O(\baud_cnt[13]_i_1__0_n_0 ));
  LUT5 #(
    .INIT(32'hFFFB0000)) 
    \baud_cnt[14]_i_1__0 
       (.I0(\baud_cnt[15]_i_2__0_n_0 ),
        .I1(\baud_cnt[15]_i_3__0_n_0 ),
        .I2(\baud_cnt[15]_i_4__0_n_0 ),
        .I3(\baud_cnt[15]_i_5__0_n_0 ),
        .I4(data0[14]),
        .O(\baud_cnt[14]_i_1__0_n_0 ));
  LUT5 #(
    .INIT(32'hFFFB0000)) 
    \baud_cnt[15]_i_1__0 
       (.I0(\baud_cnt[15]_i_2__0_n_0 ),
        .I1(\baud_cnt[15]_i_3__0_n_0 ),
        .I2(\baud_cnt[15]_i_4__0_n_0 ),
        .I3(\baud_cnt[15]_i_5__0_n_0 ),
        .I4(data0[15]),
        .O(\baud_cnt[15]_i_1__0_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \baud_cnt[15]_i_2__0 
       (.I0(baud_cnt[5]),
        .I1(baud_cnt[13]),
        .I2(baud_cnt[6]),
        .I3(baud_cnt[7]),
        .O(\baud_cnt[15]_i_2__0_n_0 ));
  LUT4 #(
    .INIT(16'h0001)) 
    \baud_cnt[15]_i_3__0 
       (.I0(baud_cnt[1]),
        .I1(baud_cnt[15]),
        .I2(baud_cnt[3]),
        .I3(baud_cnt[2]),
        .O(\baud_cnt[15]_i_3__0_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \baud_cnt[15]_i_4__0 
       (.I0(baud_cnt[9]),
        .I1(baud_cnt[8]),
        .I2(baud_cnt[12]),
        .I3(baud_cnt[11]),
        .O(\baud_cnt[15]_i_4__0_n_0 ));
  LUT4 #(
    .INIT(16'hFF7F)) 
    \baud_cnt[15]_i_5__0 
       (.I0(baud_cnt[0]),
        .I1(baud_cnt[10]),
        .I2(baud_cnt[4]),
        .I3(baud_cnt[14]),
        .O(\baud_cnt[15]_i_5__0_n_0 ));
  LUT5 #(
    .INIT(32'hFFFB0000)) 
    \baud_cnt[1]_i_1__0 
       (.I0(\baud_cnt[15]_i_2__0_n_0 ),
        .I1(\baud_cnt[15]_i_3__0_n_0 ),
        .I2(\baud_cnt[15]_i_4__0_n_0 ),
        .I3(\baud_cnt[15]_i_5__0_n_0 ),
        .I4(data0[1]),
        .O(\baud_cnt[1]_i_1__0_n_0 ));
  LUT5 #(
    .INIT(32'hFFFB0000)) 
    \baud_cnt[2]_i_1__0 
       (.I0(\baud_cnt[15]_i_2__0_n_0 ),
        .I1(\baud_cnt[15]_i_3__0_n_0 ),
        .I2(\baud_cnt[15]_i_4__0_n_0 ),
        .I3(\baud_cnt[15]_i_5__0_n_0 ),
        .I4(data0[2]),
        .O(\baud_cnt[2]_i_1__0_n_0 ));
  LUT5 #(
    .INIT(32'hFFFB0000)) 
    \baud_cnt[3]_i_1__0 
       (.I0(\baud_cnt[15]_i_2__0_n_0 ),
        .I1(\baud_cnt[15]_i_3__0_n_0 ),
        .I2(\baud_cnt[15]_i_4__0_n_0 ),
        .I3(\baud_cnt[15]_i_5__0_n_0 ),
        .I4(data0[3]),
        .O(\baud_cnt[3]_i_1__0_n_0 ));
  LUT5 #(
    .INIT(32'hFFFB0000)) 
    \baud_cnt[4]_i_1__0 
       (.I0(\baud_cnt[15]_i_2__0_n_0 ),
        .I1(\baud_cnt[15]_i_3__0_n_0 ),
        .I2(\baud_cnt[15]_i_4__0_n_0 ),
        .I3(\baud_cnt[15]_i_5__0_n_0 ),
        .I4(data0[4]),
        .O(\baud_cnt[4]_i_1__0_n_0 ));
  LUT5 #(
    .INIT(32'hFFFB0000)) 
    \baud_cnt[5]_i_1__0 
       (.I0(\baud_cnt[15]_i_2__0_n_0 ),
        .I1(\baud_cnt[15]_i_3__0_n_0 ),
        .I2(\baud_cnt[15]_i_4__0_n_0 ),
        .I3(\baud_cnt[15]_i_5__0_n_0 ),
        .I4(data0[5]),
        .O(\baud_cnt[5]_i_1__0_n_0 ));
  LUT5 #(
    .INIT(32'hFFFB0000)) 
    \baud_cnt[6]_i_1__0 
       (.I0(\baud_cnt[15]_i_2__0_n_0 ),
        .I1(\baud_cnt[15]_i_3__0_n_0 ),
        .I2(\baud_cnt[15]_i_4__0_n_0 ),
        .I3(\baud_cnt[15]_i_5__0_n_0 ),
        .I4(data0[6]),
        .O(\baud_cnt[6]_i_1__0_n_0 ));
  LUT5 #(
    .INIT(32'hFFFB0000)) 
    \baud_cnt[7]_i_1__0 
       (.I0(\baud_cnt[15]_i_2__0_n_0 ),
        .I1(\baud_cnt[15]_i_3__0_n_0 ),
        .I2(\baud_cnt[15]_i_4__0_n_0 ),
        .I3(\baud_cnt[15]_i_5__0_n_0 ),
        .I4(data0[7]),
        .O(\baud_cnt[7]_i_1__0_n_0 ));
  LUT5 #(
    .INIT(32'hFFFB0000)) 
    \baud_cnt[8]_i_1__0 
       (.I0(\baud_cnt[15]_i_2__0_n_0 ),
        .I1(\baud_cnt[15]_i_3__0_n_0 ),
        .I2(\baud_cnt[15]_i_4__0_n_0 ),
        .I3(\baud_cnt[15]_i_5__0_n_0 ),
        .I4(data0[8]),
        .O(\baud_cnt[8]_i_1__0_n_0 ));
  LUT5 #(
    .INIT(32'hFFFB0000)) 
    \baud_cnt[9]_i_1__0 
       (.I0(\baud_cnt[15]_i_2__0_n_0 ),
        .I1(\baud_cnt[15]_i_3__0_n_0 ),
        .I2(\baud_cnt[15]_i_4__0_n_0 ),
        .I3(\baud_cnt[15]_i_5__0_n_0 ),
        .I4(data0[9]),
        .O(\baud_cnt[9]_i_1__0_n_0 ));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  FDRE \baud_cnt_reg[0] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\baud_cnt[0]_i_2_n_0 ),
        .Q(baud_cnt[0]),
        .R(\baud_cnt[0]_i_1__0_n_0 ));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  FDRE \baud_cnt_reg[10] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(receiving),
        .D(\baud_cnt[10]_i_1__0_n_0 ),
        .Q(baud_cnt[10]),
        .R(\baud_cnt[0]_i_1__0_n_0 ));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  FDRE \baud_cnt_reg[11] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(receiving),
        .D(\baud_cnt[11]_i_1__0_n_0 ),
        .Q(baud_cnt[11]),
        .R(\baud_cnt[0]_i_1__0_n_0 ));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  FDRE \baud_cnt_reg[12] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(receiving),
        .D(\baud_cnt[12]_i_1__0_n_0 ),
        .Q(baud_cnt[12]),
        .R(\baud_cnt[0]_i_1__0_n_0 ));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \baud_cnt_reg[12]_i_2 
       (.CI(\baud_cnt_reg[8]_i_2_n_0 ),
        .CO({\baud_cnt_reg[12]_i_2_n_0 ,\NLW_baud_cnt_reg[12]_i_2_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(data0[12:9]),
        .S(baud_cnt[12:9]));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  FDRE \baud_cnt_reg[13] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(receiving),
        .D(\baud_cnt[13]_i_1__0_n_0 ),
        .Q(baud_cnt[13]),
        .R(\baud_cnt[0]_i_1__0_n_0 ));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  FDRE \baud_cnt_reg[14] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(receiving),
        .D(\baud_cnt[14]_i_1__0_n_0 ),
        .Q(baud_cnt[14]),
        .R(\baud_cnt[0]_i_1__0_n_0 ));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  FDRE \baud_cnt_reg[15] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(receiving),
        .D(\baud_cnt[15]_i_1__0_n_0 ),
        .Q(baud_cnt[15]),
        .R(\baud_cnt[0]_i_1__0_n_0 ));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \baud_cnt_reg[15]_i_6 
       (.CI(\baud_cnt_reg[12]_i_2_n_0 ),
        .CO(\NLW_baud_cnt_reg[15]_i_6_CO_UNCONNECTED [3:0]),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\NLW_baud_cnt_reg[15]_i_6_O_UNCONNECTED [3],data0[15:13]}),
        .S({1'b0,baud_cnt[15:13]}));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  FDRE \baud_cnt_reg[1] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(receiving),
        .D(\baud_cnt[1]_i_1__0_n_0 ),
        .Q(baud_cnt[1]),
        .R(\baud_cnt[0]_i_1__0_n_0 ));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  FDRE \baud_cnt_reg[2] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(receiving),
        .D(\baud_cnt[2]_i_1__0_n_0 ),
        .Q(baud_cnt[2]),
        .R(\baud_cnt[0]_i_1__0_n_0 ));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  FDRE \baud_cnt_reg[3] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(receiving),
        .D(\baud_cnt[3]_i_1__0_n_0 ),
        .Q(baud_cnt[3]),
        .R(\baud_cnt[0]_i_1__0_n_0 ));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  FDRE \baud_cnt_reg[4] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(receiving),
        .D(\baud_cnt[4]_i_1__0_n_0 ),
        .Q(baud_cnt[4]),
        .R(\baud_cnt[0]_i_1__0_n_0 ));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \baud_cnt_reg[4]_i_2 
       (.CI(1'b0),
        .CO({\baud_cnt_reg[4]_i_2_n_0 ,\NLW_baud_cnt_reg[4]_i_2_CO_UNCONNECTED [2:0]}),
        .CYINIT(baud_cnt[0]),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(data0[4:1]),
        .S(baud_cnt[4:1]));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  FDRE \baud_cnt_reg[5] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(receiving),
        .D(\baud_cnt[5]_i_1__0_n_0 ),
        .Q(baud_cnt[5]),
        .R(\baud_cnt[0]_i_1__0_n_0 ));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  FDRE \baud_cnt_reg[6] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(receiving),
        .D(\baud_cnt[6]_i_1__0_n_0 ),
        .Q(baud_cnt[6]),
        .R(\baud_cnt[0]_i_1__0_n_0 ));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  FDRE \baud_cnt_reg[7] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(receiving),
        .D(\baud_cnt[7]_i_1__0_n_0 ),
        .Q(baud_cnt[7]),
        .R(\baud_cnt[0]_i_1__0_n_0 ));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  FDRE \baud_cnt_reg[8] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(receiving),
        .D(\baud_cnt[8]_i_1__0_n_0 ),
        .Q(baud_cnt[8]),
        .R(\baud_cnt[0]_i_1__0_n_0 ));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \baud_cnt_reg[8]_i_2 
       (.CI(\baud_cnt_reg[4]_i_2_n_0 ),
        .CO({\baud_cnt_reg[8]_i_2_n_0 ,\NLW_baud_cnt_reg[8]_i_2_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(data0[8:5]),
        .S(baud_cnt[8:5]));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  FDRE \baud_cnt_reg[9] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(receiving),
        .D(\baud_cnt[9]_i_1__0_n_0 ),
        .Q(baud_cnt[9]),
        .R(\baud_cnt[0]_i_1__0_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \bit_cnt[0]_i_1__0 
       (.I0(bit_cnt[0]),
        .I1(\bit_cnt[3]_i_2__0_n_0 ),
        .O(\bit_cnt[0]_i_1__0_n_0 ));
  LUT3 #(
    .INIT(8'h9A)) 
    \bit_cnt[1]_i_1 
       (.I0(bit_cnt[1]),
        .I1(\bit_cnt[3]_i_2__0_n_0 ),
        .I2(bit_cnt[0]),
        .O(bit_cnt0_in[1]));
  LUT4 #(
    .INIT(16'hA6AA)) 
    \bit_cnt[2]_i_1 
       (.I0(bit_cnt[2]),
        .I1(bit_cnt[0]),
        .I2(\bit_cnt[3]_i_2__0_n_0 ),
        .I3(bit_cnt[1]),
        .O(bit_cnt0_in[2]));
  LUT5 #(
    .INIT(32'hA6AAAAAA)) 
    \bit_cnt[3]_i_1__0 
       (.I0(bit_cnt[3]),
        .I1(bit_cnt[1]),
        .I2(\bit_cnt[3]_i_2__0_n_0 ),
        .I3(bit_cnt[0]),
        .I4(bit_cnt[2]),
        .O(bit_cnt0_in[3]));
  LUT5 #(
    .INIT(32'hFFFDFFFF)) 
    \bit_cnt[3]_i_2__0 
       (.I0(receiving_i_7_n_0),
        .I1(receiving_i_6_n_0),
        .I2(receiving_i_5_n_0),
        .I3(\bit_cnt[3]_i_3_n_0 ),
        .I4(receiving),
        .O(\bit_cnt[3]_i_2__0_n_0 ));
  LUT4 #(
    .INIT(16'hFFEF)) 
    \bit_cnt[3]_i_3 
       (.I0(baud_cnt[6]),
        .I1(baud_cnt[4]),
        .I2(baud_cnt[9]),
        .I3(baud_cnt[1]),
        .O(\bit_cnt[3]_i_3_n_0 ));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  FDRE \bit_cnt_reg[0] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\bit_cnt[0]_i_1__0_n_0 ),
        .Q(bit_cnt[0]),
        .R(\baud_cnt[0]_i_1__0_n_0 ));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  FDRE \bit_cnt_reg[1] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(1'b1),
        .D(bit_cnt0_in[1]),
        .Q(bit_cnt[1]),
        .R(\baud_cnt[0]_i_1__0_n_0 ));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  FDRE \bit_cnt_reg[2] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(1'b1),
        .D(bit_cnt0_in[2]),
        .Q(bit_cnt[2]),
        .R(\baud_cnt[0]_i_1__0_n_0 ));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  FDRE \bit_cnt_reg[3] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(1'b1),
        .D(bit_cnt0_in[3]),
        .Q(bit_cnt[3]),
        .R(\baud_cnt[0]_i_1__0_n_0 ));
  LUT4 #(
    .INIT(16'h1000)) 
    \data[7]_i_1 
       (.I0(receiving_i_2_n_0),
        .I1(receiving_i_3_n_0),
        .I2(rx_sync2),
        .I3(receiving),
        .O(\data[7]_i_1_n_0 ));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  FDRE \data_reg[0] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(\data[7]_i_1_n_0 ),
        .D(shift_reg[1]),
        .Q(out[0]),
        .R(rst));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  FDRE \data_reg[1] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(\data[7]_i_1_n_0 ),
        .D(shift_reg[2]),
        .Q(out[1]),
        .R(rst));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  FDRE \data_reg[2] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(\data[7]_i_1_n_0 ),
        .D(shift_reg[3]),
        .Q(out[2]),
        .R(rst));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  FDRE \data_reg[3] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(\data[7]_i_1_n_0 ),
        .D(shift_reg[4]),
        .Q(out[3]),
        .R(rst));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  FDRE \data_reg[4] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(\data[7]_i_1_n_0 ),
        .D(shift_reg[5]),
        .Q(out[4]),
        .R(rst));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  FDRE \data_reg[5] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(\data[7]_i_1_n_0 ),
        .D(shift_reg[6]),
        .Q(out[5]),
        .R(rst));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  FDRE \data_reg[6] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(\data[7]_i_1_n_0 ),
        .D(shift_reg[7]),
        .Q(out[6]),
        .R(rst));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  FDRE \data_reg[7] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(\data[7]_i_1_n_0 ),
        .D(shift_reg[8]),
        .Q(out[7]),
        .R(rst));
  LUT4 #(
    .INIT(16'hAAAB)) 
    error_reg_i_1
       (.I0(error_reg),
        .I1(\bit_cnt[3]_i_2__0_n_0 ),
        .I2(rx_sync2),
        .I3(receiving_i_2_n_0),
        .O(error_reg_i_1_n_0));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  FDRE error_reg_reg
       (.C(sys_clk_IBUF_BUFG),
        .CE(1'b1),
        .D(error_reg_i_1_n_0),
        .Q(error_reg),
        .R(rst));
  LUT1 #(
    .INIT(2'h2)) 
    i_0
       (.I0(1'b0),
        .O(rx_error));
  LUT3 #(
    .INIT(8'h40)) 
    mem_reg_i_1
       (.I0(rst_n_IBUF),
        .I1(\baud_cnt_reg[1]_1 ),
        .I2(\baud_cnt_reg[1]_0 ),
        .O(rst_n));
  LUT4 #(
    .INIT(16'hFB08)) 
    parity_i_1
       (.I0(rx_sync2),
        .I1(parity_i_2_n_0),
        .I2(parity_i_3_n_0),
        .I3(parity),
        .O(parity_i_1_n_0));
  LUT5 #(
    .INIT(32'h00000001)) 
    parity_i_2
       (.I0(baud_cnt[10]),
        .I1(baud_cnt[8]),
        .I2(baud_cnt[11]),
        .I3(baud_cnt[7]),
        .I4(receiving_i_6_n_0),
        .O(parity_i_2_n_0));
  LUT5 #(
    .INIT(32'hFFEFFFFF)) 
    parity_i_3
       (.I0(parity_i_4_n_0),
        .I1(parity_i_5_n_0),
        .I2(baud_cnt[5]),
        .I3(baud_cnt[3]),
        .I4(bit_cnt[3]),
        .O(parity_i_3_n_0));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFEFF)) 
    parity_i_4
       (.I0(baud_cnt[6]),
        .I1(baud_cnt[4]),
        .I2(baud_cnt[0]),
        .I3(receiving),
        .I4(bit_cnt[2]),
        .I5(bit_cnt[1]),
        .O(parity_i_4_n_0));
  LUT4 #(
    .INIT(16'h7FFF)) 
    parity_i_5
       (.I0(baud_cnt[1]),
        .I1(baud_cnt[9]),
        .I2(baud_cnt[2]),
        .I3(bit_cnt[0]),
        .O(parity_i_5_n_0));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  FDSE parity_reg
       (.C(sys_clk_IBUF_BUFG),
        .CE(1'b1),
        .D(parity_i_1_n_0),
        .Q(parity),
        .S(rst));
  LUT4 #(
    .INIT(16'hEFE0)) 
    receiving_i_1
       (.I0(receiving_i_2_n_0),
        .I1(receiving_i_3_n_0),
        .I2(receiving),
        .I3(rx_falling),
        .O(receiving_i_1_n_0));
  LUT4 #(
    .INIT(16'hEFFF)) 
    receiving_i_2
       (.I0(bit_cnt[0]),
        .I1(bit_cnt[2]),
        .I2(bit_cnt[1]),
        .I3(bit_cnt[3]),
        .O(receiving_i_2_n_0));
  LUT6 #(
    .INIT(64'hFFFFFFFBFFFFFFFF)) 
    receiving_i_3
       (.I0(receiving_i_4_n_0),
        .I1(baud_cnt[9]),
        .I2(baud_cnt[1]),
        .I3(receiving_i_5_n_0),
        .I4(receiving_i_6_n_0),
        .I5(receiving_i_7_n_0),
        .O(receiving_i_3_n_0));
  LUT2 #(
    .INIT(4'hE)) 
    receiving_i_4
       (.I0(baud_cnt[4]),
        .I1(baud_cnt[6]),
        .O(receiving_i_4_n_0));
  LUT4 #(
    .INIT(16'hFFEF)) 
    receiving_i_5
       (.I0(baud_cnt[0]),
        .I1(baud_cnt[5]),
        .I2(baud_cnt[3]),
        .I3(baud_cnt[2]),
        .O(receiving_i_5_n_0));
  LUT4 #(
    .INIT(16'hFFFE)) 
    receiving_i_6
       (.I0(baud_cnt[12]),
        .I1(baud_cnt[13]),
        .I2(baud_cnt[15]),
        .I3(baud_cnt[14]),
        .O(receiving_i_6_n_0));
  LUT4 #(
    .INIT(16'h0001)) 
    receiving_i_7
       (.I0(baud_cnt[7]),
        .I1(baud_cnt[11]),
        .I2(baud_cnt[8]),
        .I3(baud_cnt[10]),
        .O(receiving_i_7_n_0));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  FDRE receiving_reg
       (.C(sys_clk_IBUF_BUFG),
        .CE(1'b1),
        .D(receiving_i_1_n_0),
        .Q(receiving),
        .R(rst));
  LUT2 #(
    .INIT(4'h2)) 
    rx_falling_i_1
       (.I0(rx_sync2),
        .I1(rx_sync1),
        .O(rx_falling_reg0));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  FDRE rx_falling_reg
       (.C(sys_clk_IBUF_BUFG),
        .CE(1'b1),
        .D(rx_falling_reg0),
        .Q(rx_falling),
        .R(rst));
  (* DONT_TOUCH *) 
  (* IOB = "TRUE" *) 
  (* KEEP = "yes" *) 
  FDSE rx_sync1_reg
       (.C(sys_clk_IBUF_BUFG),
        .CE(1'b1),
        .D(in0),
        .Q(rx_sync1),
        .S(rst));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  FDSE rx_sync2_reg
       (.C(sys_clk_IBUF_BUFG),
        .CE(1'b1),
        .D(rx_sync1),
        .Q(rx_sync2),
        .S(rst));
  LUT5 #(
    .INIT(32'h000001FE)) 
    \shift_reg[8]_i_1 
       (.I0(bit_cnt[0]),
        .I1(bit_cnt[1]),
        .I2(bit_cnt[2]),
        .I3(bit_cnt[3]),
        .I4(\bit_cnt[3]_i_2__0_n_0 ),
        .O(\shift_reg[8]_i_1_n_0 ));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  FDRE \shift_reg_reg[0] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(\shift_reg[8]_i_1_n_0 ),
        .D(shift_reg[1]),
        .Q(shift_reg[0]),
        .R(rst));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  FDRE \shift_reg_reg[1] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(\shift_reg[8]_i_1_n_0 ),
        .D(shift_reg[2]),
        .Q(shift_reg[1]),
        .R(rst));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  FDRE \shift_reg_reg[2] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(\shift_reg[8]_i_1_n_0 ),
        .D(shift_reg[3]),
        .Q(shift_reg[2]),
        .R(rst));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  FDRE \shift_reg_reg[3] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(\shift_reg[8]_i_1_n_0 ),
        .D(shift_reg[4]),
        .Q(shift_reg[3]),
        .R(rst));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  FDRE \shift_reg_reg[4] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(\shift_reg[8]_i_1_n_0 ),
        .D(shift_reg[5]),
        .Q(shift_reg[4]),
        .R(rst));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  FDRE \shift_reg_reg[5] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(\shift_reg[8]_i_1_n_0 ),
        .D(shift_reg[6]),
        .Q(shift_reg[5]),
        .R(rst));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  FDRE \shift_reg_reg[6] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(\shift_reg[8]_i_1_n_0 ),
        .D(shift_reg[7]),
        .Q(shift_reg[6]),
        .R(rst));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  FDRE \shift_reg_reg[7] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(\shift_reg[8]_i_1_n_0 ),
        .D(shift_reg[8]),
        .Q(shift_reg[7]),
        .R(rst));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  FDRE \shift_reg_reg[8] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(\shift_reg[8]_i_1_n_0 ),
        .D(rx_sync2),
        .Q(shift_reg[8]),
        .R(rst));
  LUT6 #(
    .INIT(64'h1115FFFFFFFFFFFF)) 
    valid_reg_i_1
       (.I0(receiving_i_3_n_0),
        .I1(bit_cnt[3]),
        .I2(bit_cnt[1]),
        .I3(bit_cnt[2]),
        .I4(rst_n),
        .I5(receiving),
        .O(valid_reg_i_1_n_0));
  LUT6 #(
    .INIT(64'h0002000000000000)) 
    valid_reg_i_2
       (.I0(rx_sync2),
        .I1(receiving_i_3_n_0),
        .I2(bit_cnt[0]),
        .I3(bit_cnt[2]),
        .I4(bit_cnt[1]),
        .I5(bit_cnt[3]),
        .O(valid_reg_i_2_n_0));
  LUT1 #(
    .INIT(2'h2)) 
    valid_reg_inst
       (.I0(valid_reg),
        .O(rx_valid));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  (* SRL_STYLE = "register" *) 
  FDRE valid_reg_reg
       (.C(sys_clk_IBUF_BUFG),
        .CE(1'b1),
        .D(valid_reg_i_2_n_0),
        .Q(valid_reg),
        .R(valid_reg_i_1_n_0));
endmodule

(* ECO_CHECKSUM = "57c60e12" *) (* POWER_OPT_BRAM_CDC = "0" *) (* POWER_OPT_BRAM_SR_ADDR = "0" *) 
(* POWER_OPT_LOOPED_NET_PERCENTAGE = "0" *) 
(* NotValidForBitStream *)
module uart_top
   (sys_clk,
    rst_n,
    rs_tx_o,
    rs_rx_i,
    led,
    axi_en_i,
    axi_data_i,
    axi_we_i,
    axi_addr_i,
    axi_vd_o,
    axi_data_o,
    rs_dir_o,
    irq_con_o,
    irq_o,
    urr_connected_i);
  input sys_clk;
  input rst_n;
  output rs_tx_o;
  (* dont_touch = "yes" *) input rs_rx_i;
  (* dont_touch = "yes" *) output led;
  (* dont_touch = "yes" *) input axi_en_i;
  (* dont_touch = "yes" *) input [31:0]axi_data_i;
  (* dont_touch = "yes" *) input [3:0]axi_we_i;
  (* dont_touch = "yes" *) input [31:0]axi_addr_i;
  (* dont_touch = "yes" *) output axi_vd_o;
  (* dont_touch = "yes" *) output [31:0]axi_data_o;
  (* dont_touch = "yes" *) output rs_dir_o;
  (* dont_touch = "yes" *) output irq_con_o;
  (* dont_touch = "yes" *) output irq_o;
  (* dont_touch = "yes" *) input urr_connected_i;

  wire [31:0]axi_addr_i;
  (* DONT_TOUCH *) wire [7:0]axi_addr_i_IBUF;
  wire [31:0]axi_data_i;
  (* DONT_TOUCH *) wire [31:0]axi_data_i_IBUF;
  wire [31:0]axi_data_o;
  (* DONT_TOUCH *) wire [31:0]axi_data_o_OBUF;
  wire axi_en_i;
  (* DONT_TOUCH *) wire axi_en_i_IBUF;
  wire axi_vd_o;
  (* DONT_TOUCH *) wire axi_vd_o_OBUF;
  wire [3:0]axi_we_i;
  (* DONT_TOUCH *) wire [3:0]axi_we_i_IBUF;
  (* DONT_TOUCH *) wire [7:0]cmd;
  (* DONT_TOUCH *) wire [7:0]cmd_bram;
  (* DONT_TOUCH *) wire [7:0]cmd_urr;
  (* DONT_TOUCH *) wire crc_done;
  (* DONT_TOUCH *) wire crc_match;
  (* DONT_TOUCH *) wire [31:0]crc_result;
  (* DONT_TOUCH *) wire crc_running;
  (* DONT_TOUCH *) wire done;
  (* DONT_TOUCH *) wire error;
  (* DONT_TOUCH *) wire [23:0]freq;
  wire irq_con_o;
  (* DONT_TOUCH *) wire irq_con_o_OBUF;
  wire irq_o;
  (* DONT_TOUCH *) wire irq_o_OBUF;
  wire led;
  (* DONT_TOUCH *) wire led_OBUF;
  (* DONT_TOUCH *) wire [31:0]led_cnt;
  wire [25:1]led_cnt0;
  wire \led_cnt[25]_i_10_n_0 ;
  wire \led_cnt[25]_i_11_n_0 ;
  wire \led_cnt[25]_i_12_n_0 ;
  wire \led_cnt[25]_i_13_n_0 ;
  wire \led_cnt[25]_i_14_n_0 ;
  wire \led_cnt[25]_i_2_n_0 ;
  wire \led_cnt[25]_i_3_n_0 ;
  wire \led_cnt[25]_i_4_n_0 ;
  wire \led_cnt[25]_i_5_n_0 ;
  wire \led_cnt[25]_i_6_n_0 ;
  wire \led_cnt[25]_i_8_n_0 ;
  wire \led_cnt[25]_i_9_n_0 ;
  wire \led_cnt[31]_i_1_n_0 ;
  wire \led_cnt_reg[12]_i_2_n_0 ;
  wire \led_cnt_reg[16]_i_2_n_0 ;
  wire \led_cnt_reg[20]_i_2_n_0 ;
  wire \led_cnt_reg[24]_i_2_n_0 ;
  wire \led_cnt_reg[4]_i_2_n_0 ;
  wire \led_cnt_reg[8]_i_2_n_0 ;
  (* DONT_TOUCH *) wire led_reg;
  wire led_reg_i_1_n_0;
  (* DONT_TOUCH *) wire module_enable;
  (* DONT_TOUCH *) wire p_0_in;
  wire [25:0]p_0_in__0;
  wire rs_dir_o;
  (* DONT_TOUCH *) wire rs_dir_o_OBUF;
  (* IOB = "TRUE" *) wire rs_rx_i;
  wire rs_rx_i_IBUF;
  (* IOB = "TRUE" *) wire rs_tx_o;
  wire rst;
  wire rst_n;
  wire rst_n_IBUF;
  (* DONT_TOUCH *) wire [7:0]rx_data;
  (* DONT_TOUCH *) wire [7:0]rx_data_delayed;
  (* DONT_TOUCH *) wire [7:0]rx_data_to_urr;
  (* DONT_TOUCH *) wire [7:0]rx_data_to_urr_crc;
  (* DONT_TOUCH *) wire rx_error;
  (* DONT_TOUCH *) wire rx_error_to_urr;
  (* DONT_TOUCH *) wire rx_valid;
  (* DONT_TOUCH *) wire rx_valid_delayed;
  (* DONT_TOUCH *) wire rx_valid_to_urr;
  (* DONT_TOUCH *) wire rx_valid_to_urr_crc;
  (* DONT_TOUCH *) wire start;
  (* DONT_TOUCH *) wire start_bram;
  (* DONT_TOUCH *) wire start_crc_impulse;
  (* DONT_TOUCH *) wire start_urr;
  wire sys_clk;
  wire sys_clk_IBUF;
  wire sys_clk_IBUF_BUFG;
  (* DONT_TOUCH *) wire tx_busy;
  (* DONT_TOUCH *) wire [7:0]tx_data;
  (* DONT_TOUCH *) wire tx_start;
  wire u_rx_n_10;
  wire u_tx_n_1;
  wire urr_connected_i;
  wire [2:0]\NLW_led_cnt_reg[12]_i_2_CO_UNCONNECTED ;
  wire [2:0]\NLW_led_cnt_reg[16]_i_2_CO_UNCONNECTED ;
  wire [2:0]\NLW_led_cnt_reg[20]_i_2_CO_UNCONNECTED ;
  wire [2:0]\NLW_led_cnt_reg[24]_i_2_CO_UNCONNECTED ;
  wire [3:0]\NLW_led_cnt_reg[25]_i_7_CO_UNCONNECTED ;
  wire [3:1]\NLW_led_cnt_reg[25]_i_7_O_UNCONNECTED ;
  wire [2:0]\NLW_led_cnt_reg[4]_i_2_CO_UNCONNECTED ;
  wire [2:0]\NLW_led_cnt_reg[8]_i_2_CO_UNCONNECTED ;

  (* DONT_TOUCH *) 
  IBUF \axi_addr_i_IBUF[0]_inst 
       (.I(axi_addr_i[0]),
        .O(axi_addr_i_IBUF[0]));
  (* DONT_TOUCH *) 
  IBUF \axi_addr_i_IBUF[1]_inst 
       (.I(axi_addr_i[1]),
        .O(axi_addr_i_IBUF[1]));
  (* DONT_TOUCH *) 
  IBUF \axi_addr_i_IBUF[2]_inst 
       (.I(axi_addr_i[2]),
        .O(axi_addr_i_IBUF[2]));
  (* DONT_TOUCH *) 
  IBUF \axi_addr_i_IBUF[3]_inst 
       (.I(axi_addr_i[3]),
        .O(axi_addr_i_IBUF[3]));
  (* DONT_TOUCH *) 
  IBUF \axi_addr_i_IBUF[4]_inst 
       (.I(axi_addr_i[4]),
        .O(axi_addr_i_IBUF[4]));
  (* DONT_TOUCH *) 
  IBUF \axi_addr_i_IBUF[5]_inst 
       (.I(axi_addr_i[5]),
        .O(axi_addr_i_IBUF[5]));
  (* DONT_TOUCH *) 
  IBUF \axi_addr_i_IBUF[6]_inst 
       (.I(axi_addr_i[6]),
        .O(axi_addr_i_IBUF[6]));
  (* DONT_TOUCH *) 
  IBUF \axi_addr_i_IBUF[7]_inst 
       (.I(axi_addr_i[7]),
        .O(axi_addr_i_IBUF[7]));
  (* DONT_TOUCH *) 
  IBUF \axi_data_i_IBUF[0]_inst 
       (.I(axi_data_i[0]),
        .O(axi_data_i_IBUF[0]));
  (* DONT_TOUCH *) 
  IBUF \axi_data_i_IBUF[10]_inst 
       (.I(axi_data_i[10]),
        .O(axi_data_i_IBUF[10]));
  (* DONT_TOUCH *) 
  IBUF \axi_data_i_IBUF[11]_inst 
       (.I(axi_data_i[11]),
        .O(axi_data_i_IBUF[11]));
  (* DONT_TOUCH *) 
  IBUF \axi_data_i_IBUF[12]_inst 
       (.I(axi_data_i[12]),
        .O(axi_data_i_IBUF[12]));
  (* DONT_TOUCH *) 
  IBUF \axi_data_i_IBUF[13]_inst 
       (.I(axi_data_i[13]),
        .O(axi_data_i_IBUF[13]));
  (* DONT_TOUCH *) 
  IBUF \axi_data_i_IBUF[14]_inst 
       (.I(axi_data_i[14]),
        .O(axi_data_i_IBUF[14]));
  (* DONT_TOUCH *) 
  IBUF \axi_data_i_IBUF[15]_inst 
       (.I(axi_data_i[15]),
        .O(axi_data_i_IBUF[15]));
  (* DONT_TOUCH *) 
  IBUF \axi_data_i_IBUF[16]_inst 
       (.I(axi_data_i[16]),
        .O(axi_data_i_IBUF[16]));
  (* DONT_TOUCH *) 
  IBUF \axi_data_i_IBUF[17]_inst 
       (.I(axi_data_i[17]),
        .O(axi_data_i_IBUF[17]));
  (* DONT_TOUCH *) 
  IBUF \axi_data_i_IBUF[18]_inst 
       (.I(axi_data_i[18]),
        .O(axi_data_i_IBUF[18]));
  (* DONT_TOUCH *) 
  IBUF \axi_data_i_IBUF[19]_inst 
       (.I(axi_data_i[19]),
        .O(axi_data_i_IBUF[19]));
  (* DONT_TOUCH *) 
  IBUF \axi_data_i_IBUF[1]_inst 
       (.I(axi_data_i[1]),
        .O(axi_data_i_IBUF[1]));
  (* DONT_TOUCH *) 
  IBUF \axi_data_i_IBUF[20]_inst 
       (.I(axi_data_i[20]),
        .O(axi_data_i_IBUF[20]));
  (* DONT_TOUCH *) 
  IBUF \axi_data_i_IBUF[21]_inst 
       (.I(axi_data_i[21]),
        .O(axi_data_i_IBUF[21]));
  (* DONT_TOUCH *) 
  IBUF \axi_data_i_IBUF[22]_inst 
       (.I(axi_data_i[22]),
        .O(axi_data_i_IBUF[22]));
  (* DONT_TOUCH *) 
  IBUF \axi_data_i_IBUF[23]_inst 
       (.I(axi_data_i[23]),
        .O(axi_data_i_IBUF[23]));
  (* DONT_TOUCH *) 
  IBUF \axi_data_i_IBUF[24]_inst 
       (.I(axi_data_i[24]),
        .O(axi_data_i_IBUF[24]));
  (* DONT_TOUCH *) 
  IBUF \axi_data_i_IBUF[25]_inst 
       (.I(axi_data_i[25]),
        .O(axi_data_i_IBUF[25]));
  (* DONT_TOUCH *) 
  IBUF \axi_data_i_IBUF[26]_inst 
       (.I(axi_data_i[26]),
        .O(axi_data_i_IBUF[26]));
  (* DONT_TOUCH *) 
  IBUF \axi_data_i_IBUF[27]_inst 
       (.I(axi_data_i[27]),
        .O(axi_data_i_IBUF[27]));
  (* DONT_TOUCH *) 
  IBUF \axi_data_i_IBUF[28]_inst 
       (.I(axi_data_i[28]),
        .O(axi_data_i_IBUF[28]));
  (* DONT_TOUCH *) 
  IBUF \axi_data_i_IBUF[29]_inst 
       (.I(axi_data_i[29]),
        .O(axi_data_i_IBUF[29]));
  (* DONT_TOUCH *) 
  IBUF \axi_data_i_IBUF[2]_inst 
       (.I(axi_data_i[2]),
        .O(axi_data_i_IBUF[2]));
  (* DONT_TOUCH *) 
  IBUF \axi_data_i_IBUF[30]_inst 
       (.I(axi_data_i[30]),
        .O(axi_data_i_IBUF[30]));
  (* DONT_TOUCH *) 
  IBUF \axi_data_i_IBUF[31]_inst 
       (.I(axi_data_i[31]),
        .O(axi_data_i_IBUF[31]));
  (* DONT_TOUCH *) 
  IBUF \axi_data_i_IBUF[3]_inst 
       (.I(axi_data_i[3]),
        .O(axi_data_i_IBUF[3]));
  (* DONT_TOUCH *) 
  IBUF \axi_data_i_IBUF[4]_inst 
       (.I(axi_data_i[4]),
        .O(axi_data_i_IBUF[4]));
  (* DONT_TOUCH *) 
  IBUF \axi_data_i_IBUF[5]_inst 
       (.I(axi_data_i[5]),
        .O(axi_data_i_IBUF[5]));
  (* DONT_TOUCH *) 
  IBUF \axi_data_i_IBUF[6]_inst 
       (.I(axi_data_i[6]),
        .O(axi_data_i_IBUF[6]));
  (* DONT_TOUCH *) 
  IBUF \axi_data_i_IBUF[7]_inst 
       (.I(axi_data_i[7]),
        .O(axi_data_i_IBUF[7]));
  (* DONT_TOUCH *) 
  IBUF \axi_data_i_IBUF[8]_inst 
       (.I(axi_data_i[8]),
        .O(axi_data_i_IBUF[8]));
  (* DONT_TOUCH *) 
  IBUF \axi_data_i_IBUF[9]_inst 
       (.I(axi_data_i[9]),
        .O(axi_data_i_IBUF[9]));
  (* DONT_TOUCH *) 
  OBUF \axi_data_o_OBUF[0]_inst 
       (.I(axi_data_o_OBUF[0]),
        .O(axi_data_o[0]));
  (* DONT_TOUCH *) 
  OBUF \axi_data_o_OBUF[10]_inst 
       (.I(axi_data_o_OBUF[10]),
        .O(axi_data_o[10]));
  (* DONT_TOUCH *) 
  OBUF \axi_data_o_OBUF[11]_inst 
       (.I(axi_data_o_OBUF[11]),
        .O(axi_data_o[11]));
  (* DONT_TOUCH *) 
  OBUF \axi_data_o_OBUF[12]_inst 
       (.I(axi_data_o_OBUF[12]),
        .O(axi_data_o[12]));
  (* DONT_TOUCH *) 
  OBUF \axi_data_o_OBUF[13]_inst 
       (.I(axi_data_o_OBUF[13]),
        .O(axi_data_o[13]));
  (* DONT_TOUCH *) 
  OBUF \axi_data_o_OBUF[14]_inst 
       (.I(axi_data_o_OBUF[14]),
        .O(axi_data_o[14]));
  (* DONT_TOUCH *) 
  OBUF \axi_data_o_OBUF[15]_inst 
       (.I(axi_data_o_OBUF[15]),
        .O(axi_data_o[15]));
  (* DONT_TOUCH *) 
  OBUF \axi_data_o_OBUF[16]_inst 
       (.I(axi_data_o_OBUF[16]),
        .O(axi_data_o[16]));
  (* DONT_TOUCH *) 
  OBUF \axi_data_o_OBUF[17]_inst 
       (.I(axi_data_o_OBUF[17]),
        .O(axi_data_o[17]));
  (* DONT_TOUCH *) 
  OBUF \axi_data_o_OBUF[18]_inst 
       (.I(axi_data_o_OBUF[18]),
        .O(axi_data_o[18]));
  (* DONT_TOUCH *) 
  OBUF \axi_data_o_OBUF[19]_inst 
       (.I(axi_data_o_OBUF[19]),
        .O(axi_data_o[19]));
  (* DONT_TOUCH *) 
  OBUF \axi_data_o_OBUF[1]_inst 
       (.I(axi_data_o_OBUF[1]),
        .O(axi_data_o[1]));
  (* DONT_TOUCH *) 
  OBUF \axi_data_o_OBUF[20]_inst 
       (.I(axi_data_o_OBUF[20]),
        .O(axi_data_o[20]));
  (* DONT_TOUCH *) 
  OBUF \axi_data_o_OBUF[21]_inst 
       (.I(axi_data_o_OBUF[21]),
        .O(axi_data_o[21]));
  (* DONT_TOUCH *) 
  OBUF \axi_data_o_OBUF[22]_inst 
       (.I(axi_data_o_OBUF[22]),
        .O(axi_data_o[22]));
  (* DONT_TOUCH *) 
  OBUF \axi_data_o_OBUF[23]_inst 
       (.I(axi_data_o_OBUF[23]),
        .O(axi_data_o[23]));
  (* DONT_TOUCH *) 
  OBUF \axi_data_o_OBUF[24]_inst 
       (.I(axi_data_o_OBUF[24]),
        .O(axi_data_o[24]));
  (* DONT_TOUCH *) 
  OBUF \axi_data_o_OBUF[25]_inst 
       (.I(axi_data_o_OBUF[25]),
        .O(axi_data_o[25]));
  (* DONT_TOUCH *) 
  OBUF \axi_data_o_OBUF[26]_inst 
       (.I(axi_data_o_OBUF[26]),
        .O(axi_data_o[26]));
  (* DONT_TOUCH *) 
  OBUF \axi_data_o_OBUF[27]_inst 
       (.I(axi_data_o_OBUF[27]),
        .O(axi_data_o[27]));
  (* DONT_TOUCH *) 
  OBUF \axi_data_o_OBUF[28]_inst 
       (.I(axi_data_o_OBUF[28]),
        .O(axi_data_o[28]));
  (* DONT_TOUCH *) 
  OBUF \axi_data_o_OBUF[29]_inst 
       (.I(axi_data_o_OBUF[29]),
        .O(axi_data_o[29]));
  (* DONT_TOUCH *) 
  OBUF \axi_data_o_OBUF[2]_inst 
       (.I(axi_data_o_OBUF[2]),
        .O(axi_data_o[2]));
  (* DONT_TOUCH *) 
  OBUF \axi_data_o_OBUF[30]_inst 
       (.I(axi_data_o_OBUF[30]),
        .O(axi_data_o[30]));
  (* DONT_TOUCH *) 
  OBUF \axi_data_o_OBUF[31]_inst 
       (.I(axi_data_o_OBUF[31]),
        .O(axi_data_o[31]));
  (* DONT_TOUCH *) 
  OBUF \axi_data_o_OBUF[3]_inst 
       (.I(axi_data_o_OBUF[3]),
        .O(axi_data_o[3]));
  (* DONT_TOUCH *) 
  OBUF \axi_data_o_OBUF[4]_inst 
       (.I(axi_data_o_OBUF[4]),
        .O(axi_data_o[4]));
  (* DONT_TOUCH *) 
  OBUF \axi_data_o_OBUF[5]_inst 
       (.I(axi_data_o_OBUF[5]),
        .O(axi_data_o[5]));
  (* DONT_TOUCH *) 
  OBUF \axi_data_o_OBUF[6]_inst 
       (.I(axi_data_o_OBUF[6]),
        .O(axi_data_o[6]));
  (* DONT_TOUCH *) 
  OBUF \axi_data_o_OBUF[7]_inst 
       (.I(axi_data_o_OBUF[7]),
        .O(axi_data_o[7]));
  (* DONT_TOUCH *) 
  OBUF \axi_data_o_OBUF[8]_inst 
       (.I(axi_data_o_OBUF[8]),
        .O(axi_data_o[8]));
  (* DONT_TOUCH *) 
  OBUF \axi_data_o_OBUF[9]_inst 
       (.I(axi_data_o_OBUF[9]),
        .O(axi_data_o[9]));
  (* DONT_TOUCH *) 
  IBUF axi_en_i_IBUF_inst
       (.I(axi_en_i),
        .O(axi_en_i_IBUF));
  (* DONT_TOUCH *) 
  OBUF axi_vd_o_OBUF_inst
       (.I(axi_vd_o_OBUF),
        .O(axi_vd_o));
  (* DONT_TOUCH *) 
  IBUF \axi_we_i_IBUF[0]_inst 
       (.I(axi_we_i[0]),
        .O(axi_we_i_IBUF[0]));
  (* DONT_TOUCH *) 
  IBUF \axi_we_i_IBUF[1]_inst 
       (.I(axi_we_i[1]),
        .O(axi_we_i_IBUF[1]));
  (* DONT_TOUCH *) 
  IBUF \axi_we_i_IBUF[2]_inst 
       (.I(axi_we_i[2]),
        .O(axi_we_i_IBUF[2]));
  (* DONT_TOUCH *) 
  IBUF \axi_we_i_IBUF[3]_inst 
       (.I(axi_we_i[3]),
        .O(axi_we_i_IBUF[3]));
  bram_interface_urr bram
       (.axi_addr_i({axi_addr_i[31:8],axi_addr_i_IBUF}),
        .axi_data_i(axi_data_i_IBUF),
        .axi_data_o(axi_data_o_OBUF),
        .axi_en_i(axi_en_i_IBUF),
        .axi_vd_o(axi_vd_o_OBUF),
        .axi_we_i(axi_we_i_IBUF),
        .crc_done_i(crc_done),
        .crc_match(crc_match),
        .crc_result_i(crc_result),
        .module_enable(module_enable),
        .rst_n_IBUF(rst_n_IBUF),
        .start_crc(start_crc_impulse),
        .sys_clk_IBUF_BUFG(sys_clk_IBUF_BUFG),
        .uart_cmd(cmd_bram),
        .uart_done(done),
        .uart_freq(freq),
        .uart_start(start_bram),
        .urr_error(error));
  LUT3 #(
    .INIT(8'hAC)) 
    cmd_inferred_i_1
       (.I0(cmd_urr[7]),
        .I1(cmd_bram[7]),
        .I2(crc_running),
        .O(cmd[7]));
  LUT3 #(
    .INIT(8'hAC)) 
    cmd_inferred_i_2
       (.I0(cmd_urr[6]),
        .I1(cmd_bram[6]),
        .I2(crc_running),
        .O(cmd[6]));
  LUT3 #(
    .INIT(8'hAC)) 
    cmd_inferred_i_3
       (.I0(cmd_urr[5]),
        .I1(cmd_bram[5]),
        .I2(crc_running),
        .O(cmd[5]));
  LUT3 #(
    .INIT(8'hAC)) 
    cmd_inferred_i_4
       (.I0(cmd_urr[4]),
        .I1(cmd_bram[4]),
        .I2(crc_running),
        .O(cmd[4]));
  LUT3 #(
    .INIT(8'hAC)) 
    cmd_inferred_i_5
       (.I0(cmd_urr[3]),
        .I1(cmd_bram[3]),
        .I2(crc_running),
        .O(cmd[3]));
  LUT3 #(
    .INIT(8'hAC)) 
    cmd_inferred_i_6
       (.I0(cmd_urr[2]),
        .I1(cmd_bram[2]),
        .I2(crc_running),
        .O(cmd[2]));
  LUT3 #(
    .INIT(8'hAC)) 
    cmd_inferred_i_7
       (.I0(cmd_urr[1]),
        .I1(cmd_bram[1]),
        .I2(crc_running),
        .O(cmd[1]));
  LUT3 #(
    .INIT(8'hAC)) 
    cmd_inferred_i_8
       (.I0(cmd_urr[0]),
        .I1(cmd_bram[0]),
        .I2(crc_running),
        .O(cmd[0]));
  LUT1 #(
    .INIT(2'h2)) 
    i_0
       (.I0(1'b0),
        .O(rx_error_to_urr));
  LUT1 #(
    .INIT(2'h2)) 
    i_1
       (.I0(1'b0),
        .O(rx_valid_delayed));
  LUT1 #(
    .INIT(2'h2)) 
    i_10
       (.I0(1'b0),
        .O(rx_valid_to_urr));
  LUT1 #(
    .INIT(2'h2)) 
    i_11
       (.I0(1'b0),
        .O(rx_data_to_urr[7]));
  LUT1 #(
    .INIT(2'h2)) 
    i_12
       (.I0(1'b0),
        .O(rx_data_to_urr[6]));
  LUT1 #(
    .INIT(2'h2)) 
    i_13
       (.I0(1'b0),
        .O(rx_data_to_urr[5]));
  LUT1 #(
    .INIT(2'h2)) 
    i_14
       (.I0(1'b0),
        .O(rx_data_to_urr[4]));
  LUT1 #(
    .INIT(2'h2)) 
    i_15
       (.I0(1'b0),
        .O(rx_data_to_urr[3]));
  LUT1 #(
    .INIT(2'h2)) 
    i_16
       (.I0(1'b0),
        .O(rx_data_to_urr[2]));
  LUT1 #(
    .INIT(2'h2)) 
    i_17
       (.I0(1'b0),
        .O(rx_data_to_urr[1]));
  LUT1 #(
    .INIT(2'h2)) 
    i_18
       (.I0(1'b0),
        .O(rx_data_to_urr[0]));
  LUT1 #(
    .INIT(2'h2)) 
    i_19
       (.I0(1'b0),
        .O(rx_valid_to_urr_crc));
  LUT1 #(
    .INIT(2'h2)) 
    i_2
       (.I0(1'b0),
        .O(rx_data_delayed[7]));
  LUT1 #(
    .INIT(2'h2)) 
    i_20
       (.I0(1'b0),
        .O(rx_data_to_urr_crc[7]));
  LUT1 #(
    .INIT(2'h2)) 
    i_21
       (.I0(1'b0),
        .O(rx_data_to_urr_crc[6]));
  LUT1 #(
    .INIT(2'h2)) 
    i_22
       (.I0(1'b0),
        .O(rx_data_to_urr_crc[5]));
  LUT1 #(
    .INIT(2'h2)) 
    i_23
       (.I0(1'b0),
        .O(rx_data_to_urr_crc[4]));
  LUT1 #(
    .INIT(2'h2)) 
    i_24
       (.I0(1'b0),
        .O(rx_data_to_urr_crc[3]));
  LUT1 #(
    .INIT(2'h2)) 
    i_25
       (.I0(1'b0),
        .O(rx_data_to_urr_crc[2]));
  LUT1 #(
    .INIT(2'h2)) 
    i_26
       (.I0(1'b0),
        .O(rx_data_to_urr_crc[1]));
  LUT1 #(
    .INIT(2'h2)) 
    i_27
       (.I0(1'b0),
        .O(rx_data_to_urr_crc[0]));
  LUT1 #(
    .INIT(2'h2)) 
    i_3
       (.I0(1'b0),
        .O(rx_data_delayed[6]));
  LUT1 #(
    .INIT(2'h2)) 
    i_4
       (.I0(1'b0),
        .O(rx_data_delayed[5]));
  LUT1 #(
    .INIT(2'h2)) 
    i_5
       (.I0(1'b0),
        .O(rx_data_delayed[4]));
  LUT1 #(
    .INIT(2'h2)) 
    i_6
       (.I0(1'b0),
        .O(rx_data_delayed[3]));
  LUT1 #(
    .INIT(2'h2)) 
    i_7
       (.I0(1'b0),
        .O(rx_data_delayed[2]));
  LUT1 #(
    .INIT(2'h2)) 
    i_8
       (.I0(1'b0),
        .O(rx_data_delayed[1]));
  LUT1 #(
    .INIT(2'h2)) 
    i_9
       (.I0(1'b0),
        .O(rx_data_delayed[0]));
  (* DONT_TOUCH *) 
  OBUF irq_con_o_OBUF_inst
       (.I(irq_con_o_OBUF),
        .O(irq_con_o));
  (* DONT_TOUCH *) 
  OBUF irq_o_OBUF_inst
       (.I(irq_o_OBUF),
        .O(irq_o));
  (* DONT_TOUCH *) 
  OBUF led_OBUF_inst
       (.I(led_OBUF),
        .O(led));
  LUT6 #(
    .INIT(64'h00000000EEEEEEEA)) 
    \led_cnt[0]_i_1 
       (.I0(\led_cnt[25]_i_2_n_0 ),
        .I1(\led_cnt[25]_i_3_n_0 ),
        .I2(\led_cnt[25]_i_4_n_0 ),
        .I3(\led_cnt[25]_i_5_n_0 ),
        .I4(\led_cnt[25]_i_6_n_0 ),
        .I5(led_cnt[0]),
        .O(p_0_in__0[0]));
  LUT6 #(
    .INIT(64'hEEEEEEEA00000000)) 
    \led_cnt[10]_i_1 
       (.I0(\led_cnt[25]_i_2_n_0 ),
        .I1(\led_cnt[25]_i_3_n_0 ),
        .I2(\led_cnt[25]_i_4_n_0 ),
        .I3(\led_cnt[25]_i_5_n_0 ),
        .I4(\led_cnt[25]_i_6_n_0 ),
        .I5(led_cnt0[10]),
        .O(p_0_in__0[10]));
  LUT6 #(
    .INIT(64'hEEEEEEEA00000000)) 
    \led_cnt[11]_i_1 
       (.I0(\led_cnt[25]_i_2_n_0 ),
        .I1(\led_cnt[25]_i_3_n_0 ),
        .I2(\led_cnt[25]_i_4_n_0 ),
        .I3(\led_cnt[25]_i_5_n_0 ),
        .I4(\led_cnt[25]_i_6_n_0 ),
        .I5(led_cnt0[11]),
        .O(p_0_in__0[11]));
  LUT6 #(
    .INIT(64'hEEEEEEEA00000000)) 
    \led_cnt[12]_i_1 
       (.I0(\led_cnt[25]_i_2_n_0 ),
        .I1(\led_cnt[25]_i_3_n_0 ),
        .I2(\led_cnt[25]_i_4_n_0 ),
        .I3(\led_cnt[25]_i_5_n_0 ),
        .I4(\led_cnt[25]_i_6_n_0 ),
        .I5(led_cnt0[12]),
        .O(p_0_in__0[12]));
  LUT6 #(
    .INIT(64'hEEEEEEEA00000000)) 
    \led_cnt[13]_i_1 
       (.I0(\led_cnt[25]_i_2_n_0 ),
        .I1(\led_cnt[25]_i_3_n_0 ),
        .I2(\led_cnt[25]_i_4_n_0 ),
        .I3(\led_cnt[25]_i_5_n_0 ),
        .I4(\led_cnt[25]_i_6_n_0 ),
        .I5(led_cnt0[13]),
        .O(p_0_in__0[13]));
  LUT6 #(
    .INIT(64'hEEEEEEEA00000000)) 
    \led_cnt[14]_i_1 
       (.I0(\led_cnt[25]_i_2_n_0 ),
        .I1(\led_cnt[25]_i_3_n_0 ),
        .I2(\led_cnt[25]_i_4_n_0 ),
        .I3(\led_cnt[25]_i_5_n_0 ),
        .I4(\led_cnt[25]_i_6_n_0 ),
        .I5(led_cnt0[14]),
        .O(p_0_in__0[14]));
  LUT6 #(
    .INIT(64'hEEEEEEEA00000000)) 
    \led_cnt[15]_i_1 
       (.I0(\led_cnt[25]_i_2_n_0 ),
        .I1(\led_cnt[25]_i_3_n_0 ),
        .I2(\led_cnt[25]_i_4_n_0 ),
        .I3(\led_cnt[25]_i_5_n_0 ),
        .I4(\led_cnt[25]_i_6_n_0 ),
        .I5(led_cnt0[15]),
        .O(p_0_in__0[15]));
  LUT6 #(
    .INIT(64'hEEEEEEEA00000000)) 
    \led_cnt[16]_i_1 
       (.I0(\led_cnt[25]_i_2_n_0 ),
        .I1(\led_cnt[25]_i_3_n_0 ),
        .I2(\led_cnt[25]_i_4_n_0 ),
        .I3(\led_cnt[25]_i_5_n_0 ),
        .I4(\led_cnt[25]_i_6_n_0 ),
        .I5(led_cnt0[16]),
        .O(p_0_in__0[16]));
  LUT6 #(
    .INIT(64'hEEEEEEEA00000000)) 
    \led_cnt[17]_i_1 
       (.I0(\led_cnt[25]_i_2_n_0 ),
        .I1(\led_cnt[25]_i_3_n_0 ),
        .I2(\led_cnt[25]_i_4_n_0 ),
        .I3(\led_cnt[25]_i_5_n_0 ),
        .I4(\led_cnt[25]_i_6_n_0 ),
        .I5(led_cnt0[17]),
        .O(p_0_in__0[17]));
  LUT6 #(
    .INIT(64'hEEEEEEEA00000000)) 
    \led_cnt[18]_i_1 
       (.I0(\led_cnt[25]_i_2_n_0 ),
        .I1(\led_cnt[25]_i_3_n_0 ),
        .I2(\led_cnt[25]_i_4_n_0 ),
        .I3(\led_cnt[25]_i_5_n_0 ),
        .I4(\led_cnt[25]_i_6_n_0 ),
        .I5(led_cnt0[18]),
        .O(p_0_in__0[18]));
  LUT6 #(
    .INIT(64'hEEEEEEEA00000000)) 
    \led_cnt[19]_i_1 
       (.I0(\led_cnt[25]_i_2_n_0 ),
        .I1(\led_cnt[25]_i_3_n_0 ),
        .I2(\led_cnt[25]_i_4_n_0 ),
        .I3(\led_cnt[25]_i_5_n_0 ),
        .I4(\led_cnt[25]_i_6_n_0 ),
        .I5(led_cnt0[19]),
        .O(p_0_in__0[19]));
  LUT6 #(
    .INIT(64'hEEEEEEEA00000000)) 
    \led_cnt[1]_i_1 
       (.I0(\led_cnt[25]_i_2_n_0 ),
        .I1(\led_cnt[25]_i_3_n_0 ),
        .I2(\led_cnt[25]_i_4_n_0 ),
        .I3(\led_cnt[25]_i_5_n_0 ),
        .I4(\led_cnt[25]_i_6_n_0 ),
        .I5(led_cnt0[1]),
        .O(p_0_in__0[1]));
  LUT6 #(
    .INIT(64'hEEEEEEEA00000000)) 
    \led_cnt[20]_i_1 
       (.I0(\led_cnt[25]_i_2_n_0 ),
        .I1(\led_cnt[25]_i_3_n_0 ),
        .I2(\led_cnt[25]_i_4_n_0 ),
        .I3(\led_cnt[25]_i_5_n_0 ),
        .I4(\led_cnt[25]_i_6_n_0 ),
        .I5(led_cnt0[20]),
        .O(p_0_in__0[20]));
  LUT6 #(
    .INIT(64'hEEEEEEEA00000000)) 
    \led_cnt[21]_i_1 
       (.I0(\led_cnt[25]_i_2_n_0 ),
        .I1(\led_cnt[25]_i_3_n_0 ),
        .I2(\led_cnt[25]_i_4_n_0 ),
        .I3(\led_cnt[25]_i_5_n_0 ),
        .I4(\led_cnt[25]_i_6_n_0 ),
        .I5(led_cnt0[21]),
        .O(p_0_in__0[21]));
  LUT6 #(
    .INIT(64'hEEEEEEEA00000000)) 
    \led_cnt[22]_i_1 
       (.I0(\led_cnt[25]_i_2_n_0 ),
        .I1(\led_cnt[25]_i_3_n_0 ),
        .I2(\led_cnt[25]_i_4_n_0 ),
        .I3(\led_cnt[25]_i_5_n_0 ),
        .I4(\led_cnt[25]_i_6_n_0 ),
        .I5(led_cnt0[22]),
        .O(p_0_in__0[22]));
  LUT6 #(
    .INIT(64'hEEEEEEEA00000000)) 
    \led_cnt[23]_i_1 
       (.I0(\led_cnt[25]_i_2_n_0 ),
        .I1(\led_cnt[25]_i_3_n_0 ),
        .I2(\led_cnt[25]_i_4_n_0 ),
        .I3(\led_cnt[25]_i_5_n_0 ),
        .I4(\led_cnt[25]_i_6_n_0 ),
        .I5(led_cnt0[23]),
        .O(p_0_in__0[23]));
  LUT6 #(
    .INIT(64'hEEEEEEEA00000000)) 
    \led_cnt[24]_i_1 
       (.I0(\led_cnt[25]_i_2_n_0 ),
        .I1(\led_cnt[25]_i_3_n_0 ),
        .I2(\led_cnt[25]_i_4_n_0 ),
        .I3(\led_cnt[25]_i_5_n_0 ),
        .I4(\led_cnt[25]_i_6_n_0 ),
        .I5(led_cnt0[24]),
        .O(p_0_in__0[24]));
  LUT6 #(
    .INIT(64'hEEEEEEEA00000000)) 
    \led_cnt[25]_i_1 
       (.I0(\led_cnt[25]_i_2_n_0 ),
        .I1(\led_cnt[25]_i_3_n_0 ),
        .I2(\led_cnt[25]_i_4_n_0 ),
        .I3(\led_cnt[25]_i_5_n_0 ),
        .I4(\led_cnt[25]_i_6_n_0 ),
        .I5(led_cnt0[25]),
        .O(p_0_in__0[25]));
  LUT2 #(
    .INIT(4'h7)) 
    \led_cnt[25]_i_10 
       (.I0(led_cnt[14]),
        .I1(led_cnt[15]),
        .O(\led_cnt[25]_i_10_n_0 ));
  LUT2 #(
    .INIT(4'h7)) 
    \led_cnt[25]_i_11 
       (.I0(led_cnt[12]),
        .I1(led_cnt[13]),
        .O(\led_cnt[25]_i_11_n_0 ));
  LUT4 #(
    .INIT(16'h7FFF)) 
    \led_cnt[25]_i_12 
       (.I0(led_cnt[6]),
        .I1(led_cnt[5]),
        .I2(led_cnt[4]),
        .I3(led_cnt[3]),
        .O(\led_cnt[25]_i_12_n_0 ));
  LUT3 #(
    .INIT(8'h7F)) 
    \led_cnt[25]_i_13 
       (.I0(led_cnt[2]),
        .I1(led_cnt[1]),
        .I2(led_cnt[0]),
        .O(\led_cnt[25]_i_13_n_0 ));
  LUT5 #(
    .INIT(32'h00000001)) 
    \led_cnt[25]_i_14 
       (.I0(led_cnt[7]),
        .I1(led_cnt[8]),
        .I2(led_cnt[9]),
        .I3(led_cnt[11]),
        .I4(led_cnt[10]),
        .O(\led_cnt[25]_i_14_n_0 ));
  LUT2 #(
    .INIT(4'h1)) 
    \led_cnt[25]_i_2 
       (.I0(\led_cnt[25]_i_8_n_0 ),
        .I1(led_cnt[25]),
        .O(\led_cnt[25]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h1)) 
    \led_cnt[25]_i_3 
       (.I0(\led_cnt[25]_i_8_n_0 ),
        .I1(led_cnt[24]),
        .O(\led_cnt[25]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h7)) 
    \led_cnt[25]_i_4 
       (.I0(led_cnt[20]),
        .I1(led_cnt[21]),
        .O(\led_cnt[25]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hAAAAAAA8A8A8A8A8)) 
    \led_cnt[25]_i_5 
       (.I0(\led_cnt[25]_i_9_n_0 ),
        .I1(\led_cnt[25]_i_10_n_0 ),
        .I2(\led_cnt[25]_i_11_n_0 ),
        .I3(\led_cnt[25]_i_12_n_0 ),
        .I4(\led_cnt[25]_i_13_n_0 ),
        .I5(\led_cnt[25]_i_14_n_0 ),
        .O(\led_cnt[25]_i_5_n_0 ));
  LUT5 #(
    .INIT(32'h57FFFFFF)) 
    \led_cnt[25]_i_6 
       (.I0(led_cnt[19]),
        .I1(led_cnt[18]),
        .I2(led_cnt[17]),
        .I3(led_cnt[23]),
        .I4(led_cnt[22]),
        .O(\led_cnt[25]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
    \led_cnt[25]_i_8 
       (.I0(led_cnt[26]),
        .I1(led_cnt[27]),
        .I2(led_cnt[28]),
        .I3(led_cnt[29]),
        .I4(led_cnt[31]),
        .I5(led_cnt[30]),
        .O(\led_cnt[25]_i_8_n_0 ));
  LUT2 #(
    .INIT(4'h1)) 
    \led_cnt[25]_i_9 
       (.I0(led_cnt[18]),
        .I1(led_cnt[16]),
        .O(\led_cnt[25]_i_9_n_0 ));
  LUT6 #(
    .INIT(64'hEEEEEEEA00000000)) 
    \led_cnt[2]_i_1 
       (.I0(\led_cnt[25]_i_2_n_0 ),
        .I1(\led_cnt[25]_i_3_n_0 ),
        .I2(\led_cnt[25]_i_4_n_0 ),
        .I3(\led_cnt[25]_i_5_n_0 ),
        .I4(\led_cnt[25]_i_6_n_0 ),
        .I5(led_cnt0[2]),
        .O(p_0_in__0[2]));
  LUT1 #(
    .INIT(2'h1)) 
    \led_cnt[31]_i_1 
       (.I0(rst_n_IBUF),
        .O(\led_cnt[31]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hEEEEEEEA00000000)) 
    \led_cnt[3]_i_1 
       (.I0(\led_cnt[25]_i_2_n_0 ),
        .I1(\led_cnt[25]_i_3_n_0 ),
        .I2(\led_cnt[25]_i_4_n_0 ),
        .I3(\led_cnt[25]_i_5_n_0 ),
        .I4(\led_cnt[25]_i_6_n_0 ),
        .I5(led_cnt0[3]),
        .O(p_0_in__0[3]));
  LUT6 #(
    .INIT(64'hEEEEEEEA00000000)) 
    \led_cnt[4]_i_1 
       (.I0(\led_cnt[25]_i_2_n_0 ),
        .I1(\led_cnt[25]_i_3_n_0 ),
        .I2(\led_cnt[25]_i_4_n_0 ),
        .I3(\led_cnt[25]_i_5_n_0 ),
        .I4(\led_cnt[25]_i_6_n_0 ),
        .I5(led_cnt0[4]),
        .O(p_0_in__0[4]));
  LUT6 #(
    .INIT(64'hEEEEEEEA00000000)) 
    \led_cnt[5]_i_1 
       (.I0(\led_cnt[25]_i_2_n_0 ),
        .I1(\led_cnt[25]_i_3_n_0 ),
        .I2(\led_cnt[25]_i_4_n_0 ),
        .I3(\led_cnt[25]_i_5_n_0 ),
        .I4(\led_cnt[25]_i_6_n_0 ),
        .I5(led_cnt0[5]),
        .O(p_0_in__0[5]));
  LUT6 #(
    .INIT(64'hEEEEEEEA00000000)) 
    \led_cnt[6]_i_1 
       (.I0(\led_cnt[25]_i_2_n_0 ),
        .I1(\led_cnt[25]_i_3_n_0 ),
        .I2(\led_cnt[25]_i_4_n_0 ),
        .I3(\led_cnt[25]_i_5_n_0 ),
        .I4(\led_cnt[25]_i_6_n_0 ),
        .I5(led_cnt0[6]),
        .O(p_0_in__0[6]));
  LUT6 #(
    .INIT(64'hEEEEEEEA00000000)) 
    \led_cnt[7]_i_1 
       (.I0(\led_cnt[25]_i_2_n_0 ),
        .I1(\led_cnt[25]_i_3_n_0 ),
        .I2(\led_cnt[25]_i_4_n_0 ),
        .I3(\led_cnt[25]_i_5_n_0 ),
        .I4(\led_cnt[25]_i_6_n_0 ),
        .I5(led_cnt0[7]),
        .O(p_0_in__0[7]));
  LUT6 #(
    .INIT(64'hEEEEEEEA00000000)) 
    \led_cnt[8]_i_1 
       (.I0(\led_cnt[25]_i_2_n_0 ),
        .I1(\led_cnt[25]_i_3_n_0 ),
        .I2(\led_cnt[25]_i_4_n_0 ),
        .I3(\led_cnt[25]_i_5_n_0 ),
        .I4(\led_cnt[25]_i_6_n_0 ),
        .I5(led_cnt0[8]),
        .O(p_0_in__0[8]));
  LUT6 #(
    .INIT(64'hEEEEEEEA00000000)) 
    \led_cnt[9]_i_1 
       (.I0(\led_cnt[25]_i_2_n_0 ),
        .I1(\led_cnt[25]_i_3_n_0 ),
        .I2(\led_cnt[25]_i_4_n_0 ),
        .I3(\led_cnt[25]_i_5_n_0 ),
        .I4(\led_cnt[25]_i_6_n_0 ),
        .I5(led_cnt0[9]),
        .O(p_0_in__0[9]));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  FDCE \led_cnt_reg[0] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(\led_cnt[31]_i_1_n_0 ),
        .D(p_0_in__0[0]),
        .Q(led_cnt[0]));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  FDCE \led_cnt_reg[10] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(\led_cnt[31]_i_1_n_0 ),
        .D(p_0_in__0[10]),
        .Q(led_cnt[10]));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  FDCE \led_cnt_reg[11] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(\led_cnt[31]_i_1_n_0 ),
        .D(p_0_in__0[11]),
        .Q(led_cnt[11]));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  FDCE \led_cnt_reg[12] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(\led_cnt[31]_i_1_n_0 ),
        .D(p_0_in__0[12]),
        .Q(led_cnt[12]));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \led_cnt_reg[12]_i_2 
       (.CI(\led_cnt_reg[8]_i_2_n_0 ),
        .CO({\led_cnt_reg[12]_i_2_n_0 ,\NLW_led_cnt_reg[12]_i_2_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(led_cnt0[12:9]),
        .S(led_cnt[12:9]));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  FDCE \led_cnt_reg[13] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(\led_cnt[31]_i_1_n_0 ),
        .D(p_0_in__0[13]),
        .Q(led_cnt[13]));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  FDCE \led_cnt_reg[14] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(\led_cnt[31]_i_1_n_0 ),
        .D(p_0_in__0[14]),
        .Q(led_cnt[14]));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  FDCE \led_cnt_reg[15] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(\led_cnt[31]_i_1_n_0 ),
        .D(p_0_in__0[15]),
        .Q(led_cnt[15]));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  FDCE \led_cnt_reg[16] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(\led_cnt[31]_i_1_n_0 ),
        .D(p_0_in__0[16]),
        .Q(led_cnt[16]));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \led_cnt_reg[16]_i_2 
       (.CI(\led_cnt_reg[12]_i_2_n_0 ),
        .CO({\led_cnt_reg[16]_i_2_n_0 ,\NLW_led_cnt_reg[16]_i_2_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(led_cnt0[16:13]),
        .S(led_cnt[16:13]));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  FDCE \led_cnt_reg[17] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(\led_cnt[31]_i_1_n_0 ),
        .D(p_0_in__0[17]),
        .Q(led_cnt[17]));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  FDCE \led_cnt_reg[18] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(\led_cnt[31]_i_1_n_0 ),
        .D(p_0_in__0[18]),
        .Q(led_cnt[18]));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  FDCE \led_cnt_reg[19] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(\led_cnt[31]_i_1_n_0 ),
        .D(p_0_in__0[19]),
        .Q(led_cnt[19]));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  FDCE \led_cnt_reg[1] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(\led_cnt[31]_i_1_n_0 ),
        .D(p_0_in__0[1]),
        .Q(led_cnt[1]));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  FDCE \led_cnt_reg[20] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(\led_cnt[31]_i_1_n_0 ),
        .D(p_0_in__0[20]),
        .Q(led_cnt[20]));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \led_cnt_reg[20]_i_2 
       (.CI(\led_cnt_reg[16]_i_2_n_0 ),
        .CO({\led_cnt_reg[20]_i_2_n_0 ,\NLW_led_cnt_reg[20]_i_2_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(led_cnt0[20:17]),
        .S(led_cnt[20:17]));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  FDCE \led_cnt_reg[21] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(\led_cnt[31]_i_1_n_0 ),
        .D(p_0_in__0[21]),
        .Q(led_cnt[21]));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  FDCE \led_cnt_reg[22] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(\led_cnt[31]_i_1_n_0 ),
        .D(p_0_in__0[22]),
        .Q(led_cnt[22]));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  FDCE \led_cnt_reg[23] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(\led_cnt[31]_i_1_n_0 ),
        .D(p_0_in__0[23]),
        .Q(led_cnt[23]));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  FDCE \led_cnt_reg[24] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(\led_cnt[31]_i_1_n_0 ),
        .D(p_0_in__0[24]),
        .Q(led_cnt[24]));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \led_cnt_reg[24]_i_2 
       (.CI(\led_cnt_reg[20]_i_2_n_0 ),
        .CO({\led_cnt_reg[24]_i_2_n_0 ,\NLW_led_cnt_reg[24]_i_2_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(led_cnt0[24:21]),
        .S(led_cnt[24:21]));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  FDCE \led_cnt_reg[25] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(\led_cnt[31]_i_1_n_0 ),
        .D(p_0_in__0[25]),
        .Q(led_cnt[25]));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \led_cnt_reg[25]_i_7 
       (.CI(\led_cnt_reg[24]_i_2_n_0 ),
        .CO(\NLW_led_cnt_reg[25]_i_7_CO_UNCONNECTED [3:0]),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\NLW_led_cnt_reg[25]_i_7_O_UNCONNECTED [3:1],led_cnt0[25]}),
        .S({1'b0,1'b0,1'b0,led_cnt[25]}));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  FDCE \led_cnt_reg[26] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(\led_cnt[31]_i_1_n_0 ),
        .D(1'b0),
        .Q(led_cnt[26]));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  FDCE \led_cnt_reg[27] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(\led_cnt[31]_i_1_n_0 ),
        .D(1'b0),
        .Q(led_cnt[27]));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  FDCE \led_cnt_reg[28] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(\led_cnt[31]_i_1_n_0 ),
        .D(1'b0),
        .Q(led_cnt[28]));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  FDCE \led_cnt_reg[29] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(\led_cnt[31]_i_1_n_0 ),
        .D(1'b0),
        .Q(led_cnt[29]));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  FDCE \led_cnt_reg[2] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(\led_cnt[31]_i_1_n_0 ),
        .D(p_0_in__0[2]),
        .Q(led_cnt[2]));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  FDCE \led_cnt_reg[30] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(\led_cnt[31]_i_1_n_0 ),
        .D(1'b0),
        .Q(led_cnt[30]));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  FDCE \led_cnt_reg[31] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(\led_cnt[31]_i_1_n_0 ),
        .D(1'b0),
        .Q(led_cnt[31]));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  FDCE \led_cnt_reg[3] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(\led_cnt[31]_i_1_n_0 ),
        .D(p_0_in__0[3]),
        .Q(led_cnt[3]));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  FDCE \led_cnt_reg[4] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(\led_cnt[31]_i_1_n_0 ),
        .D(p_0_in__0[4]),
        .Q(led_cnt[4]));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \led_cnt_reg[4]_i_2 
       (.CI(1'b0),
        .CO({\led_cnt_reg[4]_i_2_n_0 ,\NLW_led_cnt_reg[4]_i_2_CO_UNCONNECTED [2:0]}),
        .CYINIT(led_cnt[0]),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(led_cnt0[4:1]),
        .S(led_cnt[4:1]));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  FDCE \led_cnt_reg[5] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(\led_cnt[31]_i_1_n_0 ),
        .D(p_0_in__0[5]),
        .Q(led_cnt[5]));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  FDCE \led_cnt_reg[6] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(\led_cnt[31]_i_1_n_0 ),
        .D(p_0_in__0[6]),
        .Q(led_cnt[6]));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  FDCE \led_cnt_reg[7] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(\led_cnt[31]_i_1_n_0 ),
        .D(p_0_in__0[7]),
        .Q(led_cnt[7]));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  FDCE \led_cnt_reg[8] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(\led_cnt[31]_i_1_n_0 ),
        .D(p_0_in__0[8]),
        .Q(led_cnt[8]));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \led_cnt_reg[8]_i_2 
       (.CI(\led_cnt_reg[4]_i_2_n_0 ),
        .CO({\led_cnt_reg[8]_i_2_n_0 ,\NLW_led_cnt_reg[8]_i_2_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(led_cnt0[8:5]),
        .S(led_cnt[8:5]));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  FDCE \led_cnt_reg[9] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(\led_cnt[31]_i_1_n_0 ),
        .D(p_0_in__0[9]),
        .Q(led_cnt[9]));
  LUT6 #(
    .INIT(64'hEEEEEEEA11111115)) 
    led_reg_i_1
       (.I0(\led_cnt[25]_i_2_n_0 ),
        .I1(\led_cnt[25]_i_3_n_0 ),
        .I2(\led_cnt[25]_i_4_n_0 ),
        .I3(\led_cnt[25]_i_5_n_0 ),
        .I4(\led_cnt[25]_i_6_n_0 ),
        .I5(led_OBUF),
        .O(led_reg_i_1_n_0));
  LUT1 #(
    .INIT(2'h2)) 
    led_reg_inst
       (.I0(led_reg),
        .O(led_OBUF));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  FDCE led_reg_reg
       (.C(sys_clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(\led_cnt[31]_i_1_n_0 ),
        .D(led_reg_i_1_n_0),
        .Q(led_reg));
  pulse_stretcher pulse_irq_con_o
       (.irq_con_o(irq_con_o_OBUF),
        .out(p_0_in),
        .rst_n_IBUF(rst_n_IBUF),
        .sys_clk_IBUF_BUFG(sys_clk_IBUF_BUFG));
  pulse_stretcher_0 pulse_irq_o
       (.imp_i(done),
        .irq_o(irq_o_OBUF),
        .rst_n_IBUF(rst_n_IBUF),
        .sys_clk_IBUF_BUFG(sys_clk_IBUF_BUFG));
  (* DONT_TOUCH *) 
  OBUF rs_dir_o_OBUF_inst
       (.I(rs_dir_o_OBUF),
        .O(rs_dir_o));
  (* DONT_TOUCH *) 
  (* IOB = "TRUE" *) 
  IBUF rs_rx_i_IBUF_inst
       (.I(rs_rx_i),
        .O(rs_rx_i_IBUF));
  (* IOB = "TRUE" *) 
  OBUF rs_tx_o_OBUF_inst
       (.I(u_tx_n_1),
        .O(rs_tx_o));
  IBUF rst_n_IBUF_inst
       (.I(rst_n),
        .O(rst_n_IBUF));
  LUT3 #(
    .INIT(8'hAC)) 
    start_inferred_i_1
       (.I0(start_urr),
        .I1(start_bram),
        .I2(crc_running),
        .O(start));
  BUFG sys_clk_IBUF_BUFG_inst
       (.I(sys_clk_IBUF),
        .O(sys_clk_IBUF_BUFG));
  IBUF sys_clk_IBUF_inst
       (.I(sys_clk),
        .O(sys_clk_IBUF));
  uart_rx u_rx
       (.\baud_cnt_reg[1]_0 (p_0_in),
        .\baud_cnt_reg[1]_1 (module_enable),
        .in0(rs_rx_i_IBUF),
        .out(rx_data),
        .rst(rst),
        .rst_n(u_rx_n_10),
        .rst_n_IBUF(rst_n_IBUF),
        .rx_error(rx_error),
        .rx_valid(rx_valid),
        .sys_clk_IBUF_BUFG(sys_clk_IBUF_BUFG));
  uart_tx u_tx
       (.out(tx_start),
        .rst(rst),
        .rst_n_IBUF(rst_n_IBUF),
        .\shift_reg_reg[7]_C_0 (tx_data),
        .\shift_reg_reg[7]_P_0 (p_0_in),
        .\shift_reg_reg[7]_P_1 (module_enable),
        .sys_clk_IBUF_BUFG(sys_clk_IBUF_BUFG),
        .tx_busy(tx_busy),
        .tx_reg_reg_0(u_tx_n_1));
  urr u_urr
       (.D(cmd),
        .E(rx_valid),
        .Q(tx_data),
        .dir(rs_dir_o_OBUF),
        .done(done),
        .error(error),
        .freq(freq),
        .out(start),
        .rst(rst),
        .rx_data(rx_data),
        .sys_clk_IBUF_BUFG(sys_clk_IBUF_BUFG),
        .tx_busy(tx_busy),
        .tx_start(tx_start));
  urr_crc u_urr_crc
       (.cmd_urr(cmd_urr),
        .crc_done(crc_done),
        .crc_match(crc_match),
        .crc_result(crc_result),
        .crc_running(crc_running),
        .mem_reg(module_enable),
        .out(p_0_in),
        .rst(rst),
        .rst_n(u_rx_n_10),
        .rst_n_IBUF(rst_n_IBUF),
        .rx_data(rx_data),
        .rx_error(rx_error),
        .rx_valid(rx_valid),
        .start_crc(start_crc_impulse),
        .start_urr(start_urr),
        .sys_clk_IBUF_BUFG(sys_clk_IBUF_BUFG),
        .tx_busy(tx_busy),
        .urr_error(error));
  (* DONT_TOUCH *) 
  IBUF urr_connected_i_IBUF_inst
       (.I(urr_connected_i),
        .O(p_0_in));
endmodule

module uart_tx
   (tx_busy,
    tx_reg_reg_0,
    out,
    \shift_reg_reg[7]_C_0 ,
    sys_clk_IBUF_BUFG,
    rst,
    \shift_reg_reg[7]_P_0 ,
    \shift_reg_reg[7]_P_1 ,
    rst_n_IBUF);
  output tx_busy;
  output tx_reg_reg_0;
  input out;
  input [7:0]\shift_reg_reg[7]_C_0 ;
  input sys_clk_IBUF_BUFG;
  input rst;
  input \shift_reg_reg[7]_P_0 ;
  input \shift_reg_reg[7]_P_1 ;
  input rst_n_IBUF;

  (* DONT_TOUCH *) wire [15:0]baud_cnt;
  wire [15:1]baud_cnt0__28;
  wire baud_cnt0_carry__0_n_0;
  wire baud_cnt0_carry__1_n_0;
  wire baud_cnt0_carry_n_0;
  wire \baud_cnt[15]_i_3_n_0 ;
  wire \baud_cnt[15]_i_4_n_0 ;
  wire \baud_cnt[15]_i_5_n_0 ;
  wire \baud_cnt[15]_i_6_n_0 ;
  wire \baud_cnt[15]_i_7_n_0 ;
  (* DONT_TOUCH *) wire [3:0]bit_cnt;
  wire \bit_cnt[0]_i_1_n_0 ;
  wire \bit_cnt[1]_i_1__0_n_0 ;
  wire \bit_cnt[2]_i_1__0_n_0 ;
  wire \bit_cnt[3]_i_1_n_0 ;
  wire \bit_cnt[3]_i_2_n_0 ;
  (* DONT_TOUCH *) (* SRL_STYLE = "register" *) wire busy_reg;
  wire busy_reg_i_1_n_0;
  wire busy_reg_i_2_n_0;
  (* DONT_TOUCH *) wire out;
  wire [15:0]p_0_in__0;
  (* DONT_TOUCH *) wire parity;
  wire parity_C_i_1_n_0;
  wire parity_P_i_2_n_0;
  wire parity_P_i_3_n_0;
  wire parity_reg_C_n_0;
  wire parity_reg_LDC_i_1_n_0;
  wire parity_reg_LDC_i_2_n_0;
  wire parity_reg_LDC_n_0;
  wire parity_reg_P_n_0;
  wire rst;
  wire rst_n_IBUF;
  (* DONT_TOUCH *) wire [7:0]shift_reg;
  wire \shift_reg[0]_C_i_1_n_0 ;
  wire \shift_reg[1]_C_i_1_n_0 ;
  wire \shift_reg[2]_C_i_1_n_0 ;
  wire \shift_reg[3]_C_i_1_n_0 ;
  wire \shift_reg[4]_C_i_1_n_0 ;
  wire \shift_reg[5]_C_i_1_n_0 ;
  wire \shift_reg[6]_C_i_1_n_0 ;
  wire \shift_reg[6]_C_i_2_n_0 ;
  wire \shift_reg[6]_C_i_3_n_0 ;
  wire \shift_reg[7]_C_i_1_n_0 ;
  wire \shift_reg_reg[0]_C_n_0 ;
  wire \shift_reg_reg[0]_LDC_i_1_n_0 ;
  wire \shift_reg_reg[0]_LDC_i_2_n_0 ;
  wire \shift_reg_reg[0]_LDC_n_0 ;
  wire \shift_reg_reg[0]_P_n_0 ;
  wire \shift_reg_reg[1]_C_n_0 ;
  wire \shift_reg_reg[1]_LDC_i_1_n_0 ;
  wire \shift_reg_reg[1]_LDC_i_2_n_0 ;
  wire \shift_reg_reg[1]_LDC_n_0 ;
  wire \shift_reg_reg[1]_P_n_0 ;
  wire \shift_reg_reg[2]_C_n_0 ;
  wire \shift_reg_reg[2]_LDC_i_1_n_0 ;
  wire \shift_reg_reg[2]_LDC_i_2_n_0 ;
  wire \shift_reg_reg[2]_LDC_n_0 ;
  wire \shift_reg_reg[2]_P_n_0 ;
  wire \shift_reg_reg[3]_C_n_0 ;
  wire \shift_reg_reg[3]_LDC_i_1_n_0 ;
  wire \shift_reg_reg[3]_LDC_i_2_n_0 ;
  wire \shift_reg_reg[3]_LDC_n_0 ;
  wire \shift_reg_reg[3]_P_n_0 ;
  wire \shift_reg_reg[4]_C_n_0 ;
  wire \shift_reg_reg[4]_LDC_i_1_n_0 ;
  wire \shift_reg_reg[4]_LDC_i_2_n_0 ;
  wire \shift_reg_reg[4]_LDC_n_0 ;
  wire \shift_reg_reg[4]_P_n_0 ;
  wire \shift_reg_reg[5]_C_n_0 ;
  wire \shift_reg_reg[5]_LDC_i_1_n_0 ;
  wire \shift_reg_reg[5]_LDC_i_2_n_0 ;
  wire \shift_reg_reg[5]_LDC_n_0 ;
  wire \shift_reg_reg[5]_P_n_0 ;
  wire \shift_reg_reg[6]_C_n_0 ;
  wire \shift_reg_reg[6]_LDC_i_1_n_0 ;
  wire \shift_reg_reg[6]_LDC_i_2_n_0 ;
  wire \shift_reg_reg[6]_LDC_n_0 ;
  wire \shift_reg_reg[6]_P_n_0 ;
  (* DONT_TOUCH *) wire [7:0]\shift_reg_reg[7]_C_0 ;
  wire \shift_reg_reg[7]_C_n_0 ;
  wire \shift_reg_reg[7]_LDC_i_1_n_0 ;
  wire \shift_reg_reg[7]_LDC_i_2_n_0 ;
  wire \shift_reg_reg[7]_LDC_n_0 ;
  wire \shift_reg_reg[7]_P_0 ;
  wire \shift_reg_reg[7]_P_1 ;
  wire \shift_reg_reg[7]_P_n_0 ;
  wire sys_clk_IBUF_BUFG;
  (* DONT_TOUCH *) wire tx_busy;
  (* DONT_TOUCH *) wire tx_reg;
  wire tx_reg17_out;
  wire tx_reg1_out;
  wire tx_reg_i_2_n_0;
  wire tx_reg_i_3_n_0;
  (* DONT_TOUCH *) wire tx_reg_reg_0;
  wire [2:0]NLW_baud_cnt0_carry_CO_UNCONNECTED;
  wire [2:0]NLW_baud_cnt0_carry__0_CO_UNCONNECTED;
  wire [2:0]NLW_baud_cnt0_carry__1_CO_UNCONNECTED;
  wire [3:0]NLW_baud_cnt0_carry__2_CO_UNCONNECTED;
  wire [3:3]NLW_baud_cnt0_carry__2_O_UNCONNECTED;

  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 baud_cnt0_carry
       (.CI(1'b0),
        .CO({baud_cnt0_carry_n_0,NLW_baud_cnt0_carry_CO_UNCONNECTED[2:0]}),
        .CYINIT(baud_cnt[0]),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(baud_cnt0__28[4:1]),
        .S(baud_cnt[4:1]));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 baud_cnt0_carry__0
       (.CI(baud_cnt0_carry_n_0),
        .CO({baud_cnt0_carry__0_n_0,NLW_baud_cnt0_carry__0_CO_UNCONNECTED[2:0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(baud_cnt0__28[8:5]),
        .S(baud_cnt[8:5]));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 baud_cnt0_carry__1
       (.CI(baud_cnt0_carry__0_n_0),
        .CO({baud_cnt0_carry__1_n_0,NLW_baud_cnt0_carry__1_CO_UNCONNECTED[2:0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(baud_cnt0__28[12:9]),
        .S(baud_cnt[12:9]));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 baud_cnt0_carry__2
       (.CI(baud_cnt0_carry__1_n_0),
        .CO(NLW_baud_cnt0_carry__2_CO_UNCONNECTED[3:0]),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({NLW_baud_cnt0_carry__2_O_UNCONNECTED[3],baud_cnt0__28[15:13]}),
        .S({1'b0,baud_cnt[15:13]}));
  LUT4 #(
    .INIT(16'h0388)) 
    \baud_cnt[0]_i_1 
       (.I0(\baud_cnt[15]_i_3_n_0 ),
        .I1(tx_busy),
        .I2(out),
        .I3(baud_cnt[0]),
        .O(p_0_in__0[0]));
  LUT5 #(
    .INIT(32'hC000C0AA)) 
    \baud_cnt[10]_i_1 
       (.I0(baud_cnt[10]),
        .I1(\baud_cnt[15]_i_3_n_0 ),
        .I2(baud_cnt0__28[10]),
        .I3(tx_busy),
        .I4(out),
        .O(p_0_in__0[10]));
  LUT5 #(
    .INIT(32'hC000C0AA)) 
    \baud_cnt[11]_i_1 
       (.I0(baud_cnt[11]),
        .I1(\baud_cnt[15]_i_3_n_0 ),
        .I2(baud_cnt0__28[11]),
        .I3(tx_busy),
        .I4(out),
        .O(p_0_in__0[11]));
  LUT5 #(
    .INIT(32'hC000C0AA)) 
    \baud_cnt[12]_i_1 
       (.I0(baud_cnt[12]),
        .I1(\baud_cnt[15]_i_3_n_0 ),
        .I2(baud_cnt0__28[12]),
        .I3(tx_busy),
        .I4(out),
        .O(p_0_in__0[12]));
  LUT5 #(
    .INIT(32'hC000C0AA)) 
    \baud_cnt[13]_i_1 
       (.I0(baud_cnt[13]),
        .I1(\baud_cnt[15]_i_3_n_0 ),
        .I2(baud_cnt0__28[13]),
        .I3(tx_busy),
        .I4(out),
        .O(p_0_in__0[13]));
  LUT5 #(
    .INIT(32'hC000C0AA)) 
    \baud_cnt[14]_i_1 
       (.I0(baud_cnt[14]),
        .I1(\baud_cnt[15]_i_3_n_0 ),
        .I2(baud_cnt0__28[14]),
        .I3(tx_busy),
        .I4(out),
        .O(p_0_in__0[14]));
  LUT5 #(
    .INIT(32'hC000C0AA)) 
    \baud_cnt[15]_i_1 
       (.I0(baud_cnt[15]),
        .I1(\baud_cnt[15]_i_3_n_0 ),
        .I2(baud_cnt0__28[15]),
        .I3(tx_busy),
        .I4(out),
        .O(p_0_in__0[15]));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \baud_cnt[15]_i_3 
       (.I0(\baud_cnt[15]_i_4_n_0 ),
        .I1(\baud_cnt[15]_i_5_n_0 ),
        .I2(\baud_cnt[15]_i_6_n_0 ),
        .I3(\baud_cnt[15]_i_7_n_0 ),
        .O(\baud_cnt[15]_i_3_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \baud_cnt[15]_i_4 
       (.I0(baud_cnt[15]),
        .I1(baud_cnt[13]),
        .I2(baud_cnt[14]),
        .I3(baud_cnt[12]),
        .O(\baud_cnt[15]_i_4_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \baud_cnt[15]_i_5 
       (.I0(baud_cnt[7]),
        .I1(baud_cnt[11]),
        .I2(baud_cnt[8]),
        .I3(baud_cnt[9]),
        .O(\baud_cnt[15]_i_5_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \baud_cnt[15]_i_6 
       (.I0(baud_cnt[5]),
        .I1(baud_cnt[3]),
        .I2(baud_cnt[6]),
        .I3(baud_cnt[2]),
        .O(\baud_cnt[15]_i_6_n_0 ));
  LUT4 #(
    .INIT(16'hFFDF)) 
    \baud_cnt[15]_i_7 
       (.I0(baud_cnt[4]),
        .I1(baud_cnt[1]),
        .I2(baud_cnt[10]),
        .I3(baud_cnt[0]),
        .O(\baud_cnt[15]_i_7_n_0 ));
  LUT5 #(
    .INIT(32'hC000C0AA)) 
    \baud_cnt[1]_i_1 
       (.I0(baud_cnt[1]),
        .I1(\baud_cnt[15]_i_3_n_0 ),
        .I2(baud_cnt0__28[1]),
        .I3(tx_busy),
        .I4(out),
        .O(p_0_in__0[1]));
  LUT5 #(
    .INIT(32'hC000C0AA)) 
    \baud_cnt[2]_i_1 
       (.I0(baud_cnt[2]),
        .I1(\baud_cnt[15]_i_3_n_0 ),
        .I2(baud_cnt0__28[2]),
        .I3(tx_busy),
        .I4(out),
        .O(p_0_in__0[2]));
  LUT5 #(
    .INIT(32'hC000C0AA)) 
    \baud_cnt[3]_i_1 
       (.I0(baud_cnt[3]),
        .I1(\baud_cnt[15]_i_3_n_0 ),
        .I2(baud_cnt0__28[3]),
        .I3(tx_busy),
        .I4(out),
        .O(p_0_in__0[3]));
  LUT5 #(
    .INIT(32'hC000C0AA)) 
    \baud_cnt[4]_i_1 
       (.I0(baud_cnt[4]),
        .I1(\baud_cnt[15]_i_3_n_0 ),
        .I2(baud_cnt0__28[4]),
        .I3(tx_busy),
        .I4(out),
        .O(p_0_in__0[4]));
  LUT5 #(
    .INIT(32'hC000C0AA)) 
    \baud_cnt[5]_i_1 
       (.I0(baud_cnt[5]),
        .I1(\baud_cnt[15]_i_3_n_0 ),
        .I2(baud_cnt0__28[5]),
        .I3(tx_busy),
        .I4(out),
        .O(p_0_in__0[5]));
  LUT5 #(
    .INIT(32'hC000C0AA)) 
    \baud_cnt[6]_i_1 
       (.I0(baud_cnt[6]),
        .I1(\baud_cnt[15]_i_3_n_0 ),
        .I2(baud_cnt0__28[6]),
        .I3(tx_busy),
        .I4(out),
        .O(p_0_in__0[6]));
  LUT5 #(
    .INIT(32'hC000C0AA)) 
    \baud_cnt[7]_i_1 
       (.I0(baud_cnt[7]),
        .I1(\baud_cnt[15]_i_3_n_0 ),
        .I2(baud_cnt0__28[7]),
        .I3(tx_busy),
        .I4(out),
        .O(p_0_in__0[7]));
  LUT5 #(
    .INIT(32'hC000C0AA)) 
    \baud_cnt[8]_i_1 
       (.I0(baud_cnt[8]),
        .I1(\baud_cnt[15]_i_3_n_0 ),
        .I2(baud_cnt0__28[8]),
        .I3(tx_busy),
        .I4(out),
        .O(p_0_in__0[8]));
  LUT5 #(
    .INIT(32'hC000C0AA)) 
    \baud_cnt[9]_i_1 
       (.I0(baud_cnt[9]),
        .I1(\baud_cnt[15]_i_3_n_0 ),
        .I2(baud_cnt0__28[9]),
        .I3(tx_busy),
        .I4(out),
        .O(p_0_in__0[9]));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  FDCE \baud_cnt_reg[0] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(rst),
        .D(p_0_in__0[0]),
        .Q(baud_cnt[0]));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  FDCE \baud_cnt_reg[10] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(rst),
        .D(p_0_in__0[10]),
        .Q(baud_cnt[10]));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  FDCE \baud_cnt_reg[11] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(rst),
        .D(p_0_in__0[11]),
        .Q(baud_cnt[11]));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  FDCE \baud_cnt_reg[12] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(rst),
        .D(p_0_in__0[12]),
        .Q(baud_cnt[12]));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  FDCE \baud_cnt_reg[13] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(rst),
        .D(p_0_in__0[13]),
        .Q(baud_cnt[13]));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  FDCE \baud_cnt_reg[14] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(rst),
        .D(p_0_in__0[14]),
        .Q(baud_cnt[14]));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  FDCE \baud_cnt_reg[15] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(rst),
        .D(p_0_in__0[15]),
        .Q(baud_cnt[15]));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  FDCE \baud_cnt_reg[1] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(rst),
        .D(p_0_in__0[1]),
        .Q(baud_cnt[1]));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  FDCE \baud_cnt_reg[2] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(rst),
        .D(p_0_in__0[2]),
        .Q(baud_cnt[2]));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  FDCE \baud_cnt_reg[3] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(rst),
        .D(p_0_in__0[3]),
        .Q(baud_cnt[3]));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  FDCE \baud_cnt_reg[4] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(rst),
        .D(p_0_in__0[4]),
        .Q(baud_cnt[4]));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  FDCE \baud_cnt_reg[5] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(rst),
        .D(p_0_in__0[5]),
        .Q(baud_cnt[5]));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  FDCE \baud_cnt_reg[6] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(rst),
        .D(p_0_in__0[6]),
        .Q(baud_cnt[6]));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  FDCE \baud_cnt_reg[7] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(rst),
        .D(p_0_in__0[7]),
        .Q(baud_cnt[7]));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  FDCE \baud_cnt_reg[8] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(rst),
        .D(p_0_in__0[8]),
        .Q(baud_cnt[8]));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  FDCE \baud_cnt_reg[9] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(rst),
        .D(p_0_in__0[9]),
        .Q(baud_cnt[9]));
  LUT4 #(
    .INIT(16'hC530)) 
    \bit_cnt[0]_i_1 
       (.I0(out),
        .I1(\baud_cnt[15]_i_3_n_0 ),
        .I2(tx_busy),
        .I3(bit_cnt[0]),
        .O(\bit_cnt[0]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hD1DD0C00)) 
    \bit_cnt[1]_i_1__0 
       (.I0(out),
        .I1(tx_busy),
        .I2(\baud_cnt[15]_i_3_n_0 ),
        .I3(bit_cnt[0]),
        .I4(bit_cnt[1]),
        .O(\bit_cnt[1]_i_1__0_n_0 ));
  LUT6 #(
    .INIT(64'hFF3F555500C00000)) 
    \bit_cnt[2]_i_1__0 
       (.I0(out),
        .I1(bit_cnt[1]),
        .I2(bit_cnt[0]),
        .I3(\baud_cnt[15]_i_3_n_0 ),
        .I4(tx_busy),
        .I5(bit_cnt[2]),
        .O(\bit_cnt[2]_i_1__0_n_0 ));
  LUT6 #(
    .INIT(64'h00000000BFFF4000)) 
    \bit_cnt[3]_i_1 
       (.I0(\bit_cnt[3]_i_2_n_0 ),
        .I1(bit_cnt[0]),
        .I2(bit_cnt[1]),
        .I3(bit_cnt[2]),
        .I4(bit_cnt[3]),
        .I5(tx_reg17_out),
        .O(\bit_cnt[3]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hFFFEFFFF)) 
    \bit_cnt[3]_i_2 
       (.I0(\baud_cnt[15]_i_7_n_0 ),
        .I1(\baud_cnt[15]_i_6_n_0 ),
        .I2(\baud_cnt[15]_i_5_n_0 ),
        .I3(\baud_cnt[15]_i_4_n_0 ),
        .I4(tx_busy),
        .O(\bit_cnt[3]_i_2_n_0 ));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  FDCE \bit_cnt_reg[0] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(rst),
        .D(\bit_cnt[0]_i_1_n_0 ),
        .Q(bit_cnt[0]));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  FDCE \bit_cnt_reg[1] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(rst),
        .D(\bit_cnt[1]_i_1__0_n_0 ),
        .Q(bit_cnt[1]));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  FDCE \bit_cnt_reg[2] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(rst),
        .D(\bit_cnt[2]_i_1__0_n_0 ),
        .Q(bit_cnt[2]));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  FDCE \bit_cnt_reg[3] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(rst),
        .D(\bit_cnt[3]_i_1_n_0 ),
        .Q(bit_cnt[3]));
  LUT3 #(
    .INIT(8'hF8)) 
    busy_reg_i_1
       (.I0(tx_busy),
        .I1(\baud_cnt[15]_i_3_n_0 ),
        .I2(busy_reg_i_2_n_0),
        .O(busy_reg_i_1_n_0));
  LUT6 #(
    .INIT(64'hFFF7FFFFFFF70000)) 
    busy_reg_i_2
       (.I0(bit_cnt[1]),
        .I1(bit_cnt[3]),
        .I2(bit_cnt[0]),
        .I3(bit_cnt[2]),
        .I4(tx_busy),
        .I5(out),
        .O(busy_reg_i_2_n_0));
  LUT1 #(
    .INIT(2'h2)) 
    busy_reg_inst
       (.I0(busy_reg),
        .O(tx_busy));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  (* SRL_STYLE = "register" *) 
  FDCE busy_reg_reg
       (.C(sys_clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(rst),
        .D(busy_reg_i_1_n_0),
        .Q(busy_reg));
  LUT4 #(
    .INIT(16'hFB08)) 
    parity_C_i_1
       (.I0(parity_P_i_2_n_0),
        .I1(out),
        .I2(tx_busy),
        .I3(parity_reg_C_n_0),
        .O(parity_C_i_1_n_0));
  LUT2 #(
    .INIT(4'h2)) 
    parity_P_i_1
       (.I0(out),
        .I1(tx_busy),
        .O(tx_reg17_out));
  LUT5 #(
    .INIT(32'h96696996)) 
    parity_P_i_2
       (.I0(\shift_reg_reg[7]_C_0 [2]),
        .I1(\shift_reg_reg[7]_C_0 [3]),
        .I2(\shift_reg_reg[7]_C_0 [4]),
        .I3(\shift_reg_reg[7]_C_0 [5]),
        .I4(parity_P_i_3_n_0),
        .O(parity_P_i_2_n_0));
  LUT4 #(
    .INIT(16'h6996)) 
    parity_P_i_3
       (.I0(\shift_reg_reg[7]_C_0 [1]),
        .I1(\shift_reg_reg[7]_C_0 [0]),
        .I2(\shift_reg_reg[7]_C_0 [7]),
        .I3(\shift_reg_reg[7]_C_0 [6]),
        .O(parity_P_i_3_n_0));
  LUT3 #(
    .INIT(8'hB8)) 
    parity_inferred__0_i_1
       (.I0(parity_reg_P_n_0),
        .I1(parity_reg_LDC_n_0),
        .I2(parity_reg_C_n_0),
        .O(parity));
  FDCE parity_reg_C
       (.C(sys_clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(parity_reg_LDC_i_2_n_0),
        .D(parity_C_i_1_n_0),
        .Q(parity_reg_C_n_0));
  (* XILINX_LEGACY_PRIM = "LDC" *) 
  (* XILINX_TRANSFORM_PINMAP = "VCC:GE" *) 
  LDCE #(
    .INIT(1'b0)) 
    parity_reg_LDC
       (.CLR(parity_reg_LDC_i_2_n_0),
        .D(1'b1),
        .G(parity_reg_LDC_i_1_n_0),
        .GE(1'b1),
        .Q(parity_reg_LDC_n_0));
  LUT4 #(
    .INIT(16'hAA2A)) 
    parity_reg_LDC_i_1
       (.I0(parity),
        .I1(\shift_reg_reg[7]_P_0 ),
        .I2(\shift_reg_reg[7]_P_1 ),
        .I3(rst_n_IBUF),
        .O(parity_reg_LDC_i_1_n_0));
  LUT4 #(
    .INIT(16'h5515)) 
    parity_reg_LDC_i_2
       (.I0(parity),
        .I1(\shift_reg_reg[7]_P_0 ),
        .I2(\shift_reg_reg[7]_P_1 ),
        .I3(rst_n_IBUF),
        .O(parity_reg_LDC_i_2_n_0));
  FDPE parity_reg_P
       (.C(sys_clk_IBUF_BUFG),
        .CE(tx_reg17_out),
        .D(parity_P_i_2_n_0),
        .PRE(parity_reg_LDC_i_1_n_0),
        .Q(parity_reg_P_n_0));
  LUT6 #(
    .INIT(64'hB8B8B8BBB8B8B888)) 
    \shift_reg[0]_C_i_1 
       (.I0(\shift_reg_reg[7]_C_0 [0]),
        .I1(tx_reg17_out),
        .I2(shift_reg[0]),
        .I3(\shift_reg[6]_C_i_2_n_0 ),
        .I4(\shift_reg[6]_C_i_3_n_0 ),
        .I5(shift_reg[1]),
        .O(\shift_reg[0]_C_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hB8B8B8BBB8B8B888)) 
    \shift_reg[1]_C_i_1 
       (.I0(\shift_reg_reg[7]_C_0 [1]),
        .I1(tx_reg17_out),
        .I2(shift_reg[1]),
        .I3(\shift_reg[6]_C_i_2_n_0 ),
        .I4(\shift_reg[6]_C_i_3_n_0 ),
        .I5(shift_reg[2]),
        .O(\shift_reg[1]_C_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hB8B8B8BBB8B8B888)) 
    \shift_reg[2]_C_i_1 
       (.I0(\shift_reg_reg[7]_C_0 [2]),
        .I1(tx_reg17_out),
        .I2(shift_reg[2]),
        .I3(\shift_reg[6]_C_i_2_n_0 ),
        .I4(\shift_reg[6]_C_i_3_n_0 ),
        .I5(shift_reg[3]),
        .O(\shift_reg[2]_C_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hB8B8B8BBB8B8B888)) 
    \shift_reg[3]_C_i_1 
       (.I0(\shift_reg_reg[7]_C_0 [3]),
        .I1(tx_reg17_out),
        .I2(shift_reg[3]),
        .I3(\shift_reg[6]_C_i_2_n_0 ),
        .I4(\shift_reg[6]_C_i_3_n_0 ),
        .I5(shift_reg[4]),
        .O(\shift_reg[3]_C_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hB8B8B8BBB8B8B888)) 
    \shift_reg[4]_C_i_1 
       (.I0(\shift_reg_reg[7]_C_0 [4]),
        .I1(tx_reg17_out),
        .I2(shift_reg[4]),
        .I3(\shift_reg[6]_C_i_2_n_0 ),
        .I4(\shift_reg[6]_C_i_3_n_0 ),
        .I5(shift_reg[5]),
        .O(\shift_reg[4]_C_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hB8B8B8BBB8B8B888)) 
    \shift_reg[5]_C_i_1 
       (.I0(\shift_reg_reg[7]_C_0 [5]),
        .I1(tx_reg17_out),
        .I2(shift_reg[5]),
        .I3(\shift_reg[6]_C_i_2_n_0 ),
        .I4(\shift_reg[6]_C_i_3_n_0 ),
        .I5(shift_reg[6]),
        .O(\shift_reg[5]_C_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hB8B8B8BBB8B8B888)) 
    \shift_reg[6]_C_i_1 
       (.I0(\shift_reg_reg[7]_C_0 [6]),
        .I1(tx_reg17_out),
        .I2(shift_reg[6]),
        .I3(\shift_reg[6]_C_i_2_n_0 ),
        .I4(\shift_reg[6]_C_i_3_n_0 ),
        .I5(shift_reg[7]),
        .O(\shift_reg[6]_C_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFB)) 
    \shift_reg[6]_C_i_2 
       (.I0(tx_reg_i_3_n_0),
        .I1(tx_busy),
        .I2(\baud_cnt[15]_i_5_n_0 ),
        .I3(\baud_cnt[15]_i_7_n_0 ),
        .I4(\baud_cnt[15]_i_4_n_0 ),
        .I5(\baud_cnt[15]_i_6_n_0 ),
        .O(\shift_reg[6]_C_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \shift_reg[6]_C_i_3 
       (.I0(bit_cnt[3]),
        .I1(bit_cnt[0]),
        .O(\shift_reg[6]_C_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFA8880000A888)) 
    \shift_reg[7]_C_i_1 
       (.I0(shift_reg[7]),
        .I1(tx_reg_i_2_n_0),
        .I2(bit_cnt[0]),
        .I3(bit_cnt[3]),
        .I4(tx_reg17_out),
        .I5(\shift_reg_reg[7]_C_0 [7]),
        .O(\shift_reg[7]_C_i_1_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    shift_reg_inferred__0_i_1
       (.I0(\shift_reg_reg[7]_P_n_0 ),
        .I1(\shift_reg_reg[7]_LDC_n_0 ),
        .I2(\shift_reg_reg[7]_C_n_0 ),
        .O(shift_reg[7]));
  LUT3 #(
    .INIT(8'hB8)) 
    shift_reg_inferred__0_i_2
       (.I0(\shift_reg_reg[6]_P_n_0 ),
        .I1(\shift_reg_reg[6]_LDC_n_0 ),
        .I2(\shift_reg_reg[6]_C_n_0 ),
        .O(shift_reg[6]));
  LUT3 #(
    .INIT(8'hB8)) 
    shift_reg_inferred__0_i_3
       (.I0(\shift_reg_reg[5]_P_n_0 ),
        .I1(\shift_reg_reg[5]_LDC_n_0 ),
        .I2(\shift_reg_reg[5]_C_n_0 ),
        .O(shift_reg[5]));
  LUT3 #(
    .INIT(8'hB8)) 
    shift_reg_inferred__0_i_4
       (.I0(\shift_reg_reg[4]_P_n_0 ),
        .I1(\shift_reg_reg[4]_LDC_n_0 ),
        .I2(\shift_reg_reg[4]_C_n_0 ),
        .O(shift_reg[4]));
  LUT3 #(
    .INIT(8'hB8)) 
    shift_reg_inferred__0_i_5
       (.I0(\shift_reg_reg[3]_P_n_0 ),
        .I1(\shift_reg_reg[3]_LDC_n_0 ),
        .I2(\shift_reg_reg[3]_C_n_0 ),
        .O(shift_reg[3]));
  LUT3 #(
    .INIT(8'hB8)) 
    shift_reg_inferred__0_i_6
       (.I0(\shift_reg_reg[2]_P_n_0 ),
        .I1(\shift_reg_reg[2]_LDC_n_0 ),
        .I2(\shift_reg_reg[2]_C_n_0 ),
        .O(shift_reg[2]));
  LUT3 #(
    .INIT(8'hB8)) 
    shift_reg_inferred__0_i_7
       (.I0(\shift_reg_reg[1]_P_n_0 ),
        .I1(\shift_reg_reg[1]_LDC_n_0 ),
        .I2(\shift_reg_reg[1]_C_n_0 ),
        .O(shift_reg[1]));
  LUT3 #(
    .INIT(8'hB8)) 
    shift_reg_inferred__0_i_8
       (.I0(\shift_reg_reg[0]_P_n_0 ),
        .I1(\shift_reg_reg[0]_LDC_n_0 ),
        .I2(\shift_reg_reg[0]_C_n_0 ),
        .O(shift_reg[0]));
  FDCE \shift_reg_reg[0]_C 
       (.C(sys_clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(\shift_reg_reg[0]_LDC_i_2_n_0 ),
        .D(\shift_reg[0]_C_i_1_n_0 ),
        .Q(\shift_reg_reg[0]_C_n_0 ));
  (* XILINX_LEGACY_PRIM = "LDC" *) 
  (* XILINX_TRANSFORM_PINMAP = "VCC:GE" *) 
  LDCE #(
    .INIT(1'b0)) 
    \shift_reg_reg[0]_LDC 
       (.CLR(\shift_reg_reg[0]_LDC_i_2_n_0 ),
        .D(1'b1),
        .G(\shift_reg_reg[0]_LDC_i_1_n_0 ),
        .GE(1'b1),
        .Q(\shift_reg_reg[0]_LDC_n_0 ));
  LUT4 #(
    .INIT(16'hAA2A)) 
    \shift_reg_reg[0]_LDC_i_1 
       (.I0(shift_reg[0]),
        .I1(\shift_reg_reg[7]_P_0 ),
        .I2(\shift_reg_reg[7]_P_1 ),
        .I3(rst_n_IBUF),
        .O(\shift_reg_reg[0]_LDC_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h5515)) 
    \shift_reg_reg[0]_LDC_i_2 
       (.I0(shift_reg[0]),
        .I1(\shift_reg_reg[7]_P_0 ),
        .I2(\shift_reg_reg[7]_P_1 ),
        .I3(rst_n_IBUF),
        .O(\shift_reg_reg[0]_LDC_i_2_n_0 ));
  FDPE \shift_reg_reg[0]_P 
       (.C(sys_clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\shift_reg[0]_C_i_1_n_0 ),
        .PRE(\shift_reg_reg[0]_LDC_i_1_n_0 ),
        .Q(\shift_reg_reg[0]_P_n_0 ));
  FDCE \shift_reg_reg[1]_C 
       (.C(sys_clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(\shift_reg_reg[1]_LDC_i_2_n_0 ),
        .D(\shift_reg[1]_C_i_1_n_0 ),
        .Q(\shift_reg_reg[1]_C_n_0 ));
  (* XILINX_LEGACY_PRIM = "LDC" *) 
  (* XILINX_TRANSFORM_PINMAP = "VCC:GE" *) 
  LDCE #(
    .INIT(1'b0)) 
    \shift_reg_reg[1]_LDC 
       (.CLR(\shift_reg_reg[1]_LDC_i_2_n_0 ),
        .D(1'b1),
        .G(\shift_reg_reg[1]_LDC_i_1_n_0 ),
        .GE(1'b1),
        .Q(\shift_reg_reg[1]_LDC_n_0 ));
  LUT4 #(
    .INIT(16'hAA2A)) 
    \shift_reg_reg[1]_LDC_i_1 
       (.I0(shift_reg[1]),
        .I1(\shift_reg_reg[7]_P_0 ),
        .I2(\shift_reg_reg[7]_P_1 ),
        .I3(rst_n_IBUF),
        .O(\shift_reg_reg[1]_LDC_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h5515)) 
    \shift_reg_reg[1]_LDC_i_2 
       (.I0(shift_reg[1]),
        .I1(\shift_reg_reg[7]_P_0 ),
        .I2(\shift_reg_reg[7]_P_1 ),
        .I3(rst_n_IBUF),
        .O(\shift_reg_reg[1]_LDC_i_2_n_0 ));
  FDPE \shift_reg_reg[1]_P 
       (.C(sys_clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\shift_reg[1]_C_i_1_n_0 ),
        .PRE(\shift_reg_reg[1]_LDC_i_1_n_0 ),
        .Q(\shift_reg_reg[1]_P_n_0 ));
  FDCE \shift_reg_reg[2]_C 
       (.C(sys_clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(\shift_reg_reg[2]_LDC_i_2_n_0 ),
        .D(\shift_reg[2]_C_i_1_n_0 ),
        .Q(\shift_reg_reg[2]_C_n_0 ));
  (* XILINX_LEGACY_PRIM = "LDC" *) 
  (* XILINX_TRANSFORM_PINMAP = "VCC:GE" *) 
  LDCE #(
    .INIT(1'b0)) 
    \shift_reg_reg[2]_LDC 
       (.CLR(\shift_reg_reg[2]_LDC_i_2_n_0 ),
        .D(1'b1),
        .G(\shift_reg_reg[2]_LDC_i_1_n_0 ),
        .GE(1'b1),
        .Q(\shift_reg_reg[2]_LDC_n_0 ));
  LUT4 #(
    .INIT(16'hAA2A)) 
    \shift_reg_reg[2]_LDC_i_1 
       (.I0(shift_reg[2]),
        .I1(\shift_reg_reg[7]_P_0 ),
        .I2(\shift_reg_reg[7]_P_1 ),
        .I3(rst_n_IBUF),
        .O(\shift_reg_reg[2]_LDC_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h5515)) 
    \shift_reg_reg[2]_LDC_i_2 
       (.I0(shift_reg[2]),
        .I1(\shift_reg_reg[7]_P_0 ),
        .I2(\shift_reg_reg[7]_P_1 ),
        .I3(rst_n_IBUF),
        .O(\shift_reg_reg[2]_LDC_i_2_n_0 ));
  FDPE \shift_reg_reg[2]_P 
       (.C(sys_clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\shift_reg[2]_C_i_1_n_0 ),
        .PRE(\shift_reg_reg[2]_LDC_i_1_n_0 ),
        .Q(\shift_reg_reg[2]_P_n_0 ));
  FDCE \shift_reg_reg[3]_C 
       (.C(sys_clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(\shift_reg_reg[3]_LDC_i_2_n_0 ),
        .D(\shift_reg[3]_C_i_1_n_0 ),
        .Q(\shift_reg_reg[3]_C_n_0 ));
  (* XILINX_LEGACY_PRIM = "LDC" *) 
  (* XILINX_TRANSFORM_PINMAP = "VCC:GE" *) 
  LDCE #(
    .INIT(1'b0)) 
    \shift_reg_reg[3]_LDC 
       (.CLR(\shift_reg_reg[3]_LDC_i_2_n_0 ),
        .D(1'b1),
        .G(\shift_reg_reg[3]_LDC_i_1_n_0 ),
        .GE(1'b1),
        .Q(\shift_reg_reg[3]_LDC_n_0 ));
  LUT4 #(
    .INIT(16'hAA2A)) 
    \shift_reg_reg[3]_LDC_i_1 
       (.I0(shift_reg[3]),
        .I1(\shift_reg_reg[7]_P_0 ),
        .I2(\shift_reg_reg[7]_P_1 ),
        .I3(rst_n_IBUF),
        .O(\shift_reg_reg[3]_LDC_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h5515)) 
    \shift_reg_reg[3]_LDC_i_2 
       (.I0(shift_reg[3]),
        .I1(\shift_reg_reg[7]_P_0 ),
        .I2(\shift_reg_reg[7]_P_1 ),
        .I3(rst_n_IBUF),
        .O(\shift_reg_reg[3]_LDC_i_2_n_0 ));
  FDPE \shift_reg_reg[3]_P 
       (.C(sys_clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\shift_reg[3]_C_i_1_n_0 ),
        .PRE(\shift_reg_reg[3]_LDC_i_1_n_0 ),
        .Q(\shift_reg_reg[3]_P_n_0 ));
  FDCE \shift_reg_reg[4]_C 
       (.C(sys_clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(\shift_reg_reg[4]_LDC_i_2_n_0 ),
        .D(\shift_reg[4]_C_i_1_n_0 ),
        .Q(\shift_reg_reg[4]_C_n_0 ));
  (* XILINX_LEGACY_PRIM = "LDC" *) 
  (* XILINX_TRANSFORM_PINMAP = "VCC:GE" *) 
  LDCE #(
    .INIT(1'b0)) 
    \shift_reg_reg[4]_LDC 
       (.CLR(\shift_reg_reg[4]_LDC_i_2_n_0 ),
        .D(1'b1),
        .G(\shift_reg_reg[4]_LDC_i_1_n_0 ),
        .GE(1'b1),
        .Q(\shift_reg_reg[4]_LDC_n_0 ));
  LUT4 #(
    .INIT(16'hAA2A)) 
    \shift_reg_reg[4]_LDC_i_1 
       (.I0(shift_reg[4]),
        .I1(\shift_reg_reg[7]_P_0 ),
        .I2(\shift_reg_reg[7]_P_1 ),
        .I3(rst_n_IBUF),
        .O(\shift_reg_reg[4]_LDC_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h5515)) 
    \shift_reg_reg[4]_LDC_i_2 
       (.I0(shift_reg[4]),
        .I1(\shift_reg_reg[7]_P_0 ),
        .I2(\shift_reg_reg[7]_P_1 ),
        .I3(rst_n_IBUF),
        .O(\shift_reg_reg[4]_LDC_i_2_n_0 ));
  FDPE \shift_reg_reg[4]_P 
       (.C(sys_clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\shift_reg[4]_C_i_1_n_0 ),
        .PRE(\shift_reg_reg[4]_LDC_i_1_n_0 ),
        .Q(\shift_reg_reg[4]_P_n_0 ));
  FDCE \shift_reg_reg[5]_C 
       (.C(sys_clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(\shift_reg_reg[5]_LDC_i_2_n_0 ),
        .D(\shift_reg[5]_C_i_1_n_0 ),
        .Q(\shift_reg_reg[5]_C_n_0 ));
  (* XILINX_LEGACY_PRIM = "LDC" *) 
  (* XILINX_TRANSFORM_PINMAP = "VCC:GE" *) 
  LDCE #(
    .INIT(1'b0)) 
    \shift_reg_reg[5]_LDC 
       (.CLR(\shift_reg_reg[5]_LDC_i_2_n_0 ),
        .D(1'b1),
        .G(\shift_reg_reg[5]_LDC_i_1_n_0 ),
        .GE(1'b1),
        .Q(\shift_reg_reg[5]_LDC_n_0 ));
  LUT4 #(
    .INIT(16'hAA2A)) 
    \shift_reg_reg[5]_LDC_i_1 
       (.I0(shift_reg[5]),
        .I1(\shift_reg_reg[7]_P_0 ),
        .I2(\shift_reg_reg[7]_P_1 ),
        .I3(rst_n_IBUF),
        .O(\shift_reg_reg[5]_LDC_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h5515)) 
    \shift_reg_reg[5]_LDC_i_2 
       (.I0(shift_reg[5]),
        .I1(\shift_reg_reg[7]_P_0 ),
        .I2(\shift_reg_reg[7]_P_1 ),
        .I3(rst_n_IBUF),
        .O(\shift_reg_reg[5]_LDC_i_2_n_0 ));
  FDPE \shift_reg_reg[5]_P 
       (.C(sys_clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\shift_reg[5]_C_i_1_n_0 ),
        .PRE(\shift_reg_reg[5]_LDC_i_1_n_0 ),
        .Q(\shift_reg_reg[5]_P_n_0 ));
  FDCE \shift_reg_reg[6]_C 
       (.C(sys_clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(\shift_reg_reg[6]_LDC_i_2_n_0 ),
        .D(\shift_reg[6]_C_i_1_n_0 ),
        .Q(\shift_reg_reg[6]_C_n_0 ));
  (* XILINX_LEGACY_PRIM = "LDC" *) 
  (* XILINX_TRANSFORM_PINMAP = "VCC:GE" *) 
  LDCE #(
    .INIT(1'b0)) 
    \shift_reg_reg[6]_LDC 
       (.CLR(\shift_reg_reg[6]_LDC_i_2_n_0 ),
        .D(1'b1),
        .G(\shift_reg_reg[6]_LDC_i_1_n_0 ),
        .GE(1'b1),
        .Q(\shift_reg_reg[6]_LDC_n_0 ));
  LUT4 #(
    .INIT(16'hAA2A)) 
    \shift_reg_reg[6]_LDC_i_1 
       (.I0(shift_reg[6]),
        .I1(\shift_reg_reg[7]_P_0 ),
        .I2(\shift_reg_reg[7]_P_1 ),
        .I3(rst_n_IBUF),
        .O(\shift_reg_reg[6]_LDC_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h5515)) 
    \shift_reg_reg[6]_LDC_i_2 
       (.I0(shift_reg[6]),
        .I1(\shift_reg_reg[7]_P_0 ),
        .I2(\shift_reg_reg[7]_P_1 ),
        .I3(rst_n_IBUF),
        .O(\shift_reg_reg[6]_LDC_i_2_n_0 ));
  FDPE \shift_reg_reg[6]_P 
       (.C(sys_clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\shift_reg[6]_C_i_1_n_0 ),
        .PRE(\shift_reg_reg[6]_LDC_i_1_n_0 ),
        .Q(\shift_reg_reg[6]_P_n_0 ));
  FDCE \shift_reg_reg[7]_C 
       (.C(sys_clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(\shift_reg_reg[7]_LDC_i_2_n_0 ),
        .D(\shift_reg[7]_C_i_1_n_0 ),
        .Q(\shift_reg_reg[7]_C_n_0 ));
  (* XILINX_LEGACY_PRIM = "LDC" *) 
  (* XILINX_TRANSFORM_PINMAP = "VCC:GE" *) 
  LDCE #(
    .INIT(1'b0)) 
    \shift_reg_reg[7]_LDC 
       (.CLR(\shift_reg_reg[7]_LDC_i_2_n_0 ),
        .D(1'b1),
        .G(\shift_reg_reg[7]_LDC_i_1_n_0 ),
        .GE(1'b1),
        .Q(\shift_reg_reg[7]_LDC_n_0 ));
  LUT4 #(
    .INIT(16'hAA2A)) 
    \shift_reg_reg[7]_LDC_i_1 
       (.I0(shift_reg[7]),
        .I1(\shift_reg_reg[7]_P_0 ),
        .I2(\shift_reg_reg[7]_P_1 ),
        .I3(rst_n_IBUF),
        .O(\shift_reg_reg[7]_LDC_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h5515)) 
    \shift_reg_reg[7]_LDC_i_2 
       (.I0(shift_reg[7]),
        .I1(\shift_reg_reg[7]_P_0 ),
        .I2(\shift_reg_reg[7]_P_1 ),
        .I3(rst_n_IBUF),
        .O(\shift_reg_reg[7]_LDC_i_2_n_0 ));
  FDPE \shift_reg_reg[7]_P 
       (.C(sys_clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\shift_reg[7]_C_i_1_n_0 ),
        .PRE(\shift_reg_reg[7]_LDC_i_1_n_0 ),
        .Q(\shift_reg_reg[7]_P_n_0 ));
  LUT6 #(
    .INIT(64'h2323232323202020)) 
    tx_reg_i_1
       (.I0(tx_reg_reg_0),
        .I1(tx_reg17_out),
        .I2(tx_reg_i_2_n_0),
        .I3(bit_cnt[0]),
        .I4(bit_cnt[3]),
        .I5(shift_reg[0]),
        .O(tx_reg1_out));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFB)) 
    tx_reg_i_2
       (.I0(tx_reg_i_3_n_0),
        .I1(tx_busy),
        .I2(\baud_cnt[15]_i_4_n_0 ),
        .I3(\baud_cnt[15]_i_5_n_0 ),
        .I4(\baud_cnt[15]_i_6_n_0 ),
        .I5(\baud_cnt[15]_i_7_n_0 ),
        .O(tx_reg_i_2_n_0));
  LUT3 #(
    .INIT(8'hA8)) 
    tx_reg_i_3
       (.I0(bit_cnt[3]),
        .I1(bit_cnt[1]),
        .I2(bit_cnt[2]),
        .O(tx_reg_i_3_n_0));
  (* IOB = "TRUE" *) 
  LUT1 #(
    .INIT(2'h2)) 
    tx_reg_inst
       (.I0(tx_reg),
        .O(tx_reg_reg_0));
  (* DONT_TOUCH *) 
  (* IOB = "TRUE" *) 
  (* KEEP = "yes" *) 
  FDPE tx_reg_reg
       (.C(sys_clk_IBUF_BUFG),
        .CE(1'b1),
        .D(tx_reg1_out),
        .PRE(rst),
        .Q(tx_reg));
endmodule

module urr
   (dir,
    tx_start,
    Q,
    freq,
    done,
    error,
    tx_busy,
    sys_clk_IBUF_BUFG,
    rst,
    E,
    rx_data,
    D,
    out);
  output dir;
  output tx_start;
  output [7:0]Q;
  output [23:0]freq;
  output done;
  output error;
  input tx_busy;
  input sys_clk_IBUF_BUFG;
  input rst;
  input [0:0]E;
  input [7:0]rx_data;
  input [7:0]D;
  input out;

  wire [7:0]D;
  wire [0:0]E;
  wire \FSM_sequential_state[0]_i_1_n_0 ;
  wire \FSM_sequential_state[1]_i_1_n_0 ;
  wire \FSM_sequential_state[2]_i_1_n_0 ;
  wire \FSM_sequential_state[2]_i_2_n_0 ;
  wire [7:0]Q;
  wire \byte_cnt[0]_i_1__0_n_0 ;
  wire \byte_cnt[1]_i_1__0_n_0 ;
  wire \byte_cnt_reg_n_0_[0] ;
  wire \byte_cnt_reg_n_0_[1] ;
  wire done;
  wire error;
  wire error_i_1_n_0;
  wire error_i_2_n_0;
  wire [23:0]freq;
  wire \freq[23]_i_1_n_0 ;
  wire [23:0]freq_reg;
  wire [23:18]freq_reg0_in;
  wire \freq_reg[11]_i_1_n_0 ;
  wire \freq_reg[17]_i_1_n_0 ;
  wire \freq_reg[23]_i_1_n_0 ;
  wire \freq_reg[5]_i_1_n_0 ;
  wire out;
  wire [1:0]p_0_in;
  wire rst;
  wire [7:0]rx_data;
  wire \rx_data_latch_reg_n_0_[0] ;
  wire \rx_data_latch_reg_n_0_[1] ;
  wire \rx_data_latch_reg_n_0_[2] ;
  wire \rx_data_latch_reg_n_0_[3] ;
  wire \rx_data_latch_reg_n_0_[4] ;
  wire \rx_data_latch_reg_n_0_[5] ;
  wire rx_pending_i_1_n_0;
  wire rx_pending_reg_n_0;
  wire [2:0]state;
  wire sys_clk_IBUF_BUFG;
  (* DONT_TOUCH *) wire tx_busy;
  wire tx_start;
  wire tx_start_i_1_n_0;

  assign dir = tx_busy;
  LUT6 #(
    .INIT(64'h0444FFFF55550000)) 
    \FSM_sequential_state[0]_i_1 
       (.I0(state[2]),
        .I1(state[1]),
        .I2(\byte_cnt_reg_n_0_[1] ),
        .I3(\byte_cnt_reg_n_0_[0] ),
        .I4(\FSM_sequential_state[2]_i_2_n_0 ),
        .I5(state[0]),
        .O(\FSM_sequential_state[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h1555FFFF44440000)) 
    \FSM_sequential_state[1]_i_1 
       (.I0(state[2]),
        .I1(state[0]),
        .I2(\byte_cnt_reg_n_0_[1] ),
        .I3(\byte_cnt_reg_n_0_[0] ),
        .I4(\FSM_sequential_state[2]_i_2_n_0 ),
        .I5(state[1]),
        .O(\FSM_sequential_state[1]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000FFFF80000000)) 
    \FSM_sequential_state[2]_i_1 
       (.I0(\byte_cnt_reg_n_0_[0] ),
        .I1(\byte_cnt_reg_n_0_[1] ),
        .I2(state[0]),
        .I3(state[1]),
        .I4(\FSM_sequential_state[2]_i_2_n_0 ),
        .I5(state[2]),
        .O(\FSM_sequential_state[2]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h00330033FF2ECC2E)) 
    \FSM_sequential_state[2]_i_2 
       (.I0(out),
        .I1(state[0]),
        .I2(tx_busy),
        .I3(state[1]),
        .I4(E),
        .I5(state[2]),
        .O(\FSM_sequential_state[2]_i_2_n_0 ));
  (* FSM_ENCODED_STATES = "IDLE:000,TX_WAIT:001,RX_WAIT:010,ERROR_ST:101,RX_DATA:011,DONE:100" *) 
  FDCE \FSM_sequential_state_reg[0] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(rst),
        .D(\FSM_sequential_state[0]_i_1_n_0 ),
        .Q(state[0]));
  (* FSM_ENCODED_STATES = "IDLE:000,TX_WAIT:001,RX_WAIT:010,ERROR_ST:101,RX_DATA:011,DONE:100" *) 
  FDCE \FSM_sequential_state_reg[1] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(rst),
        .D(\FSM_sequential_state[1]_i_1_n_0 ),
        .Q(state[1]));
  (* FSM_ENCODED_STATES = "IDLE:000,TX_WAIT:001,RX_WAIT:010,ERROR_ST:101,RX_DATA:011,DONE:100" *) 
  FDCE \FSM_sequential_state_reg[2] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(rst),
        .D(\FSM_sequential_state[2]_i_1_n_0 ),
        .Q(state[2]));
  LUT6 #(
    .INIT(64'hCCCCE6CCCC00CCCC)) 
    \byte_cnt[0]_i_1__0 
       (.I0(rx_pending_reg_n_0),
        .I1(\byte_cnt_reg_n_0_[0] ),
        .I2(\byte_cnt_reg_n_0_[1] ),
        .I3(state[0]),
        .I4(state[2]),
        .I5(state[1]),
        .O(\byte_cnt[0]_i_1__0_n_0 ));
  LUT6 #(
    .INIT(64'hF0F0F8F0F000F0F0)) 
    \byte_cnt[1]_i_1__0 
       (.I0(rx_pending_reg_n_0),
        .I1(\byte_cnt_reg_n_0_[0] ),
        .I2(\byte_cnt_reg_n_0_[1] ),
        .I3(state[0]),
        .I4(state[2]),
        .I5(state[1]),
        .O(\byte_cnt[1]_i_1__0_n_0 ));
  FDCE \byte_cnt_reg[0] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(rst),
        .D(\byte_cnt[0]_i_1__0_n_0 ),
        .Q(\byte_cnt_reg_n_0_[0] ));
  FDCE \byte_cnt_reg[1] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(rst),
        .D(\byte_cnt[1]_i_1__0_n_0 ),
        .Q(\byte_cnt_reg_n_0_[1] ));
  FDCE done_reg
       (.C(sys_clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(rst),
        .D(\freq[23]_i_1_n_0 ),
        .Q(done));
  LUT3 #(
    .INIT(8'h40)) 
    error_i_1
       (.I0(error_i_2_n_0),
        .I1(state[0]),
        .I2(state[1]),
        .O(error_i_1_n_0));
  LUT6 #(
    .INIT(64'hEBAAAAEBFFFFFFFF)) 
    error_i_2
       (.I0(state[2]),
        .I1(\byte_cnt_reg_n_0_[0] ),
        .I2(p_0_in[0]),
        .I3(\byte_cnt_reg_n_0_[1] ),
        .I4(p_0_in[1]),
        .I5(rx_pending_reg_n_0),
        .O(error_i_2_n_0));
  FDCE error_reg
       (.C(sys_clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(rst),
        .D(error_i_1_n_0),
        .Q(error));
  LUT3 #(
    .INIT(8'h02)) 
    \freq[23]_i_1 
       (.I0(state[2]),
        .I1(state[0]),
        .I2(state[1]),
        .O(\freq[23]_i_1_n_0 ));
  FDCE \freq_reg[0] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(\freq[23]_i_1_n_0 ),
        .CLR(rst),
        .D(freq_reg[0]),
        .Q(freq[0]));
  FDCE \freq_reg[10] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(\freq[23]_i_1_n_0 ),
        .CLR(rst),
        .D(freq_reg[10]),
        .Q(freq[10]));
  FDCE \freq_reg[11] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(\freq[23]_i_1_n_0 ),
        .CLR(rst),
        .D(freq_reg[11]),
        .Q(freq[11]));
  LUT6 #(
    .INIT(64'h0000200000FF0000)) 
    \freq_reg[11]_i_1 
       (.I0(rx_pending_reg_n_0),
        .I1(\byte_cnt_reg_n_0_[1] ),
        .I2(\byte_cnt_reg_n_0_[0] ),
        .I3(state[0]),
        .I4(state[2]),
        .I5(state[1]),
        .O(\freq_reg[11]_i_1_n_0 ));
  FDCE \freq_reg[12] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(\freq[23]_i_1_n_0 ),
        .CLR(rst),
        .D(freq_reg[12]),
        .Q(freq[12]));
  FDCE \freq_reg[13] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(\freq[23]_i_1_n_0 ),
        .CLR(rst),
        .D(freq_reg[13]),
        .Q(freq[13]));
  FDCE \freq_reg[14] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(\freq[23]_i_1_n_0 ),
        .CLR(rst),
        .D(freq_reg[14]),
        .Q(freq[14]));
  FDCE \freq_reg[15] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(\freq[23]_i_1_n_0 ),
        .CLR(rst),
        .D(freq_reg[15]),
        .Q(freq[15]));
  FDCE \freq_reg[16] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(\freq[23]_i_1_n_0 ),
        .CLR(rst),
        .D(freq_reg[16]),
        .Q(freq[16]));
  FDCE \freq_reg[17] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(\freq[23]_i_1_n_0 ),
        .CLR(rst),
        .D(freq_reg[17]),
        .Q(freq[17]));
  LUT6 #(
    .INIT(64'h0000200000FF0000)) 
    \freq_reg[17]_i_1 
       (.I0(rx_pending_reg_n_0),
        .I1(\byte_cnt_reg_n_0_[0] ),
        .I2(\byte_cnt_reg_n_0_[1] ),
        .I3(state[0]),
        .I4(state[2]),
        .I5(state[1]),
        .O(\freq_reg[17]_i_1_n_0 ));
  FDCE \freq_reg[18] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(\freq[23]_i_1_n_0 ),
        .CLR(rst),
        .D(freq_reg[18]),
        .Q(freq[18]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \freq_reg[18]_i_1 
       (.I0(\rx_data_latch_reg_n_0_[0] ),
        .I1(state[2]),
        .O(freq_reg0_in[18]));
  FDCE \freq_reg[19] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(\freq[23]_i_1_n_0 ),
        .CLR(rst),
        .D(freq_reg[19]),
        .Q(freq[19]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \freq_reg[19]_i_1 
       (.I0(\rx_data_latch_reg_n_0_[1] ),
        .I1(state[2]),
        .O(freq_reg0_in[19]));
  FDCE \freq_reg[1] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(\freq[23]_i_1_n_0 ),
        .CLR(rst),
        .D(freq_reg[1]),
        .Q(freq[1]));
  FDCE \freq_reg[20] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(\freq[23]_i_1_n_0 ),
        .CLR(rst),
        .D(freq_reg[20]),
        .Q(freq[20]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \freq_reg[20]_i_1 
       (.I0(\rx_data_latch_reg_n_0_[2] ),
        .I1(state[2]),
        .O(freq_reg0_in[20]));
  FDCE \freq_reg[21] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(\freq[23]_i_1_n_0 ),
        .CLR(rst),
        .D(freq_reg[21]),
        .Q(freq[21]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \freq_reg[21]_i_1 
       (.I0(\rx_data_latch_reg_n_0_[3] ),
        .I1(state[2]),
        .O(freq_reg0_in[21]));
  FDCE \freq_reg[22] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(\freq[23]_i_1_n_0 ),
        .CLR(rst),
        .D(freq_reg[22]),
        .Q(freq[22]));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \freq_reg[22]_i_1 
       (.I0(\rx_data_latch_reg_n_0_[4] ),
        .I1(state[2]),
        .O(freq_reg0_in[22]));
  FDCE \freq_reg[23] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(\freq[23]_i_1_n_0 ),
        .CLR(rst),
        .D(freq_reg[23]),
        .Q(freq[23]));
  LUT6 #(
    .INIT(64'h0000800000FF0000)) 
    \freq_reg[23]_i_1 
       (.I0(rx_pending_reg_n_0),
        .I1(\byte_cnt_reg_n_0_[0] ),
        .I2(\byte_cnt_reg_n_0_[1] ),
        .I3(state[0]),
        .I4(state[2]),
        .I5(state[1]),
        .O(\freq_reg[23]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \freq_reg[23]_i_2 
       (.I0(\rx_data_latch_reg_n_0_[5] ),
        .I1(state[2]),
        .O(freq_reg0_in[23]));
  FDCE \freq_reg[2] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(\freq[23]_i_1_n_0 ),
        .CLR(rst),
        .D(freq_reg[2]),
        .Q(freq[2]));
  FDCE \freq_reg[3] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(\freq[23]_i_1_n_0 ),
        .CLR(rst),
        .D(freq_reg[3]),
        .Q(freq[3]));
  FDCE \freq_reg[4] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(\freq[23]_i_1_n_0 ),
        .CLR(rst),
        .D(freq_reg[4]),
        .Q(freq[4]));
  FDCE \freq_reg[5] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(\freq[23]_i_1_n_0 ),
        .CLR(rst),
        .D(freq_reg[5]),
        .Q(freq[5]));
  LUT6 #(
    .INIT(64'h0000020000FF0000)) 
    \freq_reg[5]_i_1 
       (.I0(rx_pending_reg_n_0),
        .I1(\byte_cnt_reg_n_0_[0] ),
        .I2(\byte_cnt_reg_n_0_[1] ),
        .I3(state[0]),
        .I4(state[2]),
        .I5(state[1]),
        .O(\freq_reg[5]_i_1_n_0 ));
  FDCE \freq_reg[6] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(\freq[23]_i_1_n_0 ),
        .CLR(rst),
        .D(freq_reg[6]),
        .Q(freq[6]));
  FDCE \freq_reg[7] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(\freq[23]_i_1_n_0 ),
        .CLR(rst),
        .D(freq_reg[7]),
        .Q(freq[7]));
  FDCE \freq_reg[8] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(\freq[23]_i_1_n_0 ),
        .CLR(rst),
        .D(freq_reg[8]),
        .Q(freq[8]));
  FDCE \freq_reg[9] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(\freq[23]_i_1_n_0 ),
        .CLR(rst),
        .D(freq_reg[9]),
        .Q(freq[9]));
  FDCE \freq_reg_reg[0] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(\freq_reg[5]_i_1_n_0 ),
        .CLR(rst),
        .D(freq_reg0_in[18]),
        .Q(freq_reg[0]));
  FDCE \freq_reg_reg[10] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(\freq_reg[11]_i_1_n_0 ),
        .CLR(rst),
        .D(freq_reg0_in[22]),
        .Q(freq_reg[10]));
  FDCE \freq_reg_reg[11] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(\freq_reg[11]_i_1_n_0 ),
        .CLR(rst),
        .D(freq_reg0_in[23]),
        .Q(freq_reg[11]));
  FDCE \freq_reg_reg[12] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(\freq_reg[17]_i_1_n_0 ),
        .CLR(rst),
        .D(freq_reg0_in[18]),
        .Q(freq_reg[12]));
  FDCE \freq_reg_reg[13] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(\freq_reg[17]_i_1_n_0 ),
        .CLR(rst),
        .D(freq_reg0_in[19]),
        .Q(freq_reg[13]));
  FDCE \freq_reg_reg[14] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(\freq_reg[17]_i_1_n_0 ),
        .CLR(rst),
        .D(freq_reg0_in[20]),
        .Q(freq_reg[14]));
  FDCE \freq_reg_reg[15] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(\freq_reg[17]_i_1_n_0 ),
        .CLR(rst),
        .D(freq_reg0_in[21]),
        .Q(freq_reg[15]));
  FDCE \freq_reg_reg[16] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(\freq_reg[17]_i_1_n_0 ),
        .CLR(rst),
        .D(freq_reg0_in[22]),
        .Q(freq_reg[16]));
  FDCE \freq_reg_reg[17] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(\freq_reg[17]_i_1_n_0 ),
        .CLR(rst),
        .D(freq_reg0_in[23]),
        .Q(freq_reg[17]));
  FDCE \freq_reg_reg[18] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(\freq_reg[23]_i_1_n_0 ),
        .CLR(rst),
        .D(freq_reg0_in[18]),
        .Q(freq_reg[18]));
  FDCE \freq_reg_reg[19] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(\freq_reg[23]_i_1_n_0 ),
        .CLR(rst),
        .D(freq_reg0_in[19]),
        .Q(freq_reg[19]));
  FDCE \freq_reg_reg[1] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(\freq_reg[5]_i_1_n_0 ),
        .CLR(rst),
        .D(freq_reg0_in[19]),
        .Q(freq_reg[1]));
  FDCE \freq_reg_reg[20] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(\freq_reg[23]_i_1_n_0 ),
        .CLR(rst),
        .D(freq_reg0_in[20]),
        .Q(freq_reg[20]));
  FDCE \freq_reg_reg[21] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(\freq_reg[23]_i_1_n_0 ),
        .CLR(rst),
        .D(freq_reg0_in[21]),
        .Q(freq_reg[21]));
  FDCE \freq_reg_reg[22] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(\freq_reg[23]_i_1_n_0 ),
        .CLR(rst),
        .D(freq_reg0_in[22]),
        .Q(freq_reg[22]));
  FDCE \freq_reg_reg[23] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(\freq_reg[23]_i_1_n_0 ),
        .CLR(rst),
        .D(freq_reg0_in[23]),
        .Q(freq_reg[23]));
  FDCE \freq_reg_reg[2] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(\freq_reg[5]_i_1_n_0 ),
        .CLR(rst),
        .D(freq_reg0_in[20]),
        .Q(freq_reg[2]));
  FDCE \freq_reg_reg[3] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(\freq_reg[5]_i_1_n_0 ),
        .CLR(rst),
        .D(freq_reg0_in[21]),
        .Q(freq_reg[3]));
  FDCE \freq_reg_reg[4] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(\freq_reg[5]_i_1_n_0 ),
        .CLR(rst),
        .D(freq_reg0_in[22]),
        .Q(freq_reg[4]));
  FDCE \freq_reg_reg[5] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(\freq_reg[5]_i_1_n_0 ),
        .CLR(rst),
        .D(freq_reg0_in[23]),
        .Q(freq_reg[5]));
  FDCE \freq_reg_reg[6] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(\freq_reg[11]_i_1_n_0 ),
        .CLR(rst),
        .D(freq_reg0_in[18]),
        .Q(freq_reg[6]));
  FDCE \freq_reg_reg[7] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(\freq_reg[11]_i_1_n_0 ),
        .CLR(rst),
        .D(freq_reg0_in[19]),
        .Q(freq_reg[7]));
  FDCE \freq_reg_reg[8] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(\freq_reg[11]_i_1_n_0 ),
        .CLR(rst),
        .D(freq_reg0_in[20]),
        .Q(freq_reg[8]));
  FDCE \freq_reg_reg[9] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(\freq_reg[11]_i_1_n_0 ),
        .CLR(rst),
        .D(freq_reg0_in[21]),
        .Q(freq_reg[9]));
  FDCE \rx_data_latch_reg[0] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(E),
        .CLR(rst),
        .D(rx_data[0]),
        .Q(\rx_data_latch_reg_n_0_[0] ));
  FDCE \rx_data_latch_reg[1] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(E),
        .CLR(rst),
        .D(rx_data[1]),
        .Q(\rx_data_latch_reg_n_0_[1] ));
  FDCE \rx_data_latch_reg[2] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(E),
        .CLR(rst),
        .D(rx_data[2]),
        .Q(\rx_data_latch_reg_n_0_[2] ));
  FDCE \rx_data_latch_reg[3] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(E),
        .CLR(rst),
        .D(rx_data[3]),
        .Q(\rx_data_latch_reg_n_0_[3] ));
  FDCE \rx_data_latch_reg[4] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(E),
        .CLR(rst),
        .D(rx_data[4]),
        .Q(\rx_data_latch_reg_n_0_[4] ));
  FDCE \rx_data_latch_reg[5] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(E),
        .CLR(rst),
        .D(rx_data[5]),
        .Q(\rx_data_latch_reg_n_0_[5] ));
  FDCE \rx_data_latch_reg[6] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(E),
        .CLR(rst),
        .D(rx_data[6]),
        .Q(p_0_in[0]));
  FDCE \rx_data_latch_reg[7] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(E),
        .CLR(rst),
        .D(rx_data[7]),
        .Q(p_0_in[1]));
  LUT5 #(
    .INIT(32'h9BBF8AAA)) 
    rx_pending_i_1
       (.I0(rx_pending_reg_n_0),
        .I1(state[2]),
        .I2(state[1]),
        .I3(state[0]),
        .I4(E),
        .O(rx_pending_i_1_n_0));
  FDCE rx_pending_reg
       (.C(sys_clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(rst),
        .D(rx_pending_i_1_n_0),
        .Q(rx_pending_reg_n_0));
  FDCE \tx_data_reg[0] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(tx_start_i_1_n_0),
        .CLR(rst),
        .D(D[0]),
        .Q(Q[0]));
  FDCE \tx_data_reg[1] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(tx_start_i_1_n_0),
        .CLR(rst),
        .D(D[1]),
        .Q(Q[1]));
  FDCE \tx_data_reg[2] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(tx_start_i_1_n_0),
        .CLR(rst),
        .D(D[2]),
        .Q(Q[2]));
  FDCE \tx_data_reg[3] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(tx_start_i_1_n_0),
        .CLR(rst),
        .D(D[3]),
        .Q(Q[3]));
  FDCE \tx_data_reg[4] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(tx_start_i_1_n_0),
        .CLR(rst),
        .D(D[4]),
        .Q(Q[4]));
  FDCE \tx_data_reg[5] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(tx_start_i_1_n_0),
        .CLR(rst),
        .D(D[5]),
        .Q(Q[5]));
  FDCE \tx_data_reg[6] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(tx_start_i_1_n_0),
        .CLR(rst),
        .D(D[6]),
        .Q(Q[6]));
  FDCE \tx_data_reg[7] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(tx_start_i_1_n_0),
        .CLR(rst),
        .D(D[7]),
        .Q(Q[7]));
  LUT4 #(
    .INIT(16'h0010)) 
    tx_start_i_1
       (.I0(state[0]),
        .I1(state[2]),
        .I2(out),
        .I3(state[1]),
        .O(tx_start_i_1_n_0));
  FDCE tx_start_reg
       (.C(sys_clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(rst),
        .D(tx_start_i_1_n_0),
        .Q(tx_start));
endmodule

module urr_crc
   (rst,
    start_urr,
    cmd_urr,
    crc_result,
    crc_done,
    crc_running,
    crc_match,
    out,
    mem_reg,
    rst_n_IBUF,
    sys_clk_IBUF_BUFG,
    rst_n,
    tx_busy,
    start_crc,
    rx_valid,
    rx_data,
    rx_error,
    urr_error);
  output rst;
  output start_urr;
  output [7:0]cmd_urr;
  output [31:0]crc_result;
  output crc_done;
  output crc_running;
  output crc_match;
  input out;
  input mem_reg;
  input rst_n_IBUF;
  input sys_clk_IBUF_BUFG;
  input rst_n;
  input tx_busy;
  input start_crc;
  input rx_valid;
  input [7:0]rx_data;
  input rx_error;
  input urr_error;

  (* DONT_TOUCH *) wire [1:0]byte_cnt;
  wire \byte_cnt[0]_i_1_n_0 ;
  wire \byte_cnt[1]_i_1_n_0 ;
  wire \byte_cnt[1]_i_2_n_0 ;
  wire \byte_cnt[1]_i_3_n_0 ;
  (* DONT_TOUCH *) wire [1:0]byte_cnt_255;
  wire \byte_cnt_255[0]_i_1_n_0 ;
  wire \byte_cnt_255[1]_i_1_n_0 ;
  wire \byte_cnt_255[1]_i_2_n_0 ;
  wire \byte_cnt_255[1]_i_3_n_0 ;
  wire \byte_cnt_255[1]_i_4_n_0 ;
  (* DONT_TOUCH *) (* use_clock_enable = "false" *) wire [5:0]cmd_cnt;
  wire \cmd_cnt[0]_i_1_n_0 ;
  wire \cmd_cnt[0]_i_2_n_0 ;
  wire \cmd_cnt[0]_i_3_n_0 ;
  wire \cmd_cnt[0]_i_4_n_0 ;
  wire \cmd_cnt[1]_i_1_n_0 ;
  wire \cmd_cnt[1]_i_2_n_0 ;
  wire \cmd_cnt[1]_i_3_n_0 ;
  wire \cmd_cnt[2]_i_1_n_0 ;
  wire \cmd_cnt[3]_i_1_n_0 ;
  wire \cmd_cnt[4]_i_1_n_0 ;
  wire \cmd_cnt[5]_i_1_n_0 ;
  wire \cmd_cnt[5]_i_2_n_0 ;
  wire \cmd_cnt[5]_i_3_n_0 ;
  wire \cmd_cnt[5]_i_4_n_0 ;
  (* DONT_TOUCH *) wire [7:0]cmd_urr;
  wire \cmd_urr[7]_i_1_n_0 ;
  (* DONT_TOUCH *) wire crc_done;
  wire crc_done_i_1_n_0;
  (* DONT_TOUCH *) wire crc_match;
  wire crc_match0_carry__0_i_1_n_0;
  wire crc_match0_carry__0_i_2_n_0;
  wire crc_match0_carry__0_i_3_n_0;
  wire crc_match0_carry__0_i_4_n_0;
  wire crc_match0_carry__0_n_0;
  wire crc_match0_carry__1_i_1_n_0;
  wire crc_match0_carry__1_i_2_n_0;
  wire crc_match0_carry__1_i_3_n_0;
  wire crc_match0_carry__1_n_1;
  wire crc_match0_carry_i_1_n_0;
  wire crc_match0_carry_i_2_n_0;
  wire crc_match0_carry_i_3_n_0;
  wire crc_match0_carry_i_4_n_0;
  wire crc_match0_carry_n_0;
  wire crc_match_i_1_n_0;
  wire [24:8]crc_raw;
  (* DONT_TOUCH *) wire [31:0]crc_received;
  wire \crc_received[0]_i_1_n_0 ;
  wire \crc_received[10]_i_1_n_0 ;
  wire \crc_received[11]_i_1_n_0 ;
  wire \crc_received[12]_i_1_n_0 ;
  wire \crc_received[13]_i_1_n_0 ;
  wire \crc_received[14]_i_1_n_0 ;
  wire \crc_received[15]_i_1_n_0 ;
  wire \crc_received[15]_i_2_n_0 ;
  wire \crc_received[15]_i_3_n_0 ;
  wire \crc_received[16]_i_1_n_0 ;
  wire \crc_received[17]_i_1_n_0 ;
  wire \crc_received[18]_i_1_n_0 ;
  wire \crc_received[19]_i_1_n_0 ;
  wire \crc_received[1]_i_1_n_0 ;
  wire \crc_received[20]_i_1_n_0 ;
  wire \crc_received[21]_i_1_n_0 ;
  wire \crc_received[22]_i_1_n_0 ;
  wire \crc_received[23]_i_1_n_0 ;
  wire \crc_received[23]_i_2_n_0 ;
  wire \crc_received[23]_i_3_n_0 ;
  wire \crc_received[24]_i_1_n_0 ;
  wire \crc_received[25]_i_1_n_0 ;
  wire \crc_received[26]_i_1_n_0 ;
  wire \crc_received[27]_i_1_n_0 ;
  wire \crc_received[28]_i_1_n_0 ;
  wire \crc_received[29]_i_1_n_0 ;
  wire \crc_received[2]_i_1_n_0 ;
  wire \crc_received[30]_i_1_n_0 ;
  wire \crc_received[31]_i_1_n_0 ;
  wire \crc_received[31]_i_2_n_0 ;
  wire \crc_received[31]_i_3_n_0 ;
  wire \crc_received[31]_i_4_n_0 ;
  wire \crc_received[3]_i_1_n_0 ;
  wire \crc_received[4]_i_1_n_0 ;
  wire \crc_received[5]_i_1_n_0 ;
  wire \crc_received[6]_i_1_n_0 ;
  wire \crc_received[7]_i_1_n_0 ;
  wire \crc_received[7]_i_2_n_0 ;
  wire \crc_received[8]_i_1_n_0 ;
  wire \crc_received[9]_i_1_n_0 ;
  (* DONT_TOUCH *) wire [31:0]crc_reg;
  wire \crc_reg[0]_i_1_n_0 ;
  wire \crc_reg[10]_i_1_n_0 ;
  wire \crc_reg[11]_i_1_n_0 ;
  wire \crc_reg[12]_i_1_n_0 ;
  wire \crc_reg[13]_i_1_n_0 ;
  wire \crc_reg[14]_i_1_n_0 ;
  wire \crc_reg[15]_i_1_n_0 ;
  wire \crc_reg[16]_i_1_n_0 ;
  wire \crc_reg[17]_i_1_n_0 ;
  wire \crc_reg[18]_i_1_n_0 ;
  wire \crc_reg[19]_i_1_n_0 ;
  wire \crc_reg[19]_i_2_n_0 ;
  wire \crc_reg[19]_i_3_n_0 ;
  wire \crc_reg[1]_i_1_n_0 ;
  wire \crc_reg[20]_i_1_n_0 ;
  wire \crc_reg[21]_i_1_n_0 ;
  wire \crc_reg[22]_i_1_n_0 ;
  wire \crc_reg[23]_i_1_n_0 ;
  wire \crc_reg[24]_i_1_n_0 ;
  wire \crc_reg[25]_i_1_n_0 ;
  wire \crc_reg[26]_i_1_n_0 ;
  wire \crc_reg[27]_i_1_n_0 ;
  wire \crc_reg[28]_i_1_n_0 ;
  wire \crc_reg[29]_i_1_n_0 ;
  wire \crc_reg[2]_i_1_n_0 ;
  wire \crc_reg[30]_i_1_n_0 ;
  wire \crc_reg[30]_i_2_n_0 ;
  wire \crc_reg[31]_i_1_n_0 ;
  wire \crc_reg[31]_i_2_n_0 ;
  wire \crc_reg[31]_i_3_n_0 ;
  wire \crc_reg[3]_i_1_n_0 ;
  wire \crc_reg[4]_i_1_n_0 ;
  wire \crc_reg[5]_i_1_n_0 ;
  wire \crc_reg[6]_i_1_n_0 ;
  wire \crc_reg[7]_i_1_n_0 ;
  wire \crc_reg[8]_i_1_n_0 ;
  wire \crc_reg[9]_i_1_n_0 ;
  (* DONT_TOUCH *) wire [31:0]crc_result;
  wire \crc_result[31]_i_1_n_0 ;
  (* DONT_TOUCH *) wire crc_running;
  (* DONT_TOUCH *) wire crc_update_pending;
  wire crc_update_pending_i_1_n_0;
  wire crc_update_pending_i_2_n_0;
  (* DONT_TOUCH *) wire [7:0]fifo_count;
  (* DONT_TOUCH *) wire fifo_empty;
  (* DONT_TOUCH *) wire fifo_full;
  (* DONT_TOUCH *) wire [7:0]fifo_rd_data;
  (* DONT_TOUCH *) wire [7:0]fifo_rd_data_reg;
  wire \fifo_rd_data_reg[0]_i_1_n_0 ;
  wire \fifo_rd_data_reg[1]_i_1_n_0 ;
  wire \fifo_rd_data_reg[2]_i_1_n_0 ;
  wire \fifo_rd_data_reg[3]_i_1_n_0 ;
  wire \fifo_rd_data_reg[4]_i_1_n_0 ;
  wire \fifo_rd_data_reg[5]_i_1_n_0 ;
  wire \fifo_rd_data_reg[6]_i_1_n_0 ;
  wire \fifo_rd_data_reg[7]_i_1_n_0 ;
  (* DONT_TOUCH *) wire fifo_rd_en;
  (* DONT_TOUCH *) wire fifo_rd_en_st;
  wire fifo_rd_en_st_i_1_n_0;
  wire fifo_rd_en_st_i_2_n_0;
  (* DONT_TOUCH *) wire [7:0]fifo_wr_data;
  (* DONT_TOUCH *) wire fifo_wr_en;
  wire mem_reg;
  (* DONT_TOUCH *) (* RTL_KEEP = "true" *) (* fsm_encoding = "one_hot" *) 
  (* use_clock_enable = "false" *) wire [3:0]next_state;
  wire next_state_inferred_i_10_n_0;
  wire next_state_inferred_i_11_n_0;
  wire next_state_inferred_i_12_n_0;
  wire next_state_inferred_i_13_n_0;
  wire next_state_inferred_i_14_n_0;
  wire next_state_inferred_i_15_n_0;
  wire next_state_inferred_i_16_n_0;
  wire next_state_inferred_i_17_n_0;
  wire next_state_inferred_i_4_n_0;
  wire next_state_inferred_i_5_n_0;
  wire next_state_inferred_i_6_n_0;
  wire next_state_inferred_i_7_n_0;
  wire next_state_inferred_i_8_n_0;
  wire next_state_inferred_i_9_n_0;
  wire out;
  wire [31:0]p_0_in1_in;
  wire [7:0]p_1_in__0;
  (* DONT_TOUCH *) wire [7:0]read_cnt;
  wire \read_cnt[0]_i_1_n_0 ;
  wire \read_cnt[1]_i_1_n_0 ;
  wire \read_cnt[2]_i_1_n_0 ;
  wire \read_cnt[3]_i_1_n_0 ;
  wire \read_cnt[4]_i_1_n_0 ;
  wire \read_cnt[5]_i_1_n_0 ;
  wire \read_cnt[6]_i_1_n_0 ;
  wire \read_cnt[6]_i_2_n_0 ;
  wire \read_cnt[6]_i_3_n_0 ;
  wire \read_cnt[7]_i_1_n_0 ;
  wire \read_cnt[7]_i_2_n_0 ;
  wire \read_cnt[7]_i_3_n_0 ;
  wire \read_cnt[7]_i_4_n_0 ;
  wire rst;
  wire rst_n;
  wire rst_n_IBUF;
  (* DONT_TOUCH *) wire rx_error;
  (* DONT_TOUCH *) wire rx_valid;
  (* DONT_TOUCH *) wire [21:0]send_delay;
  wire \send_delay[0]_i_1_n_0 ;
  wire \send_delay[10]_i_1_n_0 ;
  wire \send_delay[11]_i_1_n_0 ;
  wire \send_delay[12]_i_1_n_0 ;
  wire \send_delay[13]_i_1_n_0 ;
  wire \send_delay[14]_i_1_n_0 ;
  wire \send_delay[15]_i_1_n_0 ;
  wire \send_delay[16]_i_1_n_0 ;
  wire \send_delay[17]_i_1_n_0 ;
  wire \send_delay[18]_i_1_n_0 ;
  wire \send_delay[19]_i_1_n_0 ;
  wire \send_delay[1]_i_1_n_0 ;
  wire \send_delay[20]_i_1_n_0 ;
  wire \send_delay[21]_i_1_n_0 ;
  wire \send_delay[21]_i_2_n_0 ;
  wire \send_delay[21]_i_3_n_0 ;
  wire \send_delay[2]_i_1_n_0 ;
  wire \send_delay[3]_i_1_n_0 ;
  wire \send_delay[4]_i_1_n_0 ;
  wire \send_delay[5]_i_1_n_0 ;
  wire \send_delay[6]_i_1_n_0 ;
  wire \send_delay[7]_i_1_n_0 ;
  wire \send_delay[8]_i_1_n_0 ;
  wire \send_delay[9]_i_1_n_0 ;
  (* DONT_TOUCH *) wire start_crc;
  (* DONT_TOUCH *) wire start_urr;
  wire start_urr_i_1_n_0;
  (* DONT_TOUCH *) (* RTL_KEEP = "true" *) (* fsm_encoding = "one_hot" *) 
  (* use_clock_enable = "false" *) wire [3:0]state;
  wire sys_clk_IBUF_BUFG;
  (* DONT_TOUCH *) wire tx_busy;
  wire u_crc_wrap_n_10;
  wire u_crc_wrap_n_11;
  wire u_crc_wrap_n_12;
  wire u_crc_wrap_n_13;
  wire u_crc_wrap_n_14;
  wire u_crc_wrap_n_15;
  wire u_crc_wrap_n_16;
  wire u_crc_wrap_n_18;
  wire u_crc_wrap_n_19;
  wire u_crc_wrap_n_20;
  wire u_crc_wrap_n_21;
  wire u_crc_wrap_n_22;
  wire u_crc_wrap_n_23;
  wire u_crc_wrap_n_24;
  wire u_crc_wrap_n_25;
  wire u_crc_wrap_n_5;
  wire u_crc_wrap_n_6;
  wire u_crc_wrap_n_7;
  wire u_crc_wrap_n_8;
  wire u_crc_wrap_n_9;
  (* DONT_TOUCH *) wire urr_error;
  wire [2:0]NLW_crc_match0_carry_CO_UNCONNECTED;
  wire [3:0]NLW_crc_match0_carry_O_UNCONNECTED;
  wire [2:0]NLW_crc_match0_carry__0_CO_UNCONNECTED;
  wire [3:0]NLW_crc_match0_carry__0_O_UNCONNECTED;
  wire [3:0]NLW_crc_match0_carry__1_CO_UNCONNECTED;
  wire [3:0]NLW_crc_match0_carry__1_O_UNCONNECTED;

  assign fifo_wr_data = rx_data[7:0];
  LUT5 #(
    .INIT(32'hFF200020)) 
    \byte_cnt[0]_i_1 
       (.I0(state[1]),
        .I1(state[2]),
        .I2(rx_valid),
        .I3(byte_cnt[0]),
        .I4(\byte_cnt[1]_i_3_n_0 ),
        .O(\byte_cnt[0]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h0093)) 
    \byte_cnt[1]_i_1 
       (.I0(state[1]),
        .I1(state[2]),
        .I2(state[0]),
        .I3(state[3]),
        .O(\byte_cnt[1]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFF080005000800)) 
    \byte_cnt[1]_i_2 
       (.I0(byte_cnt[0]),
        .I1(rx_valid),
        .I2(state[2]),
        .I3(state[1]),
        .I4(byte_cnt[1]),
        .I5(\byte_cnt[1]_i_3_n_0 ),
        .O(\byte_cnt[1]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h0074004400740077)) 
    \byte_cnt[1]_i_3 
       (.I0(rx_valid),
        .I1(state[1]),
        .I2(tx_busy),
        .I3(state[2]),
        .I4(state[0]),
        .I5(start_crc),
        .O(\byte_cnt[1]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hFCBCA0A0A0A0A0A0)) 
    \byte_cnt_255[0]_i_1 
       (.I0(\byte_cnt_255[1]_i_4_n_0 ),
        .I1(rx_valid),
        .I2(byte_cnt_255[0]),
        .I3(byte_cnt_255[1]),
        .I4(state[0]),
        .I5(\byte_cnt_255[1]_i_3_n_0 ),
        .O(\byte_cnt_255[0]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h3101)) 
    \byte_cnt_255[1]_i_1 
       (.I0(state[1]),
        .I1(state[3]),
        .I2(state[0]),
        .I3(state[2]),
        .O(\byte_cnt_255[1]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFF8000AA008000)) 
    \byte_cnt_255[1]_i_2 
       (.I0(state[0]),
        .I1(byte_cnt_255[0]),
        .I2(rx_valid),
        .I3(\byte_cnt_255[1]_i_3_n_0 ),
        .I4(byte_cnt_255[1]),
        .I5(\byte_cnt_255[1]_i_4_n_0 ),
        .O(\byte_cnt_255[1]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \byte_cnt_255[1]_i_3 
       (.I0(state[2]),
        .I1(state[1]),
        .O(\byte_cnt_255[1]_i_3_n_0 ));
  LUT5 #(
    .INIT(32'h03050005)) 
    \byte_cnt_255[1]_i_4 
       (.I0(start_crc),
        .I1(state[0]),
        .I2(state[1]),
        .I3(state[2]),
        .I4(tx_busy),
        .O(\byte_cnt_255[1]_i_4_n_0 ));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  FDCE \byte_cnt_255_reg[0] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(\byte_cnt_255[1]_i_1_n_0 ),
        .CLR(rst),
        .D(\byte_cnt_255[0]_i_1_n_0 ),
        .Q(byte_cnt_255[0]));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  FDCE \byte_cnt_255_reg[1] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(\byte_cnt_255[1]_i_1_n_0 ),
        .CLR(rst),
        .D(\byte_cnt_255[1]_i_2_n_0 ),
        .Q(byte_cnt_255[1]));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  FDCE \byte_cnt_reg[0] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(\byte_cnt[1]_i_1_n_0 ),
        .CLR(rst),
        .D(\byte_cnt[0]_i_1_n_0 ),
        .Q(byte_cnt[0]));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  FDCE \byte_cnt_reg[1] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(\byte_cnt[1]_i_1_n_0 ),
        .CLR(rst),
        .D(\byte_cnt[1]_i_2_n_0 ),
        .Q(byte_cnt[1]));
  LUT4 #(
    .INIT(16'h78FF)) 
    \cmd_cnt[0]_i_1 
       (.I0(\cmd_cnt[0]_i_2_n_0 ),
        .I1(\cmd_cnt[0]_i_3_n_0 ),
        .I2(cmd_cnt[0]),
        .I3(\cmd_cnt[5]_i_2_n_0 ),
        .O(\cmd_cnt[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h1000000000000000)) 
    \cmd_cnt[0]_i_2 
       (.I0(state[0]),
        .I1(state[3]),
        .I2(\cmd_cnt[0]_i_4_n_0 ),
        .I3(byte_cnt[0]),
        .I4(byte_cnt[1]),
        .I5(rx_valid),
        .O(\cmd_cnt[0]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'h01FFFFFF)) 
    \cmd_cnt[0]_i_3 
       (.I0(cmd_cnt[1]),
        .I1(cmd_cnt[2]),
        .I2(cmd_cnt[3]),
        .I3(cmd_cnt[5]),
        .I4(cmd_cnt[4]),
        .O(\cmd_cnt[0]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \cmd_cnt[0]_i_4 
       (.I0(state[1]),
        .I1(state[2]),
        .O(\cmd_cnt[0]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h28882888288828A8)) 
    \cmd_cnt[1]_i_1 
       (.I0(\cmd_cnt[5]_i_2_n_0 ),
        .I1(cmd_cnt[1]),
        .I2(\cmd_cnt[1]_i_2_n_0 ),
        .I3(\cmd_cnt[1]_i_3_n_0 ),
        .I4(cmd_cnt[3]),
        .I5(cmd_cnt[2]),
        .O(\cmd_cnt[1]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000001000000000)) 
    \cmd_cnt[1]_i_2 
       (.I0(next_state_inferred_i_15_n_0),
        .I1(state[2]),
        .I2(state[1]),
        .I3(state[3]),
        .I4(state[0]),
        .I5(cmd_cnt[0]),
        .O(\cmd_cnt[1]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h7)) 
    \cmd_cnt[1]_i_3 
       (.I0(cmd_cnt[4]),
        .I1(cmd_cnt[5]),
        .O(\cmd_cnt[1]_i_3_n_0 ));
  LUT5 #(
    .INIT(32'h88282828)) 
    \cmd_cnt[2]_i_1 
       (.I0(\cmd_cnt[5]_i_2_n_0 ),
        .I1(cmd_cnt[2]),
        .I2(\cmd_cnt[5]_i_3_n_0 ),
        .I3(cmd_cnt[5]),
        .I4(cmd_cnt[4]),
        .O(\cmd_cnt[2]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h8828282888888888)) 
    \cmd_cnt[3]_i_1 
       (.I0(\cmd_cnt[5]_i_2_n_0 ),
        .I1(cmd_cnt[3]),
        .I2(cmd_cnt[2]),
        .I3(cmd_cnt[4]),
        .I4(cmd_cnt[5]),
        .I5(\cmd_cnt[5]_i_3_n_0 ),
        .O(\cmd_cnt[3]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hA288888888888888)) 
    \cmd_cnt[4]_i_1 
       (.I0(\cmd_cnt[5]_i_2_n_0 ),
        .I1(cmd_cnt[4]),
        .I2(cmd_cnt[5]),
        .I3(cmd_cnt[2]),
        .I4(cmd_cnt[3]),
        .I5(\cmd_cnt[5]_i_3_n_0 ),
        .O(\cmd_cnt[4]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hA888888888888888)) 
    \cmd_cnt[5]_i_1 
       (.I0(\cmd_cnt[5]_i_2_n_0 ),
        .I1(cmd_cnt[5]),
        .I2(cmd_cnt[4]),
        .I3(cmd_cnt[2]),
        .I4(cmd_cnt[3]),
        .I5(\cmd_cnt[5]_i_3_n_0 ),
        .O(\cmd_cnt[5]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hFF7E)) 
    \cmd_cnt[5]_i_2 
       (.I0(state[1]),
        .I1(state[0]),
        .I2(state[2]),
        .I3(state[3]),
        .O(\cmd_cnt[5]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h8000000000000000)) 
    \cmd_cnt[5]_i_3 
       (.I0(cmd_cnt[0]),
        .I1(\cmd_cnt[5]_i_4_n_0 ),
        .I2(byte_cnt[0]),
        .I3(byte_cnt[1]),
        .I4(rx_valid),
        .I5(cmd_cnt[1]),
        .O(\cmd_cnt[5]_i_3_n_0 ));
  LUT4 #(
    .INIT(16'h0004)) 
    \cmd_cnt[5]_i_4 
       (.I0(state[2]),
        .I1(state[1]),
        .I2(state[3]),
        .I3(state[0]),
        .O(\cmd_cnt[5]_i_4_n_0 ));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  (* use_clock_enable = "false" *) 
  FDPE \cmd_cnt_reg[0] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\cmd_cnt[0]_i_1_n_0 ),
        .PRE(rst),
        .Q(cmd_cnt[0]));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  (* use_clock_enable = "false" *) 
  FDCE \cmd_cnt_reg[1] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(rst),
        .D(\cmd_cnt[1]_i_1_n_0 ),
        .Q(cmd_cnt[1]));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  (* use_clock_enable = "false" *) 
  FDCE \cmd_cnt_reg[2] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(rst),
        .D(\cmd_cnt[2]_i_1_n_0 ),
        .Q(cmd_cnt[2]));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  (* use_clock_enable = "false" *) 
  FDCE \cmd_cnt_reg[3] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(rst),
        .D(\cmd_cnt[3]_i_1_n_0 ),
        .Q(cmd_cnt[3]));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  (* use_clock_enable = "false" *) 
  FDCE \cmd_cnt_reg[4] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(rst),
        .D(\cmd_cnt[4]_i_1_n_0 ),
        .Q(cmd_cnt[4]));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  (* use_clock_enable = "false" *) 
  FDCE \cmd_cnt_reg[5] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(rst),
        .D(\cmd_cnt[5]_i_1_n_0 ),
        .Q(cmd_cnt[5]));
  LUT4 #(
    .INIT(16'hFD0D)) 
    \cmd_urr[0]_i_1 
       (.I0(state[0]),
        .I1(cmd_cnt[0]),
        .I2(tx_busy),
        .I3(cmd_urr[0]),
        .O(p_1_in__0[0]));
  LUT4 #(
    .INIT(16'hFD0D)) 
    \cmd_urr[1]_i_1 
       (.I0(state[0]),
        .I1(cmd_cnt[1]),
        .I2(tx_busy),
        .I3(cmd_urr[1]),
        .O(p_1_in__0[1]));
  LUT4 #(
    .INIT(16'hFD0D)) 
    \cmd_urr[2]_i_1 
       (.I0(state[0]),
        .I1(cmd_cnt[2]),
        .I2(tx_busy),
        .I3(cmd_urr[2]),
        .O(p_1_in__0[2]));
  LUT4 #(
    .INIT(16'hFD0D)) 
    \cmd_urr[3]_i_1 
       (.I0(state[0]),
        .I1(cmd_cnt[3]),
        .I2(tx_busy),
        .I3(cmd_urr[3]),
        .O(p_1_in__0[3]));
  LUT4 #(
    .INIT(16'hFD0D)) 
    \cmd_urr[4]_i_1 
       (.I0(state[0]),
        .I1(cmd_cnt[4]),
        .I2(tx_busy),
        .I3(cmd_urr[4]),
        .O(p_1_in__0[4]));
  LUT4 #(
    .INIT(16'hFD0D)) 
    \cmd_urr[5]_i_1 
       (.I0(state[0]),
        .I1(cmd_cnt[5]),
        .I2(tx_busy),
        .I3(cmd_urr[5]),
        .O(p_1_in__0[5]));
  LUT3 #(
    .INIT(8'h8B)) 
    \cmd_urr[6]_i_1 
       (.I0(cmd_urr[6]),
        .I1(tx_busy),
        .I2(state[0]),
        .O(p_1_in__0[6]));
  LUT4 #(
    .INIT(16'h0110)) 
    \cmd_urr[7]_i_1 
       (.I0(state[3]),
        .I1(state[1]),
        .I2(state[2]),
        .I3(state[0]),
        .O(\cmd_urr[7]_i_1_n_0 ));
  LUT3 #(
    .INIT(8'h8B)) 
    \cmd_urr[7]_i_2 
       (.I0(cmd_urr[7]),
        .I1(tx_busy),
        .I2(state[0]),
        .O(p_1_in__0[7]));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  FDCE \cmd_urr_reg[0] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(\cmd_urr[7]_i_1_n_0 ),
        .CLR(rst),
        .D(p_1_in__0[0]),
        .Q(cmd_urr[0]));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  FDCE \cmd_urr_reg[1] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(\cmd_urr[7]_i_1_n_0 ),
        .CLR(rst),
        .D(p_1_in__0[1]),
        .Q(cmd_urr[1]));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  FDCE \cmd_urr_reg[2] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(\cmd_urr[7]_i_1_n_0 ),
        .CLR(rst),
        .D(p_1_in__0[2]),
        .Q(cmd_urr[2]));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  FDCE \cmd_urr_reg[3] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(\cmd_urr[7]_i_1_n_0 ),
        .CLR(rst),
        .D(p_1_in__0[3]),
        .Q(cmd_urr[3]));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  FDCE \cmd_urr_reg[4] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(\cmd_urr[7]_i_1_n_0 ),
        .CLR(rst),
        .D(p_1_in__0[4]),
        .Q(cmd_urr[4]));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  FDCE \cmd_urr_reg[5] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(\cmd_urr[7]_i_1_n_0 ),
        .CLR(rst),
        .D(p_1_in__0[5]),
        .Q(cmd_urr[5]));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  FDCE \cmd_urr_reg[6] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(\cmd_urr[7]_i_1_n_0 ),
        .CLR(rst),
        .D(p_1_in__0[6]),
        .Q(cmd_urr[6]));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  FDCE \cmd_urr_reg[7] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(\cmd_urr[7]_i_1_n_0 ),
        .CLR(rst),
        .D(p_1_in__0[7]),
        .Q(cmd_urr[7]));
  LUT4 #(
    .INIT(16'h4000)) 
    crc_done_i_1
       (.I0(state[3]),
        .I1(state[2]),
        .I2(state[1]),
        .I3(state[0]),
        .O(crc_done_i_1_n_0));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  FDCE crc_done_reg
       (.C(sys_clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(rst),
        .D(crc_done_i_1_n_0),
        .Q(crc_done));
  CARRY4 crc_match0_carry
       (.CI(1'b0),
        .CO({crc_match0_carry_n_0,NLW_crc_match0_carry_CO_UNCONNECTED[2:0]}),
        .CYINIT(1'b1),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(NLW_crc_match0_carry_O_UNCONNECTED[3:0]),
        .S({crc_match0_carry_i_1_n_0,crc_match0_carry_i_2_n_0,crc_match0_carry_i_3_n_0,crc_match0_carry_i_4_n_0}));
  CARRY4 crc_match0_carry__0
       (.CI(crc_match0_carry_n_0),
        .CO({crc_match0_carry__0_n_0,NLW_crc_match0_carry__0_CO_UNCONNECTED[2:0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(NLW_crc_match0_carry__0_O_UNCONNECTED[3:0]),
        .S({crc_match0_carry__0_i_1_n_0,crc_match0_carry__0_i_2_n_0,crc_match0_carry__0_i_3_n_0,crc_match0_carry__0_i_4_n_0}));
  LUT6 #(
    .INIT(64'h0000066006600000)) 
    crc_match0_carry__0_i_1
       (.I0(crc_received[23]),
        .I1(crc_reg[23]),
        .I2(crc_received[22]),
        .I3(crc_reg[22]),
        .I4(crc_reg[21]),
        .I5(crc_received[21]),
        .O(crc_match0_carry__0_i_1_n_0));
  LUT6 #(
    .INIT(64'h0000066006600000)) 
    crc_match0_carry__0_i_2
       (.I0(crc_received[20]),
        .I1(crc_reg[20]),
        .I2(crc_received[19]),
        .I3(crc_reg[19]),
        .I4(crc_reg[18]),
        .I5(crc_received[18]),
        .O(crc_match0_carry__0_i_2_n_0));
  LUT6 #(
    .INIT(64'h0000066006600000)) 
    crc_match0_carry__0_i_3
       (.I0(crc_received[17]),
        .I1(crc_reg[17]),
        .I2(crc_received[16]),
        .I3(crc_reg[16]),
        .I4(crc_reg[15]),
        .I5(crc_received[15]),
        .O(crc_match0_carry__0_i_3_n_0));
  LUT6 #(
    .INIT(64'h0000066006600000)) 
    crc_match0_carry__0_i_4
       (.I0(crc_received[14]),
        .I1(crc_reg[14]),
        .I2(crc_received[13]),
        .I3(crc_reg[13]),
        .I4(crc_reg[12]),
        .I5(crc_received[12]),
        .O(crc_match0_carry__0_i_4_n_0));
  CARRY4 crc_match0_carry__1
       (.CI(crc_match0_carry__0_n_0),
        .CO({NLW_crc_match0_carry__1_CO_UNCONNECTED[3],crc_match0_carry__1_n_1,NLW_crc_match0_carry__1_CO_UNCONNECTED[1:0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(NLW_crc_match0_carry__1_O_UNCONNECTED[3:0]),
        .S({1'b0,crc_match0_carry__1_i_1_n_0,crc_match0_carry__1_i_2_n_0,crc_match0_carry__1_i_3_n_0}));
  LUT4 #(
    .INIT(16'h0660)) 
    crc_match0_carry__1_i_1
       (.I0(crc_reg[30]),
        .I1(crc_received[30]),
        .I2(crc_reg[31]),
        .I3(crc_received[31]),
        .O(crc_match0_carry__1_i_1_n_0));
  LUT6 #(
    .INIT(64'h0000066006600000)) 
    crc_match0_carry__1_i_2
       (.I0(crc_received[29]),
        .I1(crc_reg[29]),
        .I2(crc_received[28]),
        .I3(crc_reg[28]),
        .I4(crc_reg[27]),
        .I5(crc_received[27]),
        .O(crc_match0_carry__1_i_2_n_0));
  LUT6 #(
    .INIT(64'h0000066006600000)) 
    crc_match0_carry__1_i_3
       (.I0(crc_received[26]),
        .I1(crc_reg[26]),
        .I2(crc_received[25]),
        .I3(crc_reg[25]),
        .I4(crc_reg[24]),
        .I5(crc_received[24]),
        .O(crc_match0_carry__1_i_3_n_0));
  LUT6 #(
    .INIT(64'h0000066006600000)) 
    crc_match0_carry_i_1
       (.I0(crc_received[11]),
        .I1(crc_reg[11]),
        .I2(crc_received[10]),
        .I3(crc_reg[10]),
        .I4(crc_reg[9]),
        .I5(crc_received[9]),
        .O(crc_match0_carry_i_1_n_0));
  LUT6 #(
    .INIT(64'h0000066006600000)) 
    crc_match0_carry_i_2
       (.I0(crc_received[8]),
        .I1(crc_reg[8]),
        .I2(crc_received[7]),
        .I3(crc_reg[7]),
        .I4(crc_reg[6]),
        .I5(crc_received[6]),
        .O(crc_match0_carry_i_2_n_0));
  LUT6 #(
    .INIT(64'h0000066006600000)) 
    crc_match0_carry_i_3
       (.I0(crc_received[5]),
        .I1(crc_reg[5]),
        .I2(crc_received[4]),
        .I3(crc_reg[4]),
        .I4(crc_reg[3]),
        .I5(crc_received[3]),
        .O(crc_match0_carry_i_3_n_0));
  LUT6 #(
    .INIT(64'h0000066006600000)) 
    crc_match0_carry_i_4
       (.I0(crc_received[2]),
        .I1(crc_reg[2]),
        .I2(crc_received[1]),
        .I3(crc_reg[1]),
        .I4(crc_reg[0]),
        .I5(crc_received[0]),
        .O(crc_match0_carry_i_4_n_0));
  LUT5 #(
    .INIT(32'h00000080)) 
    crc_match_i_1
       (.I0(state[1]),
        .I1(crc_match0_carry__1_n_1),
        .I2(state[2]),
        .I3(state[0]),
        .I4(state[3]),
        .O(crc_match_i_1_n_0));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  FDCE crc_match_reg
       (.C(sys_clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(rst),
        .D(crc_match_i_1_n_0),
        .Q(crc_match));
  LUT4 #(
    .INIT(16'hF888)) 
    \crc_received[0]_i_1 
       (.I0(crc_received[0]),
        .I1(\crc_received[7]_i_2_n_0 ),
        .I2(fifo_wr_data[0]),
        .I3(next_state_inferred_i_8_n_0),
        .O(\crc_received[0]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hF888)) 
    \crc_received[10]_i_1 
       (.I0(crc_received[10]),
        .I1(\crc_received[15]_i_2_n_0 ),
        .I2(fifo_wr_data[2]),
        .I3(\crc_received[15]_i_3_n_0 ),
        .O(\crc_received[10]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hF888)) 
    \crc_received[11]_i_1 
       (.I0(crc_received[11]),
        .I1(\crc_received[15]_i_2_n_0 ),
        .I2(fifo_wr_data[3]),
        .I3(\crc_received[15]_i_3_n_0 ),
        .O(\crc_received[11]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hF888)) 
    \crc_received[12]_i_1 
       (.I0(crc_received[12]),
        .I1(\crc_received[15]_i_2_n_0 ),
        .I2(fifo_wr_data[4]),
        .I3(\crc_received[15]_i_3_n_0 ),
        .O(\crc_received[12]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hF888)) 
    \crc_received[13]_i_1 
       (.I0(crc_received[13]),
        .I1(\crc_received[15]_i_2_n_0 ),
        .I2(fifo_wr_data[5]),
        .I3(\crc_received[15]_i_3_n_0 ),
        .O(\crc_received[13]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hF888)) 
    \crc_received[14]_i_1 
       (.I0(crc_received[14]),
        .I1(\crc_received[15]_i_2_n_0 ),
        .I2(fifo_wr_data[6]),
        .I3(\crc_received[15]_i_3_n_0 ),
        .O(\crc_received[14]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hF888)) 
    \crc_received[15]_i_1 
       (.I0(crc_received[15]),
        .I1(\crc_received[15]_i_2_n_0 ),
        .I2(fifo_wr_data[7]),
        .I3(\crc_received[15]_i_3_n_0 ),
        .O(\crc_received[15]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hB0BFF0FF)) 
    \crc_received[15]_i_2 
       (.I0(byte_cnt_255[0]),
        .I1(rx_valid),
        .I2(state[0]),
        .I3(start_crc),
        .I4(byte_cnt_255[1]),
        .O(\crc_received[15]_i_2_n_0 ));
  LUT4 #(
    .INIT(16'h4000)) 
    \crc_received[15]_i_3 
       (.I0(byte_cnt_255[0]),
        .I1(state[0]),
        .I2(rx_valid),
        .I3(byte_cnt_255[1]),
        .O(\crc_received[15]_i_3_n_0 ));
  LUT4 #(
    .INIT(16'hF888)) 
    \crc_received[16]_i_1 
       (.I0(crc_received[16]),
        .I1(\crc_received[23]_i_2_n_0 ),
        .I2(fifo_wr_data[0]),
        .I3(\crc_received[23]_i_3_n_0 ),
        .O(\crc_received[16]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hF888)) 
    \crc_received[17]_i_1 
       (.I0(crc_received[17]),
        .I1(\crc_received[23]_i_2_n_0 ),
        .I2(fifo_wr_data[1]),
        .I3(\crc_received[23]_i_3_n_0 ),
        .O(\crc_received[17]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hF888)) 
    \crc_received[18]_i_1 
       (.I0(crc_received[18]),
        .I1(\crc_received[23]_i_2_n_0 ),
        .I2(fifo_wr_data[2]),
        .I3(\crc_received[23]_i_3_n_0 ),
        .O(\crc_received[18]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hF888)) 
    \crc_received[19]_i_1 
       (.I0(crc_received[19]),
        .I1(\crc_received[23]_i_2_n_0 ),
        .I2(fifo_wr_data[3]),
        .I3(\crc_received[23]_i_3_n_0 ),
        .O(\crc_received[19]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hF888)) 
    \crc_received[1]_i_1 
       (.I0(crc_received[1]),
        .I1(\crc_received[7]_i_2_n_0 ),
        .I2(fifo_wr_data[1]),
        .I3(next_state_inferred_i_8_n_0),
        .O(\crc_received[1]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hF888)) 
    \crc_received[20]_i_1 
       (.I0(crc_received[20]),
        .I1(\crc_received[23]_i_2_n_0 ),
        .I2(fifo_wr_data[4]),
        .I3(\crc_received[23]_i_3_n_0 ),
        .O(\crc_received[20]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hF888)) 
    \crc_received[21]_i_1 
       (.I0(crc_received[21]),
        .I1(\crc_received[23]_i_2_n_0 ),
        .I2(fifo_wr_data[5]),
        .I3(\crc_received[23]_i_3_n_0 ),
        .O(\crc_received[21]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hF888)) 
    \crc_received[22]_i_1 
       (.I0(crc_received[22]),
        .I1(\crc_received[23]_i_2_n_0 ),
        .I2(fifo_wr_data[6]),
        .I3(\crc_received[23]_i_3_n_0 ),
        .O(\crc_received[22]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hF888)) 
    \crc_received[23]_i_1 
       (.I0(crc_received[23]),
        .I1(\crc_received[23]_i_2_n_0 ),
        .I2(fifo_wr_data[7]),
        .I3(\crc_received[23]_i_3_n_0 ),
        .O(\crc_received[23]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hF0FF707F)) 
    \crc_received[23]_i_2 
       (.I0(byte_cnt_255[0]),
        .I1(rx_valid),
        .I2(state[0]),
        .I3(start_crc),
        .I4(byte_cnt_255[1]),
        .O(\crc_received[23]_i_2_n_0 ));
  LUT4 #(
    .INIT(16'h4000)) 
    \crc_received[23]_i_3 
       (.I0(byte_cnt_255[1]),
        .I1(rx_valid),
        .I2(byte_cnt_255[0]),
        .I3(state[0]),
        .O(\crc_received[23]_i_3_n_0 ));
  LUT4 #(
    .INIT(16'hF888)) 
    \crc_received[24]_i_1 
       (.I0(crc_received[24]),
        .I1(\crc_received[31]_i_3_n_0 ),
        .I2(fifo_wr_data[0]),
        .I3(\crc_received[31]_i_4_n_0 ),
        .O(\crc_received[24]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hF888)) 
    \crc_received[25]_i_1 
       (.I0(crc_received[25]),
        .I1(\crc_received[31]_i_3_n_0 ),
        .I2(fifo_wr_data[1]),
        .I3(\crc_received[31]_i_4_n_0 ),
        .O(\crc_received[25]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hF888)) 
    \crc_received[26]_i_1 
       (.I0(crc_received[26]),
        .I1(\crc_received[31]_i_3_n_0 ),
        .I2(fifo_wr_data[2]),
        .I3(\crc_received[31]_i_4_n_0 ),
        .O(\crc_received[26]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hF888)) 
    \crc_received[27]_i_1 
       (.I0(crc_received[27]),
        .I1(\crc_received[31]_i_3_n_0 ),
        .I2(fifo_wr_data[3]),
        .I3(\crc_received[31]_i_4_n_0 ),
        .O(\crc_received[27]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hF888)) 
    \crc_received[28]_i_1 
       (.I0(crc_received[28]),
        .I1(\crc_received[31]_i_3_n_0 ),
        .I2(fifo_wr_data[4]),
        .I3(\crc_received[31]_i_4_n_0 ),
        .O(\crc_received[28]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hF888)) 
    \crc_received[29]_i_1 
       (.I0(crc_received[29]),
        .I1(\crc_received[31]_i_3_n_0 ),
        .I2(fifo_wr_data[5]),
        .I3(\crc_received[31]_i_4_n_0 ),
        .O(\crc_received[29]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hF888)) 
    \crc_received[2]_i_1 
       (.I0(crc_received[2]),
        .I1(\crc_received[7]_i_2_n_0 ),
        .I2(fifo_wr_data[2]),
        .I3(next_state_inferred_i_8_n_0),
        .O(\crc_received[2]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hF888)) 
    \crc_received[30]_i_1 
       (.I0(crc_received[30]),
        .I1(\crc_received[31]_i_3_n_0 ),
        .I2(fifo_wr_data[6]),
        .I3(\crc_received[31]_i_4_n_0 ),
        .O(\crc_received[30]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h1001)) 
    \crc_received[31]_i_1 
       (.I0(state[3]),
        .I1(state[1]),
        .I2(state[2]),
        .I3(state[0]),
        .O(\crc_received[31]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hF888)) 
    \crc_received[31]_i_2 
       (.I0(crc_received[31]),
        .I1(\crc_received[31]_i_3_n_0 ),
        .I2(fifo_wr_data[7]),
        .I3(\crc_received[31]_i_4_n_0 ),
        .O(\crc_received[31]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hF0FFB0BF)) 
    \crc_received[31]_i_3 
       (.I0(byte_cnt_255[0]),
        .I1(rx_valid),
        .I2(state[0]),
        .I3(start_crc),
        .I4(byte_cnt_255[1]),
        .O(\crc_received[31]_i_3_n_0 ));
  LUT4 #(
    .INIT(16'h0400)) 
    \crc_received[31]_i_4 
       (.I0(byte_cnt_255[1]),
        .I1(rx_valid),
        .I2(byte_cnt_255[0]),
        .I3(state[0]),
        .O(\crc_received[31]_i_4_n_0 ));
  LUT4 #(
    .INIT(16'hF888)) 
    \crc_received[3]_i_1 
       (.I0(crc_received[3]),
        .I1(\crc_received[7]_i_2_n_0 ),
        .I2(fifo_wr_data[3]),
        .I3(next_state_inferred_i_8_n_0),
        .O(\crc_received[3]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hF888)) 
    \crc_received[4]_i_1 
       (.I0(crc_received[4]),
        .I1(\crc_received[7]_i_2_n_0 ),
        .I2(fifo_wr_data[4]),
        .I3(next_state_inferred_i_8_n_0),
        .O(\crc_received[4]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hF888)) 
    \crc_received[5]_i_1 
       (.I0(crc_received[5]),
        .I1(\crc_received[7]_i_2_n_0 ),
        .I2(fifo_wr_data[5]),
        .I3(next_state_inferred_i_8_n_0),
        .O(\crc_received[5]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hF888)) 
    \crc_received[6]_i_1 
       (.I0(crc_received[6]),
        .I1(\crc_received[7]_i_2_n_0 ),
        .I2(fifo_wr_data[6]),
        .I3(next_state_inferred_i_8_n_0),
        .O(\crc_received[6]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hF888)) 
    \crc_received[7]_i_1 
       (.I0(crc_received[7]),
        .I1(\crc_received[7]_i_2_n_0 ),
        .I2(fifo_wr_data[7]),
        .I3(next_state_inferred_i_8_n_0),
        .O(\crc_received[7]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h707FF0FF)) 
    \crc_received[7]_i_2 
       (.I0(byte_cnt_255[0]),
        .I1(rx_valid),
        .I2(state[0]),
        .I3(start_crc),
        .I4(byte_cnt_255[1]),
        .O(\crc_received[7]_i_2_n_0 ));
  LUT4 #(
    .INIT(16'hF888)) 
    \crc_received[8]_i_1 
       (.I0(crc_received[8]),
        .I1(\crc_received[15]_i_2_n_0 ),
        .I2(fifo_wr_data[0]),
        .I3(\crc_received[15]_i_3_n_0 ),
        .O(\crc_received[8]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hF888)) 
    \crc_received[9]_i_1 
       (.I0(crc_received[9]),
        .I1(\crc_received[15]_i_2_n_0 ),
        .I2(fifo_wr_data[1]),
        .I3(\crc_received[15]_i_3_n_0 ),
        .O(\crc_received[9]_i_1_n_0 ));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  FDCE \crc_received_reg[0] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(\crc_received[31]_i_1_n_0 ),
        .CLR(rst),
        .D(\crc_received[0]_i_1_n_0 ),
        .Q(crc_received[0]));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  FDCE \crc_received_reg[10] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(\crc_received[31]_i_1_n_0 ),
        .CLR(rst),
        .D(\crc_received[10]_i_1_n_0 ),
        .Q(crc_received[10]));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  FDCE \crc_received_reg[11] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(\crc_received[31]_i_1_n_0 ),
        .CLR(rst),
        .D(\crc_received[11]_i_1_n_0 ),
        .Q(crc_received[11]));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  FDCE \crc_received_reg[12] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(\crc_received[31]_i_1_n_0 ),
        .CLR(rst),
        .D(\crc_received[12]_i_1_n_0 ),
        .Q(crc_received[12]));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  FDCE \crc_received_reg[13] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(\crc_received[31]_i_1_n_0 ),
        .CLR(rst),
        .D(\crc_received[13]_i_1_n_0 ),
        .Q(crc_received[13]));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  FDCE \crc_received_reg[14] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(\crc_received[31]_i_1_n_0 ),
        .CLR(rst),
        .D(\crc_received[14]_i_1_n_0 ),
        .Q(crc_received[14]));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  FDCE \crc_received_reg[15] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(\crc_received[31]_i_1_n_0 ),
        .CLR(rst),
        .D(\crc_received[15]_i_1_n_0 ),
        .Q(crc_received[15]));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  FDCE \crc_received_reg[16] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(\crc_received[31]_i_1_n_0 ),
        .CLR(rst),
        .D(\crc_received[16]_i_1_n_0 ),
        .Q(crc_received[16]));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  FDCE \crc_received_reg[17] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(\crc_received[31]_i_1_n_0 ),
        .CLR(rst),
        .D(\crc_received[17]_i_1_n_0 ),
        .Q(crc_received[17]));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  FDCE \crc_received_reg[18] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(\crc_received[31]_i_1_n_0 ),
        .CLR(rst),
        .D(\crc_received[18]_i_1_n_0 ),
        .Q(crc_received[18]));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  FDCE \crc_received_reg[19] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(\crc_received[31]_i_1_n_0 ),
        .CLR(rst),
        .D(\crc_received[19]_i_1_n_0 ),
        .Q(crc_received[19]));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  FDCE \crc_received_reg[1] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(\crc_received[31]_i_1_n_0 ),
        .CLR(rst),
        .D(\crc_received[1]_i_1_n_0 ),
        .Q(crc_received[1]));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  FDCE \crc_received_reg[20] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(\crc_received[31]_i_1_n_0 ),
        .CLR(rst),
        .D(\crc_received[20]_i_1_n_0 ),
        .Q(crc_received[20]));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  FDCE \crc_received_reg[21] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(\crc_received[31]_i_1_n_0 ),
        .CLR(rst),
        .D(\crc_received[21]_i_1_n_0 ),
        .Q(crc_received[21]));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  FDCE \crc_received_reg[22] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(\crc_received[31]_i_1_n_0 ),
        .CLR(rst),
        .D(\crc_received[22]_i_1_n_0 ),
        .Q(crc_received[22]));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  FDCE \crc_received_reg[23] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(\crc_received[31]_i_1_n_0 ),
        .CLR(rst),
        .D(\crc_received[23]_i_1_n_0 ),
        .Q(crc_received[23]));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  FDCE \crc_received_reg[24] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(\crc_received[31]_i_1_n_0 ),
        .CLR(rst),
        .D(\crc_received[24]_i_1_n_0 ),
        .Q(crc_received[24]));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  FDCE \crc_received_reg[25] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(\crc_received[31]_i_1_n_0 ),
        .CLR(rst),
        .D(\crc_received[25]_i_1_n_0 ),
        .Q(crc_received[25]));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  FDCE \crc_received_reg[26] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(\crc_received[31]_i_1_n_0 ),
        .CLR(rst),
        .D(\crc_received[26]_i_1_n_0 ),
        .Q(crc_received[26]));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  FDCE \crc_received_reg[27] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(\crc_received[31]_i_1_n_0 ),
        .CLR(rst),
        .D(\crc_received[27]_i_1_n_0 ),
        .Q(crc_received[27]));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  FDCE \crc_received_reg[28] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(\crc_received[31]_i_1_n_0 ),
        .CLR(rst),
        .D(\crc_received[28]_i_1_n_0 ),
        .Q(crc_received[28]));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  FDCE \crc_received_reg[29] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(\crc_received[31]_i_1_n_0 ),
        .CLR(rst),
        .D(\crc_received[29]_i_1_n_0 ),
        .Q(crc_received[29]));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  FDCE \crc_received_reg[2] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(\crc_received[31]_i_1_n_0 ),
        .CLR(rst),
        .D(\crc_received[2]_i_1_n_0 ),
        .Q(crc_received[2]));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  FDCE \crc_received_reg[30] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(\crc_received[31]_i_1_n_0 ),
        .CLR(rst),
        .D(\crc_received[30]_i_1_n_0 ),
        .Q(crc_received[30]));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  FDCE \crc_received_reg[31] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(\crc_received[31]_i_1_n_0 ),
        .CLR(rst),
        .D(\crc_received[31]_i_2_n_0 ),
        .Q(crc_received[31]));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  FDCE \crc_received_reg[3] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(\crc_received[31]_i_1_n_0 ),
        .CLR(rst),
        .D(\crc_received[3]_i_1_n_0 ),
        .Q(crc_received[3]));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  FDCE \crc_received_reg[4] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(\crc_received[31]_i_1_n_0 ),
        .CLR(rst),
        .D(\crc_received[4]_i_1_n_0 ),
        .Q(crc_received[4]));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  FDCE \crc_received_reg[5] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(\crc_received[31]_i_1_n_0 ),
        .CLR(rst),
        .D(\crc_received[5]_i_1_n_0 ),
        .Q(crc_received[5]));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  FDCE \crc_received_reg[6] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(\crc_received[31]_i_1_n_0 ),
        .CLR(rst),
        .D(\crc_received[6]_i_1_n_0 ),
        .Q(crc_received[6]));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  FDCE \crc_received_reg[7] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(\crc_received[31]_i_1_n_0 ),
        .CLR(rst),
        .D(\crc_received[7]_i_1_n_0 ),
        .Q(crc_received[7]));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  FDCE \crc_received_reg[8] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(\crc_received[31]_i_1_n_0 ),
        .CLR(rst),
        .D(\crc_received[8]_i_1_n_0 ),
        .Q(crc_received[8]));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  FDCE \crc_received_reg[9] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(\crc_received[31]_i_1_n_0 ),
        .CLR(rst),
        .D(\crc_received[9]_i_1_n_0 ),
        .Q(crc_received[9]));
  LUT6 #(
    .INIT(64'hFEAEAEFEAEFEFEAE)) 
    \crc_reg[0]_i_1 
       (.I0(\crc_reg[31]_i_3_n_0 ),
        .I1(crc_reg[0]),
        .I2(state[0]),
        .I3(crc_reg[2]),
        .I4(fifo_rd_data[2]),
        .I5(crc_reg[8]),
        .O(\crc_reg[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFEAEAEFEAEFEFEAE)) 
    \crc_reg[10]_i_1 
       (.I0(\crc_reg[31]_i_3_n_0 ),
        .I1(crc_reg[10]),
        .I2(state[0]),
        .I3(crc_reg[2]),
        .I4(fifo_rd_data[2]),
        .I5(crc_reg[18]),
        .O(\crc_reg[10]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h606060600000FF00)) 
    \crc_reg[11]_i_1 
       (.I0(u_crc_wrap_n_25),
        .I1(crc_reg[19]),
        .I2(fifo_rd_en_st),
        .I3(crc_reg[11]),
        .I4(start_crc),
        .I5(state[0]),
        .O(\crc_reg[11]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h55FCFFFCFFFC55FC)) 
    \crc_reg[12]_i_1 
       (.I0(fifo_rd_en_st),
        .I1(start_crc),
        .I2(crc_reg[12]),
        .I3(state[0]),
        .I4(u_crc_wrap_n_7),
        .I5(crc_reg[20]),
        .O(\crc_reg[12]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFEAEAEFEAEFEFEAE)) 
    \crc_reg[13]_i_1 
       (.I0(\crc_reg[31]_i_3_n_0 ),
        .I1(crc_reg[13]),
        .I2(state[0]),
        .I3(crc_reg[21]),
        .I4(u_crc_wrap_n_22),
        .I5(u_crc_wrap_n_8),
        .O(\crc_reg[13]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFEAEAEFEAEFEFEAE)) 
    \crc_reg[14]_i_1 
       (.I0(\crc_reg[31]_i_3_n_0 ),
        .I1(crc_reg[14]),
        .I2(state[0]),
        .I3(crc_reg[22]),
        .I4(u_crc_wrap_n_5),
        .I5(u_crc_wrap_n_18),
        .O(\crc_reg[14]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFEAEAEFEAEFEFEAE)) 
    \crc_reg[15]_i_1 
       (.I0(\crc_reg[31]_i_3_n_0 ),
        .I1(crc_reg[15]),
        .I2(state[0]),
        .I3(crc_reg[23]),
        .I4(u_crc_wrap_n_11),
        .I5(u_crc_wrap_n_13),
        .O(\crc_reg[15]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hFFFC55FC)) 
    \crc_reg[16]_i_1 
       (.I0(fifo_rd_en_st),
        .I1(start_crc),
        .I2(crc_reg[16]),
        .I3(state[0]),
        .I4(crc_raw[16]),
        .O(\crc_reg[16]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h888800F0)) 
    \crc_reg[17]_i_1 
       (.I0(crc_raw[17]),
        .I1(fifo_rd_en_st),
        .I2(crc_reg[17]),
        .I3(start_crc),
        .I4(state[0]),
        .O(\crc_reg[17]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFEAEAEFEAEFEFEAE)) 
    \crc_reg[18]_i_1 
       (.I0(\crc_reg[31]_i_3_n_0 ),
        .I1(crc_reg[18]),
        .I2(state[0]),
        .I3(crc_reg[26]),
        .I4(u_crc_wrap_n_7),
        .I5(u_crc_wrap_n_9),
        .O(\crc_reg[18]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFF960096009600)) 
    \crc_reg[19]_i_1 
       (.I0(crc_reg[27]),
        .I1(u_crc_wrap_n_13),
        .I2(u_crc_wrap_n_9),
        .I3(\crc_reg[19]_i_2_n_0 ),
        .I4(crc_reg[19]),
        .I5(\crc_reg[19]_i_3_n_0 ),
        .O(\crc_reg[19]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \crc_reg[19]_i_2 
       (.I0(fifo_rd_en_st),
        .I1(state[0]),
        .O(\crc_reg[19]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h1)) 
    \crc_reg[19]_i_3 
       (.I0(start_crc),
        .I1(state[0]),
        .O(\crc_reg[19]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h606060600000FF00)) 
    \crc_reg[1]_i_1 
       (.I0(u_crc_wrap_n_20),
        .I1(crc_reg[9]),
        .I2(fifo_rd_en_st),
        .I3(crc_reg[1]),
        .I4(start_crc),
        .I5(state[0]),
        .O(\crc_reg[1]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFEAEAEFEAEFEFEAE)) 
    \crc_reg[20]_i_1 
       (.I0(\crc_reg[31]_i_3_n_0 ),
        .I1(crc_reg[20]),
        .I2(state[0]),
        .I3(crc_reg[28]),
        .I4(u_crc_wrap_n_23),
        .I5(u_crc_wrap_n_12),
        .O(\crc_reg[20]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFEAEAEFEAEFEFEAE)) 
    \crc_reg[21]_i_1 
       (.I0(\crc_reg[31]_i_3_n_0 ),
        .I1(crc_reg[21]),
        .I2(state[0]),
        .I3(u_crc_wrap_n_10),
        .I4(u_crc_wrap_n_11),
        .I5(u_crc_wrap_n_24),
        .O(\crc_reg[21]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hFFFC55FC)) 
    \crc_reg[22]_i_1 
       (.I0(fifo_rd_en_st),
        .I1(start_crc),
        .I2(crc_reg[22]),
        .I3(state[0]),
        .I4(crc_raw[22]),
        .O(\crc_reg[22]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFEAEAEFEAEFEFEAE)) 
    \crc_reg[23]_i_1 
       (.I0(\crc_reg[31]_i_3_n_0 ),
        .I1(crc_reg[23]),
        .I2(state[0]),
        .I3(crc_reg[31]),
        .I4(u_crc_wrap_n_23),
        .I5(u_crc_wrap_n_12),
        .O(\crc_reg[23]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hFFFC55FC)) 
    \crc_reg[24]_i_1 
       (.I0(fifo_rd_en_st),
        .I1(start_crc),
        .I2(crc_reg[24]),
        .I3(state[0]),
        .I4(crc_raw[24]),
        .O(\crc_reg[24]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h606060600000FF00)) 
    \crc_reg[25]_i_1 
       (.I0(u_crc_wrap_n_9),
        .I1(u_crc_wrap_n_20),
        .I2(fifo_rd_en_st),
        .I3(crc_reg[25]),
        .I4(start_crc),
        .I5(state[0]),
        .O(\crc_reg[25]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFEAEAEFEAEFEFEAE)) 
    \crc_reg[26]_i_1 
       (.I0(\crc_reg[31]_i_3_n_0 ),
        .I1(crc_reg[26]),
        .I2(state[0]),
        .I3(u_crc_wrap_n_6),
        .I4(u_crc_wrap_n_13),
        .I5(u_crc_wrap_n_18),
        .O(\crc_reg[26]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h606060600000FF00)) 
    \crc_reg[27]_i_1 
       (.I0(u_crc_wrap_n_12),
        .I1(u_crc_wrap_n_8),
        .I2(fifo_rd_en_st),
        .I3(crc_reg[27]),
        .I4(start_crc),
        .I5(state[0]),
        .O(\crc_reg[27]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFEAEAEFEAEFEFEAE)) 
    \crc_reg[28]_i_1 
       (.I0(\crc_reg[31]_i_3_n_0 ),
        .I1(crc_reg[28]),
        .I2(state[0]),
        .I3(u_crc_wrap_n_19),
        .I4(u_crc_wrap_n_23),
        .I5(u_crc_wrap_n_7),
        .O(\crc_reg[28]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFEAEAEFEAEFEFEAE)) 
    \crc_reg[29]_i_1 
       (.I0(\crc_reg[31]_i_3_n_0 ),
        .I1(crc_reg[29]),
        .I2(state[0]),
        .I3(u_crc_wrap_n_21),
        .I4(u_crc_wrap_n_14),
        .I5(u_crc_wrap_n_8),
        .O(\crc_reg[29]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFEAEAEFEAEFEFEAE)) 
    \crc_reg[2]_i_1 
       (.I0(\crc_reg[31]_i_3_n_0 ),
        .I1(crc_reg[2]),
        .I2(state[0]),
        .I3(crc_reg[10]),
        .I4(u_crc_wrap_n_5),
        .I5(u_crc_wrap_n_7),
        .O(\crc_reg[2]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hEEEAEEAEAEAAEAAA)) 
    \crc_reg[30]_i_1 
       (.I0(\crc_reg[30]_i_2_n_0 ),
        .I1(state[0]),
        .I2(fifo_rd_data[0]),
        .I3(u_crc_wrap_n_15),
        .I4(crc_reg[0]),
        .I5(u_crc_wrap_n_16),
        .O(\crc_reg[30]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h0EFE)) 
    \crc_reg[30]_i_2 
       (.I0(crc_reg[30]),
        .I1(start_crc),
        .I2(state[0]),
        .I3(fifo_rd_en_st),
        .O(\crc_reg[30]_i_2_n_0 ));
  LUT4 #(
    .INIT(16'h0041)) 
    \crc_reg[31]_i_1 
       (.I0(state[3]),
        .I1(state[0]),
        .I2(state[1]),
        .I3(state[2]),
        .O(\crc_reg[31]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFEAEAEFEAEFEFEAE)) 
    \crc_reg[31]_i_2 
       (.I0(\crc_reg[31]_i_3_n_0 ),
        .I1(crc_reg[31]),
        .I2(state[0]),
        .I3(crc_reg[7]),
        .I4(fifo_rd_data[7]),
        .I5(u_crc_wrap_n_5),
        .O(\crc_reg[31]_i_2_n_0 ));
  LUT3 #(
    .INIT(8'h74)) 
    \crc_reg[31]_i_3 
       (.I0(fifo_rd_en_st),
        .I1(state[0]),
        .I2(start_crc),
        .O(\crc_reg[31]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hFFFF960096009600)) 
    \crc_reg[3]_i_1 
       (.I0(crc_reg[11]),
        .I1(u_crc_wrap_n_11),
        .I2(u_crc_wrap_n_8),
        .I3(\crc_reg[19]_i_2_n_0 ),
        .I4(crc_reg[3]),
        .I5(\crc_reg[19]_i_3_n_0 ),
        .O(\crc_reg[3]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFEAEAEFEAEFEFEAE)) 
    \crc_reg[4]_i_1 
       (.I0(\crc_reg[31]_i_3_n_0 ),
        .I1(crc_reg[4]),
        .I2(state[0]),
        .I3(crc_reg[12]),
        .I4(u_crc_wrap_n_18),
        .I5(u_crc_wrap_n_20),
        .O(\crc_reg[4]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFEAEAEFEAEFEFEAE)) 
    \crc_reg[5]_i_1 
       (.I0(\crc_reg[31]_i_3_n_0 ),
        .I1(crc_reg[5]),
        .I2(state[0]),
        .I3(crc_reg[13]),
        .I4(u_crc_wrap_n_5),
        .I5(u_crc_wrap_n_12),
        .O(\crc_reg[5]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFEAEAEFEAEFEFEAE)) 
    \crc_reg[6]_i_1 
       (.I0(\crc_reg[31]_i_3_n_0 ),
        .I1(crc_reg[6]),
        .I2(state[0]),
        .I3(crc_reg[14]),
        .I4(u_crc_wrap_n_19),
        .I5(u_crc_wrap_n_24),
        .O(\crc_reg[6]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFEAEAEFEAEFEFEAE)) 
    \crc_reg[7]_i_1 
       (.I0(\crc_reg[31]_i_3_n_0 ),
        .I1(crc_reg[7]),
        .I2(state[0]),
        .I3(crc_reg[15]),
        .I4(u_crc_wrap_n_19),
        .I5(u_crc_wrap_n_21),
        .O(\crc_reg[7]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hFFFC55FC)) 
    \crc_reg[8]_i_1 
       (.I0(fifo_rd_en_st),
        .I1(start_crc),
        .I2(crc_reg[8]),
        .I3(state[0]),
        .I4(crc_raw[8]),
        .O(\crc_reg[8]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h606060600000FF00)) 
    \crc_reg[9]_i_1 
       (.I0(u_crc_wrap_n_14),
        .I1(crc_reg[17]),
        .I2(fifo_rd_en_st),
        .I3(crc_reg[9]),
        .I4(start_crc),
        .I5(state[0]),
        .O(\crc_reg[9]_i_1_n_0 ));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  FDPE \crc_reg_reg[0] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(\crc_reg[31]_i_1_n_0 ),
        .D(\crc_reg[0]_i_1_n_0 ),
        .PRE(rst),
        .Q(crc_reg[0]));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  FDPE \crc_reg_reg[10] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(\crc_reg[31]_i_1_n_0 ),
        .D(\crc_reg[10]_i_1_n_0 ),
        .PRE(rst),
        .Q(crc_reg[10]));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  FDCE \crc_reg_reg[11] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(\crc_reg[31]_i_1_n_0 ),
        .CLR(rst),
        .D(\crc_reg[11]_i_1_n_0 ),
        .Q(crc_reg[11]));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  FDPE \crc_reg_reg[12] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(\crc_reg[31]_i_1_n_0 ),
        .D(\crc_reg[12]_i_1_n_0 ),
        .PRE(rst),
        .Q(crc_reg[12]));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  FDPE \crc_reg_reg[13] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(\crc_reg[31]_i_1_n_0 ),
        .D(\crc_reg[13]_i_1_n_0 ),
        .PRE(rst),
        .Q(crc_reg[13]));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  FDPE \crc_reg_reg[14] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(\crc_reg[31]_i_1_n_0 ),
        .D(\crc_reg[14]_i_1_n_0 ),
        .PRE(rst),
        .Q(crc_reg[14]));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  FDPE \crc_reg_reg[15] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(\crc_reg[31]_i_1_n_0 ),
        .D(\crc_reg[15]_i_1_n_0 ),
        .PRE(rst),
        .Q(crc_reg[15]));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  FDPE \crc_reg_reg[16] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(\crc_reg[31]_i_1_n_0 ),
        .D(\crc_reg[16]_i_1_n_0 ),
        .PRE(rst),
        .Q(crc_reg[16]));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  FDCE \crc_reg_reg[17] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(\crc_reg[31]_i_1_n_0 ),
        .CLR(rst),
        .D(\crc_reg[17]_i_1_n_0 ),
        .Q(crc_reg[17]));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  FDPE \crc_reg_reg[18] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(\crc_reg[31]_i_1_n_0 ),
        .D(\crc_reg[18]_i_1_n_0 ),
        .PRE(rst),
        .Q(crc_reg[18]));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  FDCE \crc_reg_reg[19] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(\crc_reg[31]_i_1_n_0 ),
        .CLR(rst),
        .D(\crc_reg[19]_i_1_n_0 ),
        .Q(crc_reg[19]));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  FDCE \crc_reg_reg[1] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(\crc_reg[31]_i_1_n_0 ),
        .CLR(rst),
        .D(\crc_reg[1]_i_1_n_0 ),
        .Q(crc_reg[1]));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  FDPE \crc_reg_reg[20] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(\crc_reg[31]_i_1_n_0 ),
        .D(\crc_reg[20]_i_1_n_0 ),
        .PRE(rst),
        .Q(crc_reg[20]));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  FDPE \crc_reg_reg[21] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(\crc_reg[31]_i_1_n_0 ),
        .D(\crc_reg[21]_i_1_n_0 ),
        .PRE(rst),
        .Q(crc_reg[21]));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  FDPE \crc_reg_reg[22] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(\crc_reg[31]_i_1_n_0 ),
        .D(\crc_reg[22]_i_1_n_0 ),
        .PRE(rst),
        .Q(crc_reg[22]));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  FDPE \crc_reg_reg[23] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(\crc_reg[31]_i_1_n_0 ),
        .D(\crc_reg[23]_i_1_n_0 ),
        .PRE(rst),
        .Q(crc_reg[23]));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  FDPE \crc_reg_reg[24] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(\crc_reg[31]_i_1_n_0 ),
        .D(\crc_reg[24]_i_1_n_0 ),
        .PRE(rst),
        .Q(crc_reg[24]));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  FDCE \crc_reg_reg[25] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(\crc_reg[31]_i_1_n_0 ),
        .CLR(rst),
        .D(\crc_reg[25]_i_1_n_0 ),
        .Q(crc_reg[25]));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  FDPE \crc_reg_reg[26] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(\crc_reg[31]_i_1_n_0 ),
        .D(\crc_reg[26]_i_1_n_0 ),
        .PRE(rst),
        .Q(crc_reg[26]));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  FDCE \crc_reg_reg[27] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(\crc_reg[31]_i_1_n_0 ),
        .CLR(rst),
        .D(\crc_reg[27]_i_1_n_0 ),
        .Q(crc_reg[27]));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  FDPE \crc_reg_reg[28] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(\crc_reg[31]_i_1_n_0 ),
        .D(\crc_reg[28]_i_1_n_0 ),
        .PRE(rst),
        .Q(crc_reg[28]));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  FDPE \crc_reg_reg[29] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(\crc_reg[31]_i_1_n_0 ),
        .D(\crc_reg[29]_i_1_n_0 ),
        .PRE(rst),
        .Q(crc_reg[29]));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  FDPE \crc_reg_reg[2] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(\crc_reg[31]_i_1_n_0 ),
        .D(\crc_reg[2]_i_1_n_0 ),
        .PRE(rst),
        .Q(crc_reg[2]));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  FDPE \crc_reg_reg[30] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(\crc_reg[31]_i_1_n_0 ),
        .D(\crc_reg[30]_i_1_n_0 ),
        .PRE(rst),
        .Q(crc_reg[30]));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  FDPE \crc_reg_reg[31] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(\crc_reg[31]_i_1_n_0 ),
        .D(\crc_reg[31]_i_2_n_0 ),
        .PRE(rst),
        .Q(crc_reg[31]));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  FDCE \crc_reg_reg[3] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(\crc_reg[31]_i_1_n_0 ),
        .CLR(rst),
        .D(\crc_reg[3]_i_1_n_0 ),
        .Q(crc_reg[3]));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  FDPE \crc_reg_reg[4] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(\crc_reg[31]_i_1_n_0 ),
        .D(\crc_reg[4]_i_1_n_0 ),
        .PRE(rst),
        .Q(crc_reg[4]));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  FDPE \crc_reg_reg[5] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(\crc_reg[31]_i_1_n_0 ),
        .D(\crc_reg[5]_i_1_n_0 ),
        .PRE(rst),
        .Q(crc_reg[5]));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  FDPE \crc_reg_reg[6] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(\crc_reg[31]_i_1_n_0 ),
        .D(\crc_reg[6]_i_1_n_0 ),
        .PRE(rst),
        .Q(crc_reg[6]));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  FDPE \crc_reg_reg[7] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(\crc_reg[31]_i_1_n_0 ),
        .D(\crc_reg[7]_i_1_n_0 ),
        .PRE(rst),
        .Q(crc_reg[7]));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  FDPE \crc_reg_reg[8] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(\crc_reg[31]_i_1_n_0 ),
        .D(\crc_reg[8]_i_1_n_0 ),
        .PRE(rst),
        .Q(crc_reg[8]));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  FDCE \crc_reg_reg[9] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(\crc_reg[31]_i_1_n_0 ),
        .CLR(rst),
        .D(\crc_reg[9]_i_1_n_0 ),
        .Q(crc_reg[9]));
  LUT1 #(
    .INIT(2'h1)) 
    \crc_result[0]_i_1 
       (.I0(crc_reg[0]),
        .O(p_0_in1_in[0]));
  LUT1 #(
    .INIT(2'h1)) 
    \crc_result[10]_i_1 
       (.I0(crc_reg[10]),
        .O(p_0_in1_in[10]));
  LUT1 #(
    .INIT(2'h1)) 
    \crc_result[11]_i_1 
       (.I0(crc_reg[11]),
        .O(p_0_in1_in[11]));
  LUT1 #(
    .INIT(2'h1)) 
    \crc_result[12]_i_1 
       (.I0(crc_reg[12]),
        .O(p_0_in1_in[12]));
  LUT1 #(
    .INIT(2'h1)) 
    \crc_result[13]_i_1 
       (.I0(crc_reg[13]),
        .O(p_0_in1_in[13]));
  LUT1 #(
    .INIT(2'h1)) 
    \crc_result[14]_i_1 
       (.I0(crc_reg[14]),
        .O(p_0_in1_in[14]));
  LUT1 #(
    .INIT(2'h1)) 
    \crc_result[15]_i_1 
       (.I0(crc_reg[15]),
        .O(p_0_in1_in[15]));
  LUT1 #(
    .INIT(2'h1)) 
    \crc_result[16]_i_1 
       (.I0(crc_reg[16]),
        .O(p_0_in1_in[16]));
  LUT1 #(
    .INIT(2'h1)) 
    \crc_result[17]_i_1 
       (.I0(crc_reg[17]),
        .O(p_0_in1_in[17]));
  LUT1 #(
    .INIT(2'h1)) 
    \crc_result[18]_i_1 
       (.I0(crc_reg[18]),
        .O(p_0_in1_in[18]));
  LUT1 #(
    .INIT(2'h1)) 
    \crc_result[19]_i_1 
       (.I0(crc_reg[19]),
        .O(p_0_in1_in[19]));
  LUT1 #(
    .INIT(2'h1)) 
    \crc_result[1]_i_1 
       (.I0(crc_reg[1]),
        .O(p_0_in1_in[1]));
  LUT1 #(
    .INIT(2'h1)) 
    \crc_result[20]_i_1 
       (.I0(crc_reg[20]),
        .O(p_0_in1_in[20]));
  LUT1 #(
    .INIT(2'h1)) 
    \crc_result[21]_i_1 
       (.I0(crc_reg[21]),
        .O(p_0_in1_in[21]));
  LUT1 #(
    .INIT(2'h1)) 
    \crc_result[22]_i_1 
       (.I0(crc_reg[22]),
        .O(p_0_in1_in[22]));
  LUT1 #(
    .INIT(2'h1)) 
    \crc_result[23]_i_1 
       (.I0(crc_reg[23]),
        .O(p_0_in1_in[23]));
  LUT1 #(
    .INIT(2'h1)) 
    \crc_result[24]_i_1 
       (.I0(crc_reg[24]),
        .O(p_0_in1_in[24]));
  LUT1 #(
    .INIT(2'h1)) 
    \crc_result[25]_i_1 
       (.I0(crc_reg[25]),
        .O(p_0_in1_in[25]));
  LUT1 #(
    .INIT(2'h1)) 
    \crc_result[26]_i_1 
       (.I0(crc_reg[26]),
        .O(p_0_in1_in[26]));
  LUT1 #(
    .INIT(2'h1)) 
    \crc_result[27]_i_1 
       (.I0(crc_reg[27]),
        .O(p_0_in1_in[27]));
  LUT1 #(
    .INIT(2'h1)) 
    \crc_result[28]_i_1 
       (.I0(crc_reg[28]),
        .O(p_0_in1_in[28]));
  LUT1 #(
    .INIT(2'h1)) 
    \crc_result[29]_i_1 
       (.I0(crc_reg[29]),
        .O(p_0_in1_in[29]));
  LUT1 #(
    .INIT(2'h1)) 
    \crc_result[2]_i_1 
       (.I0(crc_reg[2]),
        .O(p_0_in1_in[2]));
  LUT1 #(
    .INIT(2'h1)) 
    \crc_result[30]_i_1 
       (.I0(crc_reg[30]),
        .O(p_0_in1_in[30]));
  LUT4 #(
    .INIT(16'h0200)) 
    \crc_result[31]_i_1 
       (.I0(state[2]),
        .I1(state[0]),
        .I2(state[3]),
        .I3(state[1]),
        .O(\crc_result[31]_i_1_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \crc_result[31]_i_2 
       (.I0(crc_reg[31]),
        .O(p_0_in1_in[31]));
  LUT1 #(
    .INIT(2'h1)) 
    \crc_result[3]_i_1 
       (.I0(crc_reg[3]),
        .O(p_0_in1_in[3]));
  LUT1 #(
    .INIT(2'h1)) 
    \crc_result[4]_i_1 
       (.I0(crc_reg[4]),
        .O(p_0_in1_in[4]));
  LUT1 #(
    .INIT(2'h1)) 
    \crc_result[5]_i_1 
       (.I0(crc_reg[5]),
        .O(p_0_in1_in[5]));
  LUT1 #(
    .INIT(2'h1)) 
    \crc_result[7]_i_1 
       (.I0(crc_reg[7]),
        .O(p_0_in1_in[7]));
  LUT1 #(
    .INIT(2'h1)) 
    \crc_result[8]_i_1 
       (.I0(crc_reg[8]),
        .O(p_0_in1_in[8]));
  LUT1 #(
    .INIT(2'h1)) 
    \crc_result[9]_i_1 
       (.I0(crc_reg[9]),
        .O(p_0_in1_in[9]));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  FDCE \crc_result_reg[0] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(\crc_result[31]_i_1_n_0 ),
        .CLR(rst),
        .D(p_0_in1_in[0]),
        .Q(crc_result[0]));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  FDCE \crc_result_reg[10] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(\crc_result[31]_i_1_n_0 ),
        .CLR(rst),
        .D(p_0_in1_in[10]),
        .Q(crc_result[10]));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  FDCE \crc_result_reg[11] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(\crc_result[31]_i_1_n_0 ),
        .CLR(rst),
        .D(p_0_in1_in[11]),
        .Q(crc_result[11]));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  FDCE \crc_result_reg[12] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(\crc_result[31]_i_1_n_0 ),
        .CLR(rst),
        .D(p_0_in1_in[12]),
        .Q(crc_result[12]));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  FDCE \crc_result_reg[13] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(\crc_result[31]_i_1_n_0 ),
        .CLR(rst),
        .D(p_0_in1_in[13]),
        .Q(crc_result[13]));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  FDCE \crc_result_reg[14] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(\crc_result[31]_i_1_n_0 ),
        .CLR(rst),
        .D(p_0_in1_in[14]),
        .Q(crc_result[14]));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  FDCE \crc_result_reg[15] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(\crc_result[31]_i_1_n_0 ),
        .CLR(rst),
        .D(p_0_in1_in[15]),
        .Q(crc_result[15]));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  FDCE \crc_result_reg[16] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(\crc_result[31]_i_1_n_0 ),
        .CLR(rst),
        .D(p_0_in1_in[16]),
        .Q(crc_result[16]));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  FDCE \crc_result_reg[17] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(\crc_result[31]_i_1_n_0 ),
        .CLR(rst),
        .D(p_0_in1_in[17]),
        .Q(crc_result[17]));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  FDCE \crc_result_reg[18] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(\crc_result[31]_i_1_n_0 ),
        .CLR(rst),
        .D(p_0_in1_in[18]),
        .Q(crc_result[18]));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  FDCE \crc_result_reg[19] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(\crc_result[31]_i_1_n_0 ),
        .CLR(rst),
        .D(p_0_in1_in[19]),
        .Q(crc_result[19]));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  FDCE \crc_result_reg[1] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(\crc_result[31]_i_1_n_0 ),
        .CLR(rst),
        .D(p_0_in1_in[1]),
        .Q(crc_result[1]));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  FDCE \crc_result_reg[20] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(\crc_result[31]_i_1_n_0 ),
        .CLR(rst),
        .D(p_0_in1_in[20]),
        .Q(crc_result[20]));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  FDCE \crc_result_reg[21] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(\crc_result[31]_i_1_n_0 ),
        .CLR(rst),
        .D(p_0_in1_in[21]),
        .Q(crc_result[21]));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  FDCE \crc_result_reg[22] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(\crc_result[31]_i_1_n_0 ),
        .CLR(rst),
        .D(p_0_in1_in[22]),
        .Q(crc_result[22]));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  FDCE \crc_result_reg[23] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(\crc_result[31]_i_1_n_0 ),
        .CLR(rst),
        .D(p_0_in1_in[23]),
        .Q(crc_result[23]));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  FDCE \crc_result_reg[24] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(\crc_result[31]_i_1_n_0 ),
        .CLR(rst),
        .D(p_0_in1_in[24]),
        .Q(crc_result[24]));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  FDCE \crc_result_reg[25] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(\crc_result[31]_i_1_n_0 ),
        .CLR(rst),
        .D(p_0_in1_in[25]),
        .Q(crc_result[25]));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  FDCE \crc_result_reg[26] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(\crc_result[31]_i_1_n_0 ),
        .CLR(rst),
        .D(p_0_in1_in[26]),
        .Q(crc_result[26]));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  FDCE \crc_result_reg[27] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(\crc_result[31]_i_1_n_0 ),
        .CLR(rst),
        .D(p_0_in1_in[27]),
        .Q(crc_result[27]));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  FDCE \crc_result_reg[28] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(\crc_result[31]_i_1_n_0 ),
        .CLR(rst),
        .D(p_0_in1_in[28]),
        .Q(crc_result[28]));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  FDCE \crc_result_reg[29] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(\crc_result[31]_i_1_n_0 ),
        .CLR(rst),
        .D(p_0_in1_in[29]),
        .Q(crc_result[29]));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  FDCE \crc_result_reg[2] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(\crc_result[31]_i_1_n_0 ),
        .CLR(rst),
        .D(p_0_in1_in[2]),
        .Q(crc_result[2]));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  FDCE \crc_result_reg[30] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(\crc_result[31]_i_1_n_0 ),
        .CLR(rst),
        .D(p_0_in1_in[30]),
        .Q(crc_result[30]));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  FDCE \crc_result_reg[31] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(\crc_result[31]_i_1_n_0 ),
        .CLR(rst),
        .D(p_0_in1_in[31]),
        .Q(crc_result[31]));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  FDCE \crc_result_reg[3] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(\crc_result[31]_i_1_n_0 ),
        .CLR(rst),
        .D(p_0_in1_in[3]),
        .Q(crc_result[3]));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  FDCE \crc_result_reg[4] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(\crc_result[31]_i_1_n_0 ),
        .CLR(rst),
        .D(p_0_in1_in[4]),
        .Q(crc_result[4]));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  FDCE \crc_result_reg[5] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(\crc_result[31]_i_1_n_0 ),
        .CLR(rst),
        .D(p_0_in1_in[5]),
        .Q(crc_result[5]));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  FDCE \crc_result_reg[6] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(\crc_result[31]_i_1_n_0 ),
        .CLR(rst),
        .D(p_0_in1_in[6]),
        .Q(crc_result[6]));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  FDCE \crc_result_reg[7] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(\crc_result[31]_i_1_n_0 ),
        .CLR(rst),
        .D(p_0_in1_in[7]),
        .Q(crc_result[7]));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  FDCE \crc_result_reg[8] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(\crc_result[31]_i_1_n_0 ),
        .CLR(rst),
        .D(p_0_in1_in[8]),
        .Q(crc_result[8]));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  FDCE \crc_result_reg[9] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(\crc_result[31]_i_1_n_0 ),
        .CLR(rst),
        .D(p_0_in1_in[9]),
        .Q(crc_result[9]));
  LUT4 #(
    .INIT(16'hBFFC)) 
    crc_running_inferred_i_1
       (.I0(state[3]),
        .I1(state[1]),
        .I2(state[0]),
        .I3(state[2]),
        .O(crc_running));
  LUT3 #(
    .INIT(8'hE0)) 
    crc_update_pending_i_1
       (.I0(crc_update_pending),
        .I1(fifo_rd_en),
        .I2(crc_update_pending_i_2_n_0),
        .O(crc_update_pending_i_1_n_0));
  LUT5 #(
    .INIT(32'hAFAFFEFF)) 
    crc_update_pending_i_2
       (.I0(state[3]),
        .I1(state[2]),
        .I2(state[1]),
        .I3(start_crc),
        .I4(state[0]),
        .O(crc_update_pending_i_2_n_0));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  FDCE crc_update_pending_reg
       (.C(sys_clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(rst),
        .D(crc_update_pending_i_1_n_0),
        .Q(crc_update_pending));
  LUT3 #(
    .INIT(8'hB8)) 
    \fifo_rd_data_reg[0]_i_1 
       (.I0(fifo_rd_data[0]),
        .I1(fifo_rd_en),
        .I2(fifo_rd_data_reg[0]),
        .O(\fifo_rd_data_reg[0]_i_1_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \fifo_rd_data_reg[1]_i_1 
       (.I0(fifo_rd_data[1]),
        .I1(fifo_rd_en),
        .I2(fifo_rd_data_reg[1]),
        .O(\fifo_rd_data_reg[1]_i_1_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \fifo_rd_data_reg[2]_i_1 
       (.I0(fifo_rd_data[2]),
        .I1(fifo_rd_en),
        .I2(fifo_rd_data_reg[2]),
        .O(\fifo_rd_data_reg[2]_i_1_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \fifo_rd_data_reg[3]_i_1 
       (.I0(fifo_rd_data[3]),
        .I1(fifo_rd_en),
        .I2(fifo_rd_data_reg[3]),
        .O(\fifo_rd_data_reg[3]_i_1_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \fifo_rd_data_reg[4]_i_1 
       (.I0(fifo_rd_data[4]),
        .I1(fifo_rd_en),
        .I2(fifo_rd_data_reg[4]),
        .O(\fifo_rd_data_reg[4]_i_1_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \fifo_rd_data_reg[5]_i_1 
       (.I0(fifo_rd_data[5]),
        .I1(fifo_rd_en),
        .I2(fifo_rd_data_reg[5]),
        .O(\fifo_rd_data_reg[5]_i_1_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \fifo_rd_data_reg[6]_i_1 
       (.I0(fifo_rd_data[6]),
        .I1(fifo_rd_en),
        .I2(fifo_rd_data_reg[6]),
        .O(\fifo_rd_data_reg[6]_i_1_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \fifo_rd_data_reg[7]_i_1 
       (.I0(fifo_rd_data[7]),
        .I1(fifo_rd_en),
        .I2(fifo_rd_data_reg[7]),
        .O(\fifo_rd_data_reg[7]_i_1_n_0 ));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  FDCE \fifo_rd_data_reg_reg[0] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(rst),
        .D(\fifo_rd_data_reg[0]_i_1_n_0 ),
        .Q(fifo_rd_data_reg[0]));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  FDCE \fifo_rd_data_reg_reg[1] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(rst),
        .D(\fifo_rd_data_reg[1]_i_1_n_0 ),
        .Q(fifo_rd_data_reg[1]));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  FDCE \fifo_rd_data_reg_reg[2] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(rst),
        .D(\fifo_rd_data_reg[2]_i_1_n_0 ),
        .Q(fifo_rd_data_reg[2]));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  FDCE \fifo_rd_data_reg_reg[3] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(rst),
        .D(\fifo_rd_data_reg[3]_i_1_n_0 ),
        .Q(fifo_rd_data_reg[3]));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  FDCE \fifo_rd_data_reg_reg[4] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(rst),
        .D(\fifo_rd_data_reg[4]_i_1_n_0 ),
        .Q(fifo_rd_data_reg[4]));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  FDCE \fifo_rd_data_reg_reg[5] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(rst),
        .D(\fifo_rd_data_reg[5]_i_1_n_0 ),
        .Q(fifo_rd_data_reg[5]));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  FDCE \fifo_rd_data_reg_reg[6] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(rst),
        .D(\fifo_rd_data_reg[6]_i_1_n_0 ),
        .Q(fifo_rd_data_reg[6]));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  FDCE \fifo_rd_data_reg_reg[7] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(rst),
        .D(\fifo_rd_data_reg[7]_i_1_n_0 ),
        .Q(fifo_rd_data_reg[7]));
  LUT4 #(
    .INIT(16'h1000)) 
    fifo_rd_en_inferred_i_1
       (.I0(state[3]),
        .I1(state[2]),
        .I2(state[1]),
        .I3(state[0]),
        .O(fifo_rd_en));
  LUT6 #(
    .INIT(64'hAAA0AAA0EEE0FFF0)) 
    fifo_rd_en_st_i_1
       (.I0(fifo_rd_en_st_i_2_n_0),
        .I1(state[1]),
        .I2(fifo_rd_en_st),
        .I3(fifo_rd_en),
        .I4(start_crc),
        .I5(state[2]),
        .O(fifo_rd_en_st_i_1_n_0));
  LUT3 #(
    .INIT(8'hF6)) 
    fifo_rd_en_st_i_2
       (.I0(state[1]),
        .I1(state[0]),
        .I2(state[3]),
        .O(fifo_rd_en_st_i_2_n_0));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  FDCE fifo_rd_en_st_reg
       (.C(sys_clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(rst),
        .D(fifo_rd_en_st_i_1_n_0),
        .Q(fifo_rd_en_st));
  LUT6 #(
    .INIT(64'h0000000000040000)) 
    fifo_wr_en_inferred_i_1
       (.I0(fifo_full),
        .I1(rx_valid),
        .I2(state[0]),
        .I3(state[3]),
        .I4(state[1]),
        .I5(state[2]),
        .O(fifo_wr_en));
  LUT1 #(
    .INIT(2'h2)) 
    i_0
       (.I0(1'b0),
        .O(next_state[3]));
  LUT5 #(
    .INIT(32'h00003F40)) 
    next_state_inferred_i_1
       (.I0(next_state_inferred_i_4_n_0),
        .I1(state[0]),
        .I2(state[1]),
        .I3(state[2]),
        .I4(state[3]),
        .O(next_state[2]));
  LUT6 #(
    .INIT(64'h00000F000000E000)) 
    next_state_inferred_i_10
       (.I0(next_state_inferred_i_17_n_0),
        .I1(next_state_inferred_i_14_n_0),
        .I2(state[0]),
        .I3(state[1]),
        .I4(state[3]),
        .I5(state[2]),
        .O(next_state_inferred_i_10_n_0));
  LUT6 #(
    .INIT(64'h0005000300050000)) 
    next_state_inferred_i_11
       (.I0(tx_busy),
        .I1(state[1]),
        .I2(state[0]),
        .I3(state[3]),
        .I4(state[2]),
        .I5(start_crc),
        .O(next_state_inferred_i_11_n_0));
  LUT6 #(
    .INIT(64'h00000044000F0000)) 
    next_state_inferred_i_12
       (.I0(byte_cnt_255[0]),
        .I1(state[2]),
        .I2(next_state_inferred_i_15_n_0),
        .I3(state[3]),
        .I4(state[1]),
        .I5(state[0]),
        .O(next_state_inferred_i_12_n_0));
  LUT6 #(
    .INIT(64'h70700000F0000000)) 
    next_state_inferred_i_13
       (.I0(rx_valid),
        .I1(byte_cnt_255[1]),
        .I2(next_state_inferred_i_7_n_0),
        .I3(tx_busy),
        .I4(state[0]),
        .I5(next_state_inferred_i_6_n_0),
        .O(next_state_inferred_i_13_n_0));
  LUT4 #(
    .INIT(16'hDFFF)) 
    next_state_inferred_i_14
       (.I0(read_cnt[7]),
        .I1(read_cnt[5]),
        .I2(read_cnt[6]),
        .I3(read_cnt[3]),
        .O(next_state_inferred_i_14_n_0));
  LUT3 #(
    .INIT(8'h7F)) 
    next_state_inferred_i_15
       (.I0(rx_valid),
        .I1(byte_cnt[1]),
        .I2(byte_cnt[0]),
        .O(next_state_inferred_i_15_n_0));
  LUT6 #(
    .INIT(64'h0010000000000000)) 
    next_state_inferred_i_16
       (.I0(cmd_cnt[2]),
        .I1(cmd_cnt[3]),
        .I2(cmd_cnt[1]),
        .I3(cmd_cnt[0]),
        .I4(cmd_cnt[5]),
        .I5(cmd_cnt[4]),
        .O(next_state_inferred_i_16_n_0));
  LUT4 #(
    .INIT(16'hFFFE)) 
    next_state_inferred_i_17
       (.I0(read_cnt[1]),
        .I1(read_cnt[0]),
        .I2(read_cnt[4]),
        .I3(read_cnt[2]),
        .O(next_state_inferred_i_17_n_0));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFEAAA)) 
    next_state_inferred_i_2
       (.I0(next_state_inferred_i_5_n_0),
        .I1(next_state_inferred_i_6_n_0),
        .I2(next_state_inferred_i_7_n_0),
        .I3(next_state_inferred_i_8_n_0),
        .I4(next_state_inferred_i_9_n_0),
        .I5(next_state_inferred_i_10_n_0),
        .O(next_state[1]));
  LUT4 #(
    .INIT(16'hFFFE)) 
    next_state_inferred_i_3
       (.I0(next_state_inferred_i_11_n_0),
        .I1(next_state_inferred_i_12_n_0),
        .I2(next_state_inferred_i_10_n_0),
        .I3(next_state_inferred_i_13_n_0),
        .O(next_state[0]));
  LUT5 #(
    .INIT(32'hFFFFFFFE)) 
    next_state_inferred_i_4
       (.I0(read_cnt[2]),
        .I1(read_cnt[4]),
        .I2(read_cnt[0]),
        .I3(read_cnt[1]),
        .I4(next_state_inferred_i_14_n_0),
        .O(next_state_inferred_i_4_n_0));
  LUT5 #(
    .INIT(32'h04040400)) 
    next_state_inferred_i_5
       (.I0(state[0]),
        .I1(state[1]),
        .I2(state[3]),
        .I3(next_state_inferred_i_15_n_0),
        .I4(next_state_inferred_i_16_n_0),
        .O(next_state_inferred_i_5_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    next_state_inferred_i_6
       (.I0(state[1]),
        .I1(state[2]),
        .O(next_state_inferred_i_6_n_0));
  LUT3 #(
    .INIT(8'h06)) 
    next_state_inferred_i_7
       (.I0(state[1]),
        .I1(state[0]),
        .I2(state[3]),
        .O(next_state_inferred_i_7_n_0));
  LUT4 #(
    .INIT(16'h8000)) 
    next_state_inferred_i_8
       (.I0(byte_cnt_255[0]),
        .I1(state[0]),
        .I2(rx_valid),
        .I3(byte_cnt_255[1]),
        .O(next_state_inferred_i_8_n_0));
  LUT5 #(
    .INIT(32'h00000100)) 
    next_state_inferred_i_9
       (.I0(state[2]),
        .I1(tx_busy),
        .I2(state[3]),
        .I3(state[0]),
        .I4(state[1]),
        .O(next_state_inferred_i_9_n_0));
  LUT4 #(
    .INIT(16'h0434)) 
    \read_cnt[0]_i_1 
       (.I0(start_crc),
        .I1(read_cnt[0]),
        .I2(state[0]),
        .I3(state[2]),
        .O(\read_cnt[0]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h00503C50)) 
    \read_cnt[1]_i_1 
       (.I0(start_crc),
        .I1(read_cnt[0]),
        .I2(read_cnt[1]),
        .I3(state[0]),
        .I4(state[2]),
        .O(\read_cnt[1]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h000055003FC05500)) 
    \read_cnt[2]_i_1 
       (.I0(start_crc),
        .I1(read_cnt[1]),
        .I2(read_cnt[0]),
        .I3(read_cnt[2]),
        .I4(state[0]),
        .I5(state[2]),
        .O(\read_cnt[2]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hBFFFC000AAAA0000)) 
    \read_cnt[3]_i_1 
       (.I0(\crc_reg[19]_i_3_n_0 ),
        .I1(read_cnt[2]),
        .I2(read_cnt[0]),
        .I3(read_cnt[1]),
        .I4(read_cnt[3]),
        .I5(\read_cnt[6]_i_3_n_0 ),
        .O(\read_cnt[3]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h000055003FC05500)) 
    \read_cnt[4]_i_1 
       (.I0(start_crc),
        .I1(read_cnt[3]),
        .I2(\read_cnt[7]_i_3_n_0 ),
        .I3(read_cnt[4]),
        .I4(state[0]),
        .I5(state[2]),
        .O(\read_cnt[4]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hBFFFC000AAAA0000)) 
    \read_cnt[5]_i_1 
       (.I0(\crc_reg[19]_i_3_n_0 ),
        .I1(\read_cnt[7]_i_3_n_0 ),
        .I2(read_cnt[3]),
        .I3(read_cnt[4]),
        .I4(read_cnt[5]),
        .I5(\read_cnt[6]_i_3_n_0 ),
        .O(\read_cnt[5]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hBFFFC000AAAA0000)) 
    \read_cnt[6]_i_1 
       (.I0(\crc_reg[19]_i_3_n_0 ),
        .I1(\read_cnt[7]_i_3_n_0 ),
        .I2(\read_cnt[6]_i_2_n_0 ),
        .I3(read_cnt[3]),
        .I4(read_cnt[6]),
        .I5(\read_cnt[6]_i_3_n_0 ),
        .O(\read_cnt[6]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \read_cnt[6]_i_2 
       (.I0(read_cnt[4]),
        .I1(read_cnt[5]),
        .O(\read_cnt[6]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \read_cnt[6]_i_3 
       (.I0(state[0]),
        .I1(state[2]),
        .O(\read_cnt[6]_i_3_n_0 ));
  LUT4 #(
    .INIT(16'h0809)) 
    \read_cnt[7]_i_1 
       (.I0(state[0]),
        .I1(state[1]),
        .I2(state[3]),
        .I3(state[2]),
        .O(\read_cnt[7]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h000055003FC05500)) 
    \read_cnt[7]_i_2 
       (.I0(start_crc),
        .I1(\read_cnt[7]_i_3_n_0 ),
        .I2(\read_cnt[7]_i_4_n_0 ),
        .I3(read_cnt[7]),
        .I4(state[0]),
        .I5(state[2]),
        .O(\read_cnt[7]_i_2_n_0 ));
  LUT3 #(
    .INIT(8'h80)) 
    \read_cnt[7]_i_3 
       (.I0(read_cnt[1]),
        .I1(read_cnt[0]),
        .I2(read_cnt[2]),
        .O(\read_cnt[7]_i_3_n_0 ));
  LUT4 #(
    .INIT(16'h8000)) 
    \read_cnt[7]_i_4 
       (.I0(read_cnt[5]),
        .I1(read_cnt[4]),
        .I2(read_cnt[6]),
        .I3(read_cnt[3]),
        .O(\read_cnt[7]_i_4_n_0 ));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  FDCE \read_cnt_reg[0] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(\read_cnt[7]_i_1_n_0 ),
        .CLR(rst),
        .D(\read_cnt[0]_i_1_n_0 ),
        .Q(read_cnt[0]));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  FDCE \read_cnt_reg[1] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(\read_cnt[7]_i_1_n_0 ),
        .CLR(rst),
        .D(\read_cnt[1]_i_1_n_0 ),
        .Q(read_cnt[1]));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  FDCE \read_cnt_reg[2] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(\read_cnt[7]_i_1_n_0 ),
        .CLR(rst),
        .D(\read_cnt[2]_i_1_n_0 ),
        .Q(read_cnt[2]));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  FDCE \read_cnt_reg[3] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(\read_cnt[7]_i_1_n_0 ),
        .CLR(rst),
        .D(\read_cnt[3]_i_1_n_0 ),
        .Q(read_cnt[3]));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  FDCE \read_cnt_reg[4] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(\read_cnt[7]_i_1_n_0 ),
        .CLR(rst),
        .D(\read_cnt[4]_i_1_n_0 ),
        .Q(read_cnt[4]));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  FDCE \read_cnt_reg[5] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(\read_cnt[7]_i_1_n_0 ),
        .CLR(rst),
        .D(\read_cnt[5]_i_1_n_0 ),
        .Q(read_cnt[5]));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  FDCE \read_cnt_reg[6] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(\read_cnt[7]_i_1_n_0 ),
        .CLR(rst),
        .D(\read_cnt[6]_i_1_n_0 ),
        .Q(read_cnt[6]));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  FDCE \read_cnt_reg[7] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(\read_cnt[7]_i_1_n_0 ),
        .CLR(rst),
        .D(\read_cnt[7]_i_2_n_0 ),
        .Q(read_cnt[7]));
  LUT2 #(
    .INIT(4'h8)) 
    \send_delay[0]_i_1 
       (.I0(\send_delay[21]_i_2_n_0 ),
        .I1(send_delay[0]),
        .O(\send_delay[0]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \send_delay[10]_i_1 
       (.I0(\send_delay[21]_i_2_n_0 ),
        .I1(send_delay[10]),
        .O(\send_delay[10]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \send_delay[11]_i_1 
       (.I0(\send_delay[21]_i_2_n_0 ),
        .I1(send_delay[11]),
        .O(\send_delay[11]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \send_delay[12]_i_1 
       (.I0(\send_delay[21]_i_2_n_0 ),
        .I1(send_delay[12]),
        .O(\send_delay[12]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \send_delay[13]_i_1 
       (.I0(\send_delay[21]_i_2_n_0 ),
        .I1(send_delay[13]),
        .O(\send_delay[13]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \send_delay[14]_i_1 
       (.I0(\send_delay[21]_i_2_n_0 ),
        .I1(send_delay[14]),
        .O(\send_delay[14]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \send_delay[15]_i_1 
       (.I0(\send_delay[21]_i_2_n_0 ),
        .I1(send_delay[15]),
        .O(\send_delay[15]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \send_delay[16]_i_1 
       (.I0(\send_delay[21]_i_2_n_0 ),
        .I1(send_delay[16]),
        .O(\send_delay[16]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \send_delay[17]_i_1 
       (.I0(\send_delay[21]_i_2_n_0 ),
        .I1(send_delay[17]),
        .O(\send_delay[17]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \send_delay[18]_i_1 
       (.I0(\send_delay[21]_i_2_n_0 ),
        .I1(send_delay[18]),
        .O(\send_delay[18]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \send_delay[19]_i_1 
       (.I0(\send_delay[21]_i_2_n_0 ),
        .I1(send_delay[19]),
        .O(\send_delay[19]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \send_delay[1]_i_1 
       (.I0(\send_delay[21]_i_2_n_0 ),
        .I1(send_delay[1]),
        .O(\send_delay[1]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \send_delay[20]_i_1 
       (.I0(\send_delay[21]_i_2_n_0 ),
        .I1(send_delay[20]),
        .O(\send_delay[20]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \send_delay[21]_i_1 
       (.I0(\send_delay[21]_i_2_n_0 ),
        .I1(send_delay[21]),
        .O(\send_delay[21]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFEFEFFF0F0F0F0)) 
    \send_delay[21]_i_2 
       (.I0(next_state[3]),
        .I1(next_state[1]),
        .I2(\send_delay[21]_i_3_n_0 ),
        .I3(next_state[2]),
        .I4(next_state[0]),
        .I5(crc_update_pending_i_2_n_0),
        .O(\send_delay[21]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'h00001004)) 
    \send_delay[21]_i_3 
       (.I0(state[3]),
        .I1(state[0]),
        .I2(state[2]),
        .I3(next_state[2]),
        .I4(state[1]),
        .O(\send_delay[21]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \send_delay[2]_i_1 
       (.I0(\send_delay[21]_i_2_n_0 ),
        .I1(send_delay[2]),
        .O(\send_delay[2]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \send_delay[3]_i_1 
       (.I0(\send_delay[21]_i_2_n_0 ),
        .I1(send_delay[3]),
        .O(\send_delay[3]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \send_delay[4]_i_1 
       (.I0(\send_delay[21]_i_2_n_0 ),
        .I1(send_delay[4]),
        .O(\send_delay[4]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \send_delay[5]_i_1 
       (.I0(\send_delay[21]_i_2_n_0 ),
        .I1(send_delay[5]),
        .O(\send_delay[5]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \send_delay[6]_i_1 
       (.I0(\send_delay[21]_i_2_n_0 ),
        .I1(send_delay[6]),
        .O(\send_delay[6]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \send_delay[7]_i_1 
       (.I0(\send_delay[21]_i_2_n_0 ),
        .I1(send_delay[7]),
        .O(\send_delay[7]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \send_delay[8]_i_1 
       (.I0(\send_delay[21]_i_2_n_0 ),
        .I1(send_delay[8]),
        .O(\send_delay[8]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \send_delay[9]_i_1 
       (.I0(\send_delay[21]_i_2_n_0 ),
        .I1(send_delay[9]),
        .O(\send_delay[9]_i_1_n_0 ));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  FDCE \send_delay_reg[0] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(rst),
        .D(\send_delay[0]_i_1_n_0 ),
        .Q(send_delay[0]));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  FDCE \send_delay_reg[10] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(rst),
        .D(\send_delay[10]_i_1_n_0 ),
        .Q(send_delay[10]));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  FDCE \send_delay_reg[11] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(rst),
        .D(\send_delay[11]_i_1_n_0 ),
        .Q(send_delay[11]));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  FDCE \send_delay_reg[12] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(rst),
        .D(\send_delay[12]_i_1_n_0 ),
        .Q(send_delay[12]));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  FDCE \send_delay_reg[13] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(rst),
        .D(\send_delay[13]_i_1_n_0 ),
        .Q(send_delay[13]));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  FDCE \send_delay_reg[14] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(rst),
        .D(\send_delay[14]_i_1_n_0 ),
        .Q(send_delay[14]));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  FDCE \send_delay_reg[15] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(rst),
        .D(\send_delay[15]_i_1_n_0 ),
        .Q(send_delay[15]));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  FDCE \send_delay_reg[16] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(rst),
        .D(\send_delay[16]_i_1_n_0 ),
        .Q(send_delay[16]));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  FDCE \send_delay_reg[17] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(rst),
        .D(\send_delay[17]_i_1_n_0 ),
        .Q(send_delay[17]));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  FDCE \send_delay_reg[18] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(rst),
        .D(\send_delay[18]_i_1_n_0 ),
        .Q(send_delay[18]));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  FDCE \send_delay_reg[19] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(rst),
        .D(\send_delay[19]_i_1_n_0 ),
        .Q(send_delay[19]));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  FDCE \send_delay_reg[1] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(rst),
        .D(\send_delay[1]_i_1_n_0 ),
        .Q(send_delay[1]));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  FDCE \send_delay_reg[20] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(rst),
        .D(\send_delay[20]_i_1_n_0 ),
        .Q(send_delay[20]));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  FDCE \send_delay_reg[21] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(rst),
        .D(\send_delay[21]_i_1_n_0 ),
        .Q(send_delay[21]));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  FDCE \send_delay_reg[2] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(rst),
        .D(\send_delay[2]_i_1_n_0 ),
        .Q(send_delay[2]));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  FDCE \send_delay_reg[3] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(rst),
        .D(\send_delay[3]_i_1_n_0 ),
        .Q(send_delay[3]));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  FDCE \send_delay_reg[4] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(rst),
        .D(\send_delay[4]_i_1_n_0 ),
        .Q(send_delay[4]));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  FDCE \send_delay_reg[5] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(rst),
        .D(\send_delay[5]_i_1_n_0 ),
        .Q(send_delay[5]));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  FDCE \send_delay_reg[6] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(rst),
        .D(\send_delay[6]_i_1_n_0 ),
        .Q(send_delay[6]));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  FDCE \send_delay_reg[7] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(rst),
        .D(\send_delay[7]_i_1_n_0 ),
        .Q(send_delay[7]));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  FDCE \send_delay_reg[8] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(rst),
        .D(\send_delay[8]_i_1_n_0 ),
        .Q(send_delay[8]));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  FDCE \send_delay_reg[9] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(rst),
        .D(\send_delay[9]_i_1_n_0 ),
        .Q(send_delay[9]));
  LUT5 #(
    .INIT(32'h00000014)) 
    start_urr_i_1
       (.I0(state[1]),
        .I1(state[0]),
        .I2(state[2]),
        .I3(tx_busy),
        .I4(state[3]),
        .O(start_urr_i_1_n_0));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  FDCE start_urr_reg
       (.C(sys_clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(rst),
        .D(start_urr_i_1_n_0),
        .Q(start_urr));
  (* DONT_TOUCH *) 
  (* FSM_ENCODING = "one_hot" *) 
  (* KEEP = "yes" *) 
  (* use_clock_enable = "false" *) 
  FDCE \state_reg[0] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(rst),
        .D(next_state[0]),
        .Q(state[0]));
  (* DONT_TOUCH *) 
  (* FSM_ENCODING = "one_hot" *) 
  (* KEEP = "yes" *) 
  (* use_clock_enable = "false" *) 
  FDCE \state_reg[1] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(rst),
        .D(next_state[1]),
        .Q(state[1]));
  (* DONT_TOUCH *) 
  (* FSM_ENCODING = "one_hot" *) 
  (* KEEP = "yes" *) 
  (* use_clock_enable = "false" *) 
  FDCE \state_reg[2] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(rst),
        .D(next_state[2]),
        .Q(state[2]));
  (* DONT_TOUCH *) 
  (* FSM_ENCODING = "one_hot" *) 
  (* KEEP = "yes" *) 
  (* use_clock_enable = "false" *) 
  FDCE \state_reg[3] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(rst),
        .D(next_state[3]),
        .Q(state[3]));
  crc_wrapper u_crc_wrap
       (.D(p_0_in1_in[6]),
        .crc_raw({crc_raw[24],crc_raw[22],crc_raw[17:16],crc_raw[8]}),
        .\crc_reg_reg[0] (u_crc_wrap_n_6),
        .\crc_reg_reg[0]_0 (u_crc_wrap_n_22),
        .\crc_reg_reg[1] (u_crc_wrap_n_8),
        .\crc_reg_reg[1]_0 (u_crc_wrap_n_15),
        .\crc_reg_reg[1]_1 (u_crc_wrap_n_16),
        .\crc_reg_reg[30] (fifo_rd_data),
        .\crc_reg_reg[3] (u_crc_wrap_n_20),
        .\crc_reg_reg[4] (u_crc_wrap_n_7),
        .\crc_reg_reg[5] (u_crc_wrap_n_19),
        .\crc_reg_reg[6] (u_crc_wrap_n_23),
        .\crc_reg_reg[7] (u_crc_wrap_n_10),
        .\crc_reg_reg[7]_0 (u_crc_wrap_n_13),
        .mem_reg(u_crc_wrap_n_5),
        .mem_reg_0(u_crc_wrap_n_9),
        .mem_reg_1(u_crc_wrap_n_11),
        .mem_reg_2(u_crc_wrap_n_12),
        .mem_reg_3(u_crc_wrap_n_14),
        .mem_reg_4(u_crc_wrap_n_18),
        .mem_reg_5(u_crc_wrap_n_21),
        .mem_reg_6(u_crc_wrap_n_24),
        .mem_reg_7(u_crc_wrap_n_25),
        .out({crc_reg[30:29],crc_reg[25:24],crc_reg[16],crc_reg[7:0]}));
  fifo u_fifo
       (.Q(fifo_count),
        .\cnt_reg[1]_0 (fifo_wr_en),
        .\cnt_reg[1]_1 (fifo_rd_en),
        .fifo_empty(fifo_empty),
        .fifo_full(fifo_full),
        .in0(fifo_rd_data),
        .mem_reg_0(out),
        .mem_reg_1(mem_reg),
        .module_enable_reg(rst),
        .out(fifo_wr_data),
        .rst_n(rst_n),
        .rst_n_IBUF(rst_n_IBUF),
        .sys_clk_IBUF_BUFG(sys_clk_IBUF_BUFG));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;
    reg GRESTORE_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif
