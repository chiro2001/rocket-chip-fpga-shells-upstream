#Generated by Fabric Compiler ( version 2020.3 <build 62942> ) at Tue Dec 22 08:59:12 2020

set_arch -family Logos -device PGL22G -speedgrade -6 -package MBG324
synthesize -synplify_pro -selected_syn_tool_opt 1 -top_module ipsl_hmic_h_top_test
set_arch -family Logos -device PGL22G -speedgrade -6 -package MBG324
compile -top_module ipsl_hmic_h_top_test
synthesize -ads -selected_syn_tool_opt 2 
dev_map 
pnr 
report_timing 
gen_bit_stream 
set_arch -family Logos -device PGL22G -speedgrade -6 -package MBG324
compile -top_module ipsl_hmic_h_top_test
synthesize -ads -selected_syn_tool_opt 2 
dev_map 
pnr 
report_timing 
gen_bit_stream 
add_simulation "E:/PGL22G/demo/09_ddr3_test/ipcore/ddr3_core/example_design/bench/ddr_test_top_tb.v"
remove_simulation "E:/PGL22G/demo/09_ddr3_test/ipcore/ddr3_core/example_design/bench/ddr_test_top_tb.v"
add_design "E:/PGL22G/demo/09_ddr3_test/ipcore/ddr3_core/example_design/bench/ddr_test_top_tb.v"
add_design "E:/PGL22G/demo/09_ddr3_test/ipcore/ddr3_core/example_design/bench/mem/ddr2.v"
add_design "E:/PGL22G/demo/09_ddr3_test/ipcore/ddr3_core/example_design/bench/mem/ddr3.v"
add_design "E:/PGL22G/demo/09_ddr3_test/ipcore/ddr3_core/example_design/bench/mem/mobile_ddr.v"
remove_design -verilog "E:/PGL22G/demo/09_ddr3_test/ipcore/ddr3_core/example_design/bench/mem/mobile_ddr.v"
remove_design -verilog "E:/PGL22G/demo/09_ddr3_test/ipcore/ddr3_core/example_design/bench/mem/ddr2.v"
remove_design -verilog "E:/PGL22G/demo/09_ddr3_test/ipcore/ddr3_core/example_design/bench/mem/ddr3.v"
remove_design -verilog "E:/PGL22G/demo/09_ddr3_test/ipcore/ddr3_core/ddr3_core.v"
remove_design -verilog "E:/PGL22G/demo/09_ddr3_test/ipcore/ddr3_core/example_design/bench/ddr_test_top_tb.v"
add_design "E:/PGL22G/demo/09_ddr3_test/ipcore/ddr3_core/ddr3_core.v"
set_arch -family Logos -device PGL22G -speedgrade -6 -package MBG324
compile -top_module ipsl_hmic_h_top_test
synthesize -ads -selected_syn_tool_opt 2 
dev_map 
pnr 
report_timing 
gen_bit_stream 
add_simulation "E:/PGL22G/demo/09_ddr3_test/ipcore/ddr3_core/example_design/bench/ddr_test_top_tb.v"
add_simulation "E:/PGL22G/demo/09_ddr3_test/ipcore/ddr3_core/example_design/bench/mem/ddr2.v"
add_simulation "E:/PGL22G/demo/09_ddr3_test/ipcore/ddr3_core/example_design/bench/mem/ddr3.v"
add_simulation "E:/PGL22G/demo/09_ddr3_test/ipcore/ddr3_core/example_design/bench/mem/mobile_ddr.v"
remove_simulation "E:/PGL22G/demo/09_ddr3_test/ipcore/ddr3_core/example_design/bench/ddr_test_top_tb.v"
remove_simulation "E:/PGL22G/demo/09_ddr3_test/ipcore/ddr3_core/example_design/bench/mem/ddr3.v"
remove_simulation "E:/PGL22G/demo/09_ddr3_test/ipcore/ddr3_core/example_design/bench/mem/mobile_ddr.v"
remove_simulation "E:/PGL22G/demo/09_ddr3_test/ipcore/ddr3_core/example_design/bench/mem/ddr2.v"
set_arch -family Logos -device PGL22G -speedgrade -6 -package MBG324
compile -top_module ipsl_hmic_h_top_test
synthesize -ads -selected_syn_tool_opt 2 
dev_map 
pnr 
report_timing 
gen_bit_stream 