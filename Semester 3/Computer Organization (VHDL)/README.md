
# Computer Organization (VHDL)
This folder contains multiple scripts written in 

*VHDL*. The scripts where part of my excercises 

for this subject.
These scripts were tested using "**ModelSim - 

Intel FPGA Starter Edition 10.5c (Quartus Prime 

Pro 17.1)**"!
## Let's cut to the chase

### Installation
For **Simple Logical Gates**:

 Run the files directly in ModelSim without 

including any other component.

    cd:/path/
    vlib work
    vmap work work
    vcom filename.vhd
    vsim entity_name
    add wave *
    force input_name value
    run time
    ...
Actual Example

    cd "C:/..../Semester 3/Computer Organization 

(VHDL)/1_Simple Logical Gates"
    vlib work
    vmap work work
    vcom nand2/dataflow.vhd
    vsim nand2
    add wave *
    force inp1 '1'
    force inp2 '0'
    run 30ps
    force inp1 '1'
    force inp2 '1'
    run 30ps
  
For **Simple Circuits Designs**:

You must include the **required components**! For 

this example lets consider that the components are 

inside the folder circ1.

    cd "C:/..../Semester 3/2_Simple Circuits 

Designs/circ1"
    vlib work
    vmap work work
    vcom and3NRR.vhd and3RRR.vhd or2.vhd 

structural.vhd
    vsim circ1
    do run_inp4.do
The run_inp4.do is a file automates the process of 

forcing and running the script.  [More info about 

.do files]

(https://www.xilinx.com/itp/xilinx10/help/platform

_studio/ps_c_sim_using_script_files_load_stim_sim_

modelsim.htm)

**For the Rest**:

The rest of VHDL Code included here runs using 

**Testbenches**. As result, you only need to run 

the Testbench to receive the results & test if 

they are correct.
To run a testbench

    ......
    vcom <components> full_adder.vhd 

full_adder_4bit.vhd full_adder_4bit_tb.vhd
    vsim full_adder_4bit_tb
    run 1000ps