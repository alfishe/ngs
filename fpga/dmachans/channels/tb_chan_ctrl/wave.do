onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -expand -group clk_rst /tb/clk
add wave -noupdate -expand -group clk_rst -color Magenta /tb/rst_n
add wave -noupdate -expand -group sync /tb/sync_cnt
add wave -noupdate -expand -group sync /tb/pre_sync
add wave -noupdate -expand -group sync /tb/sync_stb
add wave -noupdate -group channel_enas -radix hexadecimal /tb/ch_enas
add wave -noupdate -group rd_data -radix hexadecimal /tb/rd_addr
add wave -noupdate -group rd_data -radix hexadecimal /tb/rd_data
add wave -noupdate -group wr_data -radix hexadecimal /tb/wr_addr
add wave -noupdate -group wr_data -radix hexadecimal /tb/wr_data
add wave -noupdate -group wr_data /tb/wr_stb
add wave -noupdate -group out_data -radix hexadecimal /tb/out_data
add wave -noupdate -group out_data /tb/out_stb_addr
add wave -noupdate -group out_data /tb/out_stb_mix
add wave -noupdate -expand -group chan_ctrl -color {Indian Red} -radix unsigned -radixenum symbolic /tb/chan_ctrl/st
add wave -noupdate -expand -group chan_ctrl -color {Indian Red} -radix unsigned /tb/chan_ctrl/next_st
add wave -noupdate -expand -group chan_ctrl -radix hexadecimal -childformat {{{/tb/chan_ctrl/rd_addr[6]} -radix hexadecimal} {{/tb/chan_ctrl/rd_addr[5]} -radix hexadecimal} {{/tb/chan_ctrl/rd_addr[4]} -radix hexadecimal} {{/tb/chan_ctrl/rd_addr[3]} -radix hexadecimal} {{/tb/chan_ctrl/rd_addr[2]} -radix hexadecimal} {{/tb/chan_ctrl/rd_addr[1]} -radix hexadecimal} {{/tb/chan_ctrl/rd_addr[0]} -radix hexadecimal}} -subitemconfig {{/tb/chan_ctrl/rd_addr[6]} {-height 13 -radix hexadecimal} {/tb/chan_ctrl/rd_addr[5]} {-height 13 -radix hexadecimal} {/tb/chan_ctrl/rd_addr[4]} {-height 13 -radix hexadecimal} {/tb/chan_ctrl/rd_addr[3]} {-height 13 -radix hexadecimal} {/tb/chan_ctrl/rd_addr[2]} {-height 13 -radix hexadecimal} {/tb/chan_ctrl/rd_addr[1]} {-height 13 -radix hexadecimal} {/tb/chan_ctrl/rd_addr[0]} {-height 13 -radix hexadecimal}} /tb/chan_ctrl/rd_addr
add wave -noupdate -expand -group chan_ctrl -radix hexadecimal /tb/chan_ctrl/rd_data
add wave -noupdate -expand -group chan_ctrl -radix hexadecimal /tb/chan_ctrl/wr_addr
add wave -noupdate -expand -group chan_ctrl -radix hexadecimal /tb/chan_ctrl/wr_data
add wave -noupdate -expand -group chan_ctrl -radix hexadecimal /tb/chan_ctrl/wr_stb
add wave -noupdate -expand -group chan_ctrl /tb/chan_ctrl/sync_stb
add wave -noupdate -expand -group chan_ctrl -radix hexadecimal /tb/chan_ctrl/ch_enas
add wave -noupdate -expand -group chan_ctrl -radix hexadecimal /tb/chan_ctrl/out_data
add wave -noupdate -expand -group chan_ctrl /tb/chan_ctrl/out_stb_addr
add wave -noupdate -expand -group chan_ctrl /tb/chan_ctrl/out_stb_mix
add wave -noupdate -expand -group chan_ctrl -radix hexadecimal /tb/chan_ctrl/curr_ch
add wave -noupdate -expand -group chan_ctrl /tb/chan_ctrl/stop
add wave -noupdate -expand -group chan_ctrl /tb/chan_ctrl/ch_ena
add wave -noupdate -expand -group chan_ctrl -radix hexadecimal /tb/chan_ctrl/offset
add wave -noupdate -expand -group chan_ctrl /tb/chan_ctrl/off_cy
add wave -noupdate -expand -group chan_ctrl /tb/chan_ctrl/oversize
add wave -noupdate -expand -group chan_ctrl -radix hexadecimal /tb/chan_ctrl/vol_left
add wave -noupdate -expand -group chan_ctrl -radix hexadecimal /tb/chan_ctrl/vol_right
add wave -noupdate -expand -group chan_ctrl /tb/chan_ctrl/loopena
add wave -noupdate -expand -group chan_ctrl /tb/chan_ctrl/surround
add wave -noupdate -expand -group chan_ctrl -radix hexadecimal /tb/chan_ctrl/base
add wave -noupdate -expand -group chan_ctrl /tb/chan_ctrl/addr_emit
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {1734 ns} 0}
configure wave -namecolwidth 245
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 100
configure wave -griddelta 10
configure wave -timeline 0
configure wave -timelineunits us
update
WaveRestoreZoom {0 ns} {2134 ns}
