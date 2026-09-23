# Combo II-DLD S75 / xc7s75fgga484-1 / main clock 1 kHz.
# Pin source and array polarity: evidence/board-pin-provenance.json.

set_property PACKAGE_PIN B6 [get_ports {clk}]
set_property IOSTANDARD LVCMOS33 [get_ports {clk}]

set_property PACKAGE_PIN K4 [get_ports {rst}]
set_property IOSTANDARD LVCMOS33 [get_ports {rst}]

set_property PACKAGE_PIN N8 [get_ports {button}]
set_property IOSTANDARD LVCMOS33 [get_ports {button}]

set_property PACKAGE_PIN U4 [get_ports {sw[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {sw[0]}]

set_property PACKAGE_PIN V4 [get_ports {sw[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {sw[1]}]

set_property PACKAGE_PIN W1 [get_ports {sw[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {sw[2]}]

set_property PACKAGE_PIN W4 [get_ports {sw[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {sw[3]}]

set_property PACKAGE_PIN T1 [get_ports {sw[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {sw[4]}]

set_property PACKAGE_PIN U2 [get_ports {sw[5]}]
set_property IOSTANDARD LVCMOS33 [get_ports {sw[5]}]

set_property PACKAGE_PIN W3 [get_ports {sw[6]}]
set_property IOSTANDARD LVCMOS33 [get_ports {sw[6]}]

set_property PACKAGE_PIN Y1 [get_ports {sw[7]}]
set_property IOSTANDARD LVCMOS33 [get_ports {sw[7]}]

set_property PACKAGE_PIN N5 [get_ports {led[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led[0]}]

set_property PACKAGE_PIN M1 [get_ports {led[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led[1]}]

set_property PACKAGE_PIN M3 [get_ports {led[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led[2]}]

set_property PACKAGE_PIN M7 [get_ports {led[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led[3]}]

set_property PACKAGE_PIN N7 [get_ports {led[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led[4]}]

set_property PACKAGE_PIN M2 [get_ports {led[5]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led[5]}]

set_property PACKAGE_PIN M4 [get_ports {led[6]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led[6]}]

set_property PACKAGE_PIN L4 [get_ports {led[7]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led[7]}]

set_property PACKAGE_PIN H2 [get_ports {seg_data[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {seg_data[0]}]

set_property PACKAGE_PIN J7 [get_ports {seg_data[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {seg_data[1]}]

set_property PACKAGE_PIN J3 [get_ports {seg_data[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {seg_data[2]}]

set_property PACKAGE_PIN J1 [get_ports {seg_data[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {seg_data[3]}]

set_property PACKAGE_PIN E4 [get_ports {seg_data[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {seg_data[4]}]

set_property PACKAGE_PIN E2 [get_ports {seg_data[5]}]
set_property IOSTANDARD LVCMOS33 [get_ports {seg_data[5]}]

set_property PACKAGE_PIN F5 [get_ports {seg_data[6]}]
set_property IOSTANDARD LVCMOS33 [get_ports {seg_data[6]}]

set_property PACKAGE_PIN F1 [get_ports {seg_data[7]}]
set_property IOSTANDARD LVCMOS33 [get_ports {seg_data[7]}]

set_property PACKAGE_PIN K5 [get_ports {seg_com[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {seg_com[0]}]

set_property PACKAGE_PIN K3 [get_ports {seg_com[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {seg_com[1]}]

set_property PACKAGE_PIN K1 [get_ports {seg_com[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {seg_com[2]}]

set_property PACKAGE_PIN L6 [get_ports {seg_com[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {seg_com[3]}]

set_property PACKAGE_PIN G3 [get_ports {seg_com[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {seg_com[4]}]

set_property PACKAGE_PIN G1 [get_ports {seg_com[5]}]
set_property IOSTANDARD LVCMOS33 [get_ports {seg_com[5]}]

set_property PACKAGE_PIN H6 [get_ports {seg_com[6]}]
set_property IOSTANDARD LVCMOS33 [get_ports {seg_com[6]}]

set_property PACKAGE_PIN H4 [get_ports {seg_com[7]}]
set_property IOSTANDARD LVCMOS33 [get_ports {seg_com[7]}]

create_clock -name trainer_1khz -period 1000000.000 [get_ports clk]

set_false_path -from [get_ports {rst button sw[*]}]
