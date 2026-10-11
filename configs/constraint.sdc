current_design picorv32

set clk_name  clk
set clk_port  clk
set clk_period 20.0

create_clock -name $clk_name -period $clk_period [get_ports $clk_port]

set_clock_uncertainty 0.25 [get_clocks $clk_name]
set_clock_transition 0.15 [get_clocks $clk_name]

# Standard 20% setup delay margin for inputs and outputs
set_input_delay -max 4.0 -clock $clk_name [all_inputs -no_clocks]
set_input_delay -min 1.0 -clock $clk_name [all_inputs -no_clocks]

set_output_delay -max 4.0 -clock $clk_name [all_outputs]
set_output_delay -min 1.0 -clock $clk_name [all_outputs]

set_load 0.035 [all_outputs]
set_input_transition 0.25 [all_inputs -no_clocks]
