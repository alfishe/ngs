onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -radix hexadecimal /tb/z80/d
add wave -noupdate /tb/clk_fpga
add wave -noupdate /tb/warmres_n
add wave -noupdate /tb/z80/rst_n
add wave -noupdate -divider <NULL>
add wave -noupdate /tb/top/my_interrupts/int_stbs
add wave -noupdate /tb/top/my_interrupts/ena
add wave -noupdate /tb/top/my_interrupts/req
add wave -noupdate /tb/top/my_interrupts/pri_req
add wave -noupdate -divider <NULL>
add wave -noupdate /tb/z80/halt_n
add wave -noupdate /tb/int_n
add wave -noupdate -radix hexadecimal /tb/z80/a
add wave -noupdate -radix hexadecimal /tb/z80/d
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
add wave -noupdate -divider <NULL>
add wave -noupdate /tb/top/mp3_clk
add wave -noupdate /tb/top/mp3_dat
add wave -noupdate /tb/top/mp3_req
add wave -noupdate /tb/top/mp3_sync
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
add wave -noupdate -radix hexadecimal /tb/top/dma_mp3/md_din
add wave -noupdate /tb/top/dma_mp3/md_dreq
add wave -noupdate /tb/top/dma_mp3/md_rdy
add wave -noupdate /tb/top/dma_mp3/md_start
add wave -noupdate /tb/top/dma_mp3/dma_on
add wave -noupdate -radix hexadecimal /tb/top/dma_mp3/dma_addr
add wave -noupdate /tb/top/dma_mp3/dma_rnw
add wave -noupdate /tb/top/dma_mp3/dma_req
add wave -noupdate /tb/top/dma_mp3/dma_ack
add wave -noupdate /tb/top/dma_mp3/dma_end
add wave -noupdate -radix hexadecimal /tb/top/dma_mp3/dma_rd
add wave -noupdate -radix unsigned /tb/top/dma_mp3/state
add wave -noupdate -divider <NULL>
add wave -noupdate -radix hexadecimal /tb/top/dma_mp3/dma_fifo_oneshot/rptr
add wave -noupdate -radix hexadecimal /tb/top/dma_mp3/dma_fifo_oneshot/rd
add wave -noupdate /tb/top/dma_mp3/dma_fifo_oneshot/rd_stb
add wave -noupdate /tb/top/dma_mp3/dma_fifo_oneshot/rdone
add wave -noupdate -radix hexadecimal /tb/top/dma_mp3/dma_fifo_oneshot/wptr
add wave -noupdate -radix hexadecimal /tb/top/dma_mp3/dma_fifo_oneshot/wd
add wave -noupdate /tb/top/dma_mp3/dma_fifo_oneshot/wr_stb
add wave -noupdate /tb/top/dma_mp3/dma_fifo_oneshot/wdone
add wave -noupdate /tb/top/dma_mp3/dma_fifo_oneshot/w511
add wave -noupdate -divider <NULL>
add wave -noupdate -divider <NULL>
add wave -noupdate -divider <NULL>
add wave -noupdate -divider <NULL>
add wave -noupdate -divider <NULL>
add wave -noupdate -divider <NULL>
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {1436656000 ps} 0} {{Cursor 2} {429791856000 ps} 0}
configure wave -namecolwidth 310
configure wave -valuecolwidth 73
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
WaveRestoreZoom {304117500 ps} {2033467500 ps}
