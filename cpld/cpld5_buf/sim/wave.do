onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -format Logic /tb/clk20
add wave -noupdate -format Logic /tb/clk24
add wave -noupdate -format Literal /tb/clksel
add wave -noupdate -format Logic /tb/clkout
add wave -noupdate -divider <NULL>
add wave -noupdate -format Logic /tb/clkin
add wave -noupdate -format Logic /tb/coldres_n
add wave -noupdate -format Logic /tb/warmres_n
add wave -noupdate -divider <NULL>
add wave -noupdate -format Logic /tb/config_n
add wave -noupdate -format Logic {/tb/DUT/\config_n~reg0_I\/aclr}
add wave -noupdate -format Logic {/tb/DUT/\config_n~reg0_I\/clk}
add wave -noupdate -format Logic {/tb/DUT/\config_n~reg0_I\/combo}
add wave -noupdate -format Logic {/tb/DUT/\config_n~reg0_I\/dataout}
add wave -noupdate -format Logic {/tb/DUT/\config_n~reg0_I\/dffin}
add wave -noupdate -format Logic {/tb/DUT/\config_n~reg0_I\/dffo}
add wave -noupdate -format Logic {/tb/DUT/\config_n~reg0_I\/fbk}
add wave -noupdate -format Logic {/tb/DUT/\config_n~reg0_I\/fpin}
add wave -noupdate -format Literal {/tb/DUT/\config_n~reg0_I\/operation_mode}
add wave -noupdate -format Literal {/tb/DUT/\config_n~reg0_I\/output_mode}
add wave -noupdate -format Literal {/tb/DUT/\config_n~reg0_I\/paclr}
add wave -noupdate -format Literal {/tb/DUT/\config_n~reg0_I\/papre}
add wave -noupdate -format Literal {/tb/DUT/\config_n~reg0_I\/pclk}
add wave -noupdate -format Literal {/tb/DUT/\config_n~reg0_I\/pena}
add wave -noupdate -format Literal {/tb/DUT/\config_n~reg0_I\/pexp_mode}
add wave -noupdate -format Logic {/tb/DUT/\config_n~reg0_I\/pexpin}
add wave -noupdate -format Logic {/tb/DUT/\config_n~reg0_I\/pexpout}
add wave -noupdate -format Literal {/tb/DUT/\config_n~reg0_I\/power_up}
add wave -noupdate -format Literal {/tb/DUT/\config_n~reg0_I\/pterm0}
add wave -noupdate -format Literal {/tb/DUT/\config_n~reg0_I\/pterm1}
add wave -noupdate -format Literal {/tb/DUT/\config_n~reg0_I\/pterm2}
add wave -noupdate -format Literal {/tb/DUT/\config_n~reg0_I\/pterm3}
add wave -noupdate -format Literal {/tb/DUT/\config_n~reg0_I\/pterm4}
add wave -noupdate -format Literal {/tb/DUT/\config_n~reg0_I\/pterm5}
add wave -noupdate -format Literal {/tb/DUT/\config_n~reg0_I\/pxor}
add wave -noupdate -format Literal {/tb/DUT/\config_n~reg0_I\/register_mode}
add wave -noupdate -format Logic /tb/status_n
add wave -noupdate -format Logic /tb/conf_done
add wave -noupdate -format Logic /tb/init_done
add wave -noupdate -format Logic /tb/cs
add wave -noupdate -divider <NULL>
add wave -noupdate -format Logic /tb/mreq_n
add wave -noupdate -format Logic /tb/iorq_n
add wave -noupdate -format Logic /tb/rd_n
add wave -noupdate -format Logic /tb/wr_n
add wave -noupdate -format Literal -radix hexadecimal /tb/zaddr
add wave -noupdate -format Literal -radix hexadecimal /tb/zdata
add wave -noupdate -divider <NULL>
add wave -noupdate -format Logic /tb/mema14
add wave -noupdate -format Logic /tb/mema15
add wave -noupdate -format Logic /tb/mema19
add wave -noupdate -format Logic /tb/memoe_n
add wave -noupdate -format Logic /tb/memwe_n
add wave -noupdate -format Logic /tb/romcs_n
add wave -noupdate -divider <NULL>
add wave -noupdate -format Logic /tb/in_ramcs0_n
add wave -noupdate -format Logic /tb/in_ramcs1_n
add wave -noupdate -format Logic /tb/in_ramcs2_n
add wave -noupdate -format Logic /tb/in_ramcs3_n
add wave -noupdate -format Logic /tb/mema19
add wave -noupdate -format Logic /tb/out_ramcs0_n
add wave -noupdate -format Logic /tb/out_ramcs1_n
add wave -noupdate -divider <NULL>
add wave -noupdate -format Literal -radix hexadecimal /tb/mdata
add wave -noupdate -format Logic /tb/ma6
add wave -noupdate -format Logic /tb/ma7
add wave -noupdate -format Logic /tb/ma10
add wave -noupdate -format Logic /tb/ma11
add wave -noupdate -format Logic /tb/ma12
add wave -noupdate -format Logic /tb/ma13
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {4645620 ps} 0}
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 154165
configure wave -gridperiod 100000
configure wave -griddelta 8
configure wave -timeline 1
update
WaveRestoreZoom {959450 ps} {2802535 ps}
