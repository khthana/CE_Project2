onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -format Logic /datapath/clock
add wave -noupdate -format Logic /datapath/reset
add wave -noupdate -format Literal -radix hexadecimal /datapath/inst_byte1
add wave -noupdate -format Literal -radix hexadecimal /datapath/inst_byte2
add wave -noupdate -format Literal -radix hexadecimal /datapath/inst_byte3
add wave -noupdate -format Literal -radix hexadecimal /datapath/acc
add wave -noupdate -format Logic -radix hexadecimal /datapath/carry
add wave -noupdate -format Logic -radix hexadecimal /datapath/overflow
add wave -noupdate -format Logic -radix hexadecimal /datapath/aux_carry
add wave -noupdate -format Literal -radix hexadecimal /datapath/read_addr
add wave -noupdate -format Literal -radix hexadecimal /datapath/read_data
add wave -noupdate -format Literal -radix hexadecimal /datapath/write_addr0
add wave -noupdate -format Literal -radix hexadecimal /datapath/write_data0
add wave -noupdate -format Literal -radix hexadecimal /datapath/write_addr1
add wave -noupdate -format Literal -radix hexadecimal /datapath/write_data1
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {1805 ps} 0}
WaveRestoreZoom {0 ps} {3092 ps}
configure wave -namecolwidth 150
configure wave -valuecolwidth 40
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
