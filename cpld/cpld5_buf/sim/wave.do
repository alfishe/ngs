onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -format Logic /tb/clk20
add wave -noupdate -format Logic /tb/clk24
add wave -noupdate -format Literal /tb/clksel
add wave -noupdate -format Logic /tb/clkout
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {3016000 ps} 0}
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 178
configure wave -gridperiod 356
configure wave -griddelta 8
configure wave -timeline 0
update
WaveRestoreZoom {1548900 ps} {3236900 ps}
