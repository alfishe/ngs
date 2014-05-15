onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb/clk_fpga
add wave -noupdate /tb/clk_24mhz
add wave -noupdate /tb/clk_zx
add wave -noupdate -divider <NULL>
add wave -noupdate /tb/top/zxbus_rst_n
add wave -noupdate /tb/top/rom_rst_n
add wave -noupdate /tb/top/z80res_n
add wave -noupdate -divider <NULL>
add wave -noupdate /tb/zxiorq_n
add wave -noupdate /tb/zxrd_n
add wave -noupdate /tb/zxwr_n
add wave -noupdate /tb/zxbusena_n
add wave -noupdate /tb/zxbusin
add wave -noupdate -radix hexadecimal /tb/zxa
add wave -noupdate -radix hexadecimal /tb/zxd
add wave -noupdate -radix hexadecimal /tb/zxid
add wave -noupdate /tb/zxena
add wave -noupdate -divider <NULL>
add wave -noupdate /tb/top/zxbus/addr_ok
add wave -noupdate /tb/top/zxbus/init
add wave -noupdate /tb/top/zxbus/init_in_progress
add wave -noupdate /tb/top/zxbus/io_begin
add wave -noupdate /tb/top/zxbus/io_end
add wave -noupdate /tb/top/zxbus/iord
add wave -noupdate /tb/top/zxbus/iord_begin
add wave -noupdate /tb/top/zxbus/iord_end
add wave -noupdate /tb/top/zxbus/iord_r
add wave -noupdate /tb/top/zxbus/iowr
add wave -noupdate /tb/top/zxbus/iowr_begin
add wave -noupdate /tb/top/zxbus/iowr_end
add wave -noupdate /tb/top/zxbus/iowr_r
add wave -noupdate /tb/top/zxbus/led
add wave -noupdate -radix hexadecimal /tb/top/zxbus/rd_buffer
add wave -noupdate /tb/top/zxbus/rd_data
add wave -noupdate -radix hexadecimal /tb/top/zxbus/read_data
add wave -noupdate /tb/top/zxbus/regsel
add wave -noupdate -radix hexadecimal /tb/top/zxbus/test_reg
add wave -noupdate -radix hexadecimal /tb/top/zxbus/test_reg_pre
add wave -noupdate /tb/top/zxbus/test_reg_write
add wave -noupdate /tb/top/zxbus/wr_addr
add wave -noupdate /tb/top/zxbus/wr_buffer
add wave -noupdate /tb/top/zxbus/wr_data
add wave -noupdate -radix hexadecimal /tb/top/zxbus/zxa
add wave -noupdate /tb/top/zxbus/zxblkiorq_n
add wave -noupdate /tb/top/zxbus/zxbusena_n
add wave -noupdate /tb/top/zxbus/zxbusin
add wave -noupdate -radix hexadecimal /tb/top/zxbus/zxid
add wave -noupdate -radix hexadecimal /tb/top/zxbus/zxid_in
add wave -noupdate /tb/top/zxbus/zxid_oe
add wave -noupdate -radix hexadecimal /tb/top/zxbus/zxid_out
add wave -noupdate /tb/top/zxbus/zxiorq_n
add wave -noupdate /tb/top/zxbus/zxmreq_n
add wave -noupdate /tb/top/zxbus/zxrd_n
add wave -noupdate /tb/top/zxbus/zxwr_n
add wave -noupdate -divider <NULL>
add wave -noupdate /tb/top/reset/clk_24mhz
add wave -noupdate /tb/top/reset/clk_fpga
add wave -noupdate /tb/top/reset/init
add wave -noupdate /tb/top/reset/init_in_progress
add wave -noupdate -radix hexadecimal /tb/top/reset/poweron_rst_cnt
add wave -noupdate /tb/top/reset/poweron_rst_n
add wave -noupdate /tb/top/reset/rom_rst_n
add wave -noupdate -radix hexadecimal /tb/top/reset/rz_rst_cnt
add wave -noupdate /tb/top/reset/rz_rst_n
add wave -noupdate /tb/top/reset/z80_busak_n
add wave -noupdate /tb/top/reset/z80_busrq_n
add wave -noupdate /tb/top/reset/z80_halted
add wave -noupdate /tb/top/reset/z80_rst2
add wave -noupdate /tb/top/reset/z80_rst_n
add wave -noupdate /tb/top/reset/zxbus_rst_n
add wave -noupdate -divider <NULL>
add wave -noupdate /tb/rom_emu/ce_n
add wave -noupdate /tb/rom_emu/oe_n
add wave -noupdate /tb/rom_emu/we_n
add wave -noupdate -radix hexadecimal /tb/rom_emu/a
add wave -noupdate -radix hexadecimal /tb/rom_emu/d
add wave -noupdate /tb/rom_emu/rd_stb
add wave -noupdate /tb/rom_emu/wr_stb
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {26131040230 ps} 0}
configure wave -namecolwidth 315
configure wave -valuecolwidth 112
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 104
configure wave -griddelta 10
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {26066401726 ps} {26195678734 ps}
