onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /top_sqrt_svl/interface_sqrt/rst
add wave -noupdate /top_sqrt_svl/interface_sqrt/clk
add wave -noupdate /top_sqrt_svl/interface_sqrt/eop
add wave -noupdate /top_sqrt_svl/interface_sqrt/val
add wave -noupdate /top_sqrt_svl/interface_sqrt/out
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {400 ns} 0}
quietly wave cursor active 1
configure wave -namecolwidth 268
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
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
WaveRestoreZoom {0 ns} {1325 ns}
