# ============================================================
# Файл: vsim_8_wave.do
# Исправленная версия – правильные пути и увеличенный зум
# ============================================================

onerror {resume}
quietly WaveActivateNextPane {} 0

# -------------------- Сигналы верхнего уровня тестбенча --------------------
add wave -noupdate -divider {Testbench top}
add wave -noupdate /tb_urr/sys_clk
add wave -noupdate /tb_urr/rst_p
add wave -noupdate /tb_urr/tx
add wave -noupdate /tb_urr/rx
add wave -noupdate /tb_urr.crc_result_read
add wave -noupdate /tb_urr.en_i
add wave -noupdate /tb_urr/err_freq_code_o


#add wave -noupdate /tb_urr/error
#add wave -noupdate /tb_urr/crc_byte
#add wave -noupdate /tb_urr/crc_test_active






# -------------------- Внутренние сигналы тестируемого модуля (dut) --------------------
add wave -noupdate -divider {DUT internal}
add wave -noupdate /tb_urr/u_top/u_rx/data
add wave -noupdate /tb_urr/u_top/cmd_cnt
add wave -noupdate /tb_urr/u_top/tx_data
add wave -noupdate /tb_urr/u_top/timer_cnt
add wave -noupdate /tb_urr/u_top/tx_start
add wave -noupdate /tb_urr/u_top/timer_done;     
add wave -noupdate /tb_urr/u_top/tx_busy_prev;

add wave -noupdate /tb_urr/u_top/freq;
add wave -noupdate /tb_urr/u_top/done;
add wave -noupdate /tb_urr/u_top/urr_connected_i;
add wave -noupdate /tb_urr/u_top/irq_con_o;
add wave -noupdate /tb_urr/u_top/irq_o;
add wave -noupdate /tb_urr/u_top/dir;
add wave -noupdate /tb_urr/u_top/is_connected_o;
add wave -noupdate /tb_urr/u_top/is_con_1;
add wave -noupdate /tb_urr/u_top/is_con_2;
add wave -noupdate /tb_urr/u_top/in_rising;
add wave -noupdate /tb_urr/u_top/in_descending;

# Группа для UART передатчика
add wave -noupdate -group "uart_tx" /tb_urr/u_top/u_tx/*

# Группа для UART приёмника
add wave -noupdate -group "uart_rx" /tb_urr/u_top/u_rx/*

# Группа для управляющего модуля URR
add wave -noupdate -group "URR" /tb_urr/u_top/u_urr/*


# Группа для управляющего модуля urr_crc
add wave -noupdate -group "urr_crc" /tb_urr/u_top/u_urr_crc/*

# Группа для управляющего модуля fifo
add wave -noupdate -group "fifo" /tb_urr/u_top/u_urr_crc/u_fifo/*

# Группа для pulse_irq_con_o
add wave -noupdate -group "pulse_irq_con_o" /tb_urr/u_top/pulse_irq_con_o/*

# Группа для модуля rdy_ctrl_simple
add wave -noupdate -group "rdy_ctrl_simple" /tb_urr/u_top/rdy_ctrl_simple/*



# Группа для pulse_irq_o
add wave -noupdate -group "pulse_irq_o" /tb_urr/u_top/pulse_irq_o/*

add wave -noupdate /tb_urr/u_top/u_urr_crc/u_fifo/mem;

add wave -noupdate /tb_urr/u_top/u_urr_crc/collect_start_delay


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
