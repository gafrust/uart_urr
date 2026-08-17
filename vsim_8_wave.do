# ============================================================
# Файл: vsim_8_wave.do
# Исправленная версия – правильные пути и увеличенный зум
# ============================================================

onerror {resume}
quietly WaveActivateNextPane {} 0

# -------------------- Сигналы верхнего уровня тестбенча --------------------
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
add wave -noupdate /tb_uart_top/crc_byte
add wave -noupdate /tb_uart_top/crc_test_active


# -------------------- Внутренние сигналы тестируемого модуля (dut) --------------------
add wave -noupdate -divider {DUT internal}
add wave -noupdate /tb_uart_top/u_top/u_rx/data
add wave -noupdate /tb_uart_top/u_top/cmd_cnt
add wave -noupdate /tb_uart_top/u_top/tx_data
add wave -noupdate /tb_uart_top/u_top/timer_cnt
add wave -noupdate /tb_uart_top/u_top/tx_start
add wave -noupdate /tb_uart_top/u_top/timer_done;     
add wave -noupdate /tb_uart_top/u_top/tx_busy_prev;
add wave -noupdate /tb_uart_top/u_top/rst;

# Группа для UART передатчика
add wave -noupdate -group "UART_TX" /tb_uart_top/u_top/u_tx/*

# Группа для UART приёмника
add wave -noupdate -group "UART_RX" /tb_uart_top/u_top/u_rx/*

# Группа для управляющего модуля URR
add wave -noupdate -group "URR" /tb_uart_top/u_top/u_urr/*

# Группа для управляющего модуля bram
add wave -noupdate -group "bram" /tb_uart_top/u_top/bram/*

# Группа для управляющего модуля urr_crc
add wave -noupdate -group "urr_crc" /tb_uart_top/u_top/u_urr_crc/*

# Группа для управляющего модуля fifo
add wave -noupdate -group "fifo" /tb_uart_top/u_top/u_urr_crc/u_fifo/*

add wave -noupdate /tb_uart_top/u_top/u_urr_crc/u_fifo/mem;

add wave -noupdate /tb_uart_top/u_top/u_urr_crc/collect_start_delay


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

# Увеличиваем видимый диапазон до 500 мкс, чтобы увидеть передачу
WaveRestoreZoom {0 ps} {500 us}
