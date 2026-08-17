# ============================================================
# Файл: vsim_wave_updated.do
# Версия для отладки синтезированного дизайна (нетлист)
# Все пути соответствуют инстансам в топ-модуле uart_top
# ============================================================

onerror {resume}
quietly WaveActivateNextPane {} 0

# -------------------- Сигналы тестбенча верхнего уровня --------------------
add wave -noupdate -divider {Testbench top}
add wave -noupdate /tb_uart_top/clk
add wave -noupdate /tb_uart_top/rst_n
add wave -noupdate /tb_uart_top/start
add wave -noupdate /tb_uart_top/cmd
add wave -noupdate /tb_uart_top/tx
add wave -noupdate /tb_uart_top/rx
add wave -noupdate /tb_uart_top/freq
add wave -noupdate /tb_uart_top/done
add wave -noupdate /tb_uart_top/error
#add wave -noupdate /tb_uart_top/crc_byte
add wave -noupdate /tb_uart_top/crc_test_active
add wave -noupdate /tb_uart_top/dir 


add wave -noupdate /tb_uart_top/axi_en_i
add wave -noupdate /tb_uart_top/axi_we_i
add wave -noupdate /tb_uart_top/axi_addr_i
add wave -noupdate /tb_uart_top/axi_data_i
add wave -noupdate /tb_uart_top/axi_vd_o
add wave -noupdate /tb_uart_top/axi_data_o

# -------------------- Сигналы DUT (модуль uart_top) --------------------
add wave -noupdate -divider {DUT Internal}

# Основные управляющие сигналы
add wave -noupdate /tb_uart_top/u_top/module_enable
add wave -noupdate /tb_uart_top/u_top/crc_running
add wave -noupdate /tb_uart_top/u_top/crc_done
add wave -noupdate /tb_uart_top/u_top/crc_match
add wave -noupdate /tb_uart_top/u_top/start_bram
add wave -noupdate /tb_uart_top/u_top/start_urr
add wave -noupdate /tb_uart_top/u_top/start_crc_impulse
add wave -noupdate /tb_uart_top/u_top/cmd_bram
add wave -noupdate /tb_uart_top/u_top/cmd_urr
add wave -noupdate /tb_uart_top/u_top/cmd
add wave -noupdate /tb_uart_top/u_top/tx_start
add wave -noupdate /tb_uart_top/u_top/tx_busy
add wave -noupdate /tb_uart_top/u_top/rx_valid
add wave -noupdate /tb_uart_top/u_top/rx_data
add wave -noupdate /tb_uart_top/u_top/rx_error
add wave -noupdate /tb_uart_top/u_top/dir_OBUF


