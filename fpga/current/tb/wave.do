onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb/clk_fpga
add wave -noupdate /tb/warmres_n
add wave -noupdate /tb/z80/rst_n
add wave -noupdate -divider <NULL>
add wave -noupdate /tb/led_diag
add wave -noupdate -divider <NULL>
add wave -noupdate /tb/int_n
add wave -noupdate -radix hexadecimal /tb/z80/a
add wave -noupdate -radix hexadecimal /tb/z80/d
add wave -noupdate /tb/z80/m1_n
add wave -noupdate /tb/z80/mreq_n
add wave -noupdate /tb/z80/iorq_n
add wave -noupdate /tb/z80/rd_n
add wave -noupdate /tb/z80/wr_n
add wave -noupdate -divider <NULL>
add wave -noupdate /tb/top/my_timer/int_stb
add wave -noupdate -divider <NULL>
add wave -noupdate /tb/top/my_interrupts/ena
add wave -noupdate /tb/top/my_interrupts/req
add wave -noupdate /tb/top/my_interrupts/pri_req
add wave -noupdate /tb/top/my_interrupts/m1_rr
add wave -noupdate /tb/top/my_interrupts/iorq_beg
add wave -noupdate -divider <NULL>
add wave -noupdate /tb/z80/T80a/CLK_n
add wave -noupdate /tb/z80/T80a/M1_n
add wave -noupdate /tb/z80/T80a/MREQ_n
add wave -noupdate /tb/z80/T80a/IORQ_n
add wave -noupdate /tb/z80/T80a/RD_n
add wave -noupdate /tb/z80/T80a/WR_n
add wave -noupdate -divider <NULL>
add wave -noupdate -divider <NULL>
add wave -noupdate -divider <NULL>
add wave -noupdate -divider <NULL>
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {27419000 ps} 0} {{Cursor 2} {80038400 ps} 0}
configure wave -namecolwidth 315
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 416
configure wave -griddelta 8
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {26899100 ps} {27629500 ps}
