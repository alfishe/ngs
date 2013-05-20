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
add wave -noupdate -radix hexadecimal -childformat {{{/tb/z80/d[7]} -radix hexadecimal} {{/tb/z80/d[6]} -radix hexadecimal} {{/tb/z80/d[5]} -radix hexadecimal} {{/tb/z80/d[4]} -radix hexadecimal} {{/tb/z80/d[3]} -radix hexadecimal} {{/tb/z80/d[2]} -radix hexadecimal} {{/tb/z80/d[1]} -radix hexadecimal} {{/tb/z80/d[0]} -radix hexadecimal}} -subitemconfig {{/tb/z80/d[7]} {-height 15 -radix hexadecimal} {/tb/z80/d[6]} {-height 15 -radix hexadecimal} {/tb/z80/d[5]} {-height 15 -radix hexadecimal} {/tb/z80/d[4]} {-height 15 -radix hexadecimal} {/tb/z80/d[3]} {-height 15 -radix hexadecimal} {/tb/z80/d[2]} {-height 15 -radix hexadecimal} {/tb/z80/d[1]} {-height 15 -radix hexadecimal} {/tb/z80/d[0]} {-height 15 -radix hexadecimal}} /tb/z80/d
add wave -noupdate /tb/z80/m1_n
add wave -noupdate /tb/z80/mreq_n
add wave -noupdate /tb/z80/iorq_n
add wave -noupdate /tb/z80/rd_n
add wave -noupdate /tb/z80/wr_n
add wave -noupdate /tb/z80/busrq_n
add wave -noupdate /tb/z80/busak_n
add wave -noupdate -divider <NULL>
add wave -noupdate -radix hexadecimal {/tb/ram_block[0]/ram/a}
add wave -noupdate -radix hexadecimal {/tb/ram_block[0]/ram/d}
add wave -noupdate {/tb/ram_block[0]/ram/ce_n}
add wave -noupdate {/tb/ram_block[0]/ram/oe_n}
add wave -noupdate {/tb/ram_block[0]/ram/we_n}
add wave -noupdate -divider <NULL>
add wave -noupdate /tb/top/sd_clk
add wave -noupdate /tb/top/sd_di
add wave -noupdate /tb/top/sd_do
add wave -noupdate -divider <NULL>
add wave -noupdate /tb/top/dma_sd/dma_on
add wave -noupdate -radix hexadecimal /tb/top/dma_sd/sd_recvdata
add wave -noupdate /tb/top/dma_sd/sd_start
add wave -noupdate /tb/top/dma_sd/sd_rdy
add wave -noupdate -radix hexadecimal /tb/top/dma_sd/dma_addr
add wave -noupdate /tb/top/dma_sd/dma_req
add wave -noupdate /tb/top/dma_sd/dma_ack
add wave -noupdate /tb/top/dma_sd/dma_end
add wave -noupdate /tb/top/dma_sd/dma_rnw
add wave -noupdate -radix hexadecimal /tb/top/dma_sd/dma_wd
add wave -noupdate -radix unsigned /tb/top/dma_sd/state
add wave -noupdate -divider <NULL>
add wave -noupdate -radix hexadecimal /tb/top/dma_sd/dma_fifo_oneshot/rd
add wave -noupdate /tb/top/dma_sd/dma_fifo_oneshot/rd_stb
add wave -noupdate /tb/top/dma_sd/dma_fifo_oneshot/rdone
add wave -noupdate -radix hexadecimal /tb/top/dma_sd/dma_fifo_oneshot/rptr
add wave -noupdate -radix hexadecimal /tb/top/dma_sd/dma_fifo_oneshot/wd
add wave -noupdate /tb/top/dma_sd/dma_fifo_oneshot/wr_stb
add wave -noupdate /tb/top/dma_sd/dma_fifo_oneshot/wdone
add wave -noupdate /tb/top/dma_sd/dma_fifo_oneshot/w511
add wave -noupdate -radix hexadecimal /tb/top/dma_sd/dma_fifo_oneshot/wptr
add wave -noupdate -divider <NULL>
add wave -noupdate -divider <NULL>
add wave -noupdate -divider <NULL>
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {34278400 ps} 0} {{Cursor 2} {429791856000 ps} 0}
configure wave -namecolwidth 315
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 41600
configure wave -griddelta 8
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {30410 ns} {30890524 ps}
