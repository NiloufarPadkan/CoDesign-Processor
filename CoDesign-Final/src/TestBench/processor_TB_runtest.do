SetActiveLib -work
comp -include "$dsn\src\Processor.vhd" 
comp -include "$dsn\src\TestBench\processor_TB.vhd" 
asim +access +r TESTBENCH_FOR_processor 
wave 
wave -noreg CLK
wave -noreg out0
wave -noreg out1
wave -noreg out2
wave -noreg out3
# The following lines can be used for timing simulation
# acom <backannotated_vhdl_file_name>
# comp -include "$dsn\src\TestBench\processor_TB_tim_cfg.vhd" 
# asim +access +r TIMING_FOR_processor 