# -------------------- Группа bram_interface_urr --------------------
add wave -noupdate -divider {BRAM Interface}
add wave -noupdate -group "bram" /tb_uart_top/u_top/bram/*
# Добавляем отдельно важные сигналы bram
add wave -noupdate /tb_uart_top/u_top/bram/axi_vd_reg_reg
add wave -noupdate /tb_uart_top/u_top/bram/reg_ctrl_reg
add wave -noupdate /tb_uart_top/u_top/bram/reg_cmd_reg
add wave -noupdate /tb_uart_top/u_top/bram/reg_uart_result_reg
add wave -noupdate /tb_uart_top/u_top/bram/reg_crc_result_reg
add wave -noupdate /tb_uart_top/u_top/bram/crc_match_flag_reg
add wave -noupdate /tb_uart_top/u_top/bram/uart_done_flag_reg
add wave -noupdate /tb_uart_top/u_top/bram/uart_error_flag_reg

# -------------------- Группа urr_crc (включая fifo и crc) --------------------
add wave -noupdate -divider {URR_CRC}
add wave -noupdate -group "urr_crc" /tb_uart_top/u_top/u_urr_crc/*
# Сигналы из FSM
add wave -noupdate /tb_uart_top/u_top/u_urr_crc/state
add wave -noupdate /tb_uart_top/u_top/u_urr_crc/next_state
add wave -noupdate /tb_uart_top/u_top/u_urr_crc/byte_cnt_reg
add wave -noupdate /tb_uart_top/u_top/u_urr_crc/byte_cnt_255_reg
add wave -noupdate /tb_uart_top/u_top/u_urr_crc/read_cnt_reg
add wave -noupdate /tb_uart_top/u_top/u_urr_crc/cmd_cnt_reg
add wave -noupdate /tb_uart_top/u_top/u_urr_crc/cmd_urr_reg
add wave -noupdate /tb_uart_top/u_top/u_urr_crc/crc_received_reg
add wave -noupdate /tb_uart_top/u_top/u_urr_crc/crc_reg
add wave -noupdate /tb_uart_top/u_top/u_urr_crc/crc_result


# Подгруппа FIFO
add wave -noupdate -group "fifo" /tb_uart_top/u_top/u_urr_crc/u_fifo/*
add wave -noupdate /tb_uart_top/u_top/u_urr_crc/u_fifo/mem
add wave -noupdate /tb_uart_top/u_top/u_urr_crc/u_fifo/wr_ptr
add wave -noupdate /tb_uart_top/u_top/u_urr_crc/u_fifo/rd_ptr
add wave -noupdate /tb_uart_top/u_top/u_urr_crc/u_fifo/cnt_reg
add wave -noupdate /tb_uart_top/u_top/u_urr_crc/u_fifo/fifo_full
add wave -noupdate /tb_uart_top/u_top/u_urr_crc/u_fifo/fifo_wr_en
add wave -noupdate /tb_uart_top/u_top/u_urr_crc/u_fifo/fifo_rd_en_st
add wave -noupdate /tb_uart_top/u_top/u_urr_crc/u_fifo/rd_data

# Подгруппа CRC wrapper
add wave -noupdate -group "crc_wrap" /tb_uart_top/u_top/u_urr_crc/u_crc_wrap/*
add wave -noupdate /tb_uart_top/u_top/u_urr_crc/u_crc_wrap/crc_raw

# -------------------- Группа urr (протокол URR) --------------------
add wave -noupdate -divider {URR}
add wave -noupdate -group "urr" /tb_uart_top/u_top/u_urr/*
add wave -noupdate /tb_uart_top/u_top/u_urr/state
add wave -noupdate /tb_uart_top/u_top/u_urr/byte_cnt_reg
add wave -noupdate /tb_uart_top/u_top/u_urr/timeout_cnt_reg
add wave -noupdate /tb_uart_top/u_top/u_urr/rx_pending_reg
add wave -noupdate /tb_uart_top/u_top/u_urr/freq_reg
add wave -noupdate /tb_uart_top/u_top/u_urr/dir

# -------------------- Группа UART_TX --------------------
add wave -noupdate -divider {UART TX}
add wave -noupdate -group "uart_tx" /tb_uart_top/u_top/u_tx/*
add wave -noupdate /tb_uart_top/u_top/u_tx/baud_cnt
add wave -noupdate /tb_uart_top/u_top/u_tx/bit_cnt_reg
add wave -noupdate /tb_uart_top/u_top/u_tx/shift_reg
add wave -noupdate /tb_uart_top/u_top/u_tx/tx_reg

# -------------------- Группа UART_RX --------------------
add wave -noupdate -divider {UART RX}
add wave -noupdate -group "uart_rx" /tb_uart_top/u_top/u_rx/*
add wave -noupdate /tb_uart_top/u_top/u_rx/baud_cnt
add wave -noupdate /tb_uart_top/u_top/u_rx/bit_cnt_reg
add wave -noupdate /tb_uart_top/u_top/u_rx/shift_reg
add wave -noupdate /tb_uart_top/u_top/u_rx/rx_sync1
add wave -noupdate /tb_uart_top/u_top/u_rx/rx_sync2
add wave -noupdate /tb_uart_top/u_top/u_rx/rx_falling
add wave -noupdate /tb_uart_top/u_top/u_rx/receiving
add wave -noupdate /tb_uart_top/u_top/u_rx/valid_reg

# -------------------- Настройки отображения --------------------
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ps} 0} {{Cursor 2} {0 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 250
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update

# Увеличиваем видимый диапазон до 1 мс для наблюдения полного цикла
WaveRestoreZoom {0 ps} {1 ms}
