create_clock -period 15.385 -name sys_clk [get_ports sys_clk]
set_property PACKAGE_PIN AA3 [get_ports sys_clk]
set_property IOSTANDARD LVCMOS18 [get_ports sys_clk]

set_property PACKAGE_PIN Y21 [get_ports uart_rxd]
set_property PACKAGE_PIN Y20 [get_ports uart_txd]
set_property PACKAGE_PIN AD21 [get_ports rs_rx_0]
set_property PACKAGE_PIN AE21 [get_ports rs_tx_0]
set_property PACKAGE_PIN AB21 [get_ports rs_dir_0]

set_property IOSTANDARD LVCMOS33 [get_ports rs_dir_0]
set_property IOSTANDARD LVCMOS33 [get_ports uart_rxd]
set_property IOSTANDARD LVCMOS33 [get_ports uart_txd]
set_property IOSTANDARD LVCMOS33 [get_ports rs_rx_0]
set_property IOSTANDARD LVCMOS33 [get_ports rs_tx_0]

set_property BITSTREAM.CONFIG.SPI_BUSWIDTH 4 [current_design]


