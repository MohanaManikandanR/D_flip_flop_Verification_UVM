//Uvm dff

`include "uvm_macros.svh"

import uvm_pkg::*;

`include "dff_interface.svh"
`include "dff_sequence_item.svh"
`include "dff_sequence.svh"
`include "dff_sequencer.svh"
`include "dff_driver.svh"
`include "dff_monitor.svh"
`include "dff_agent.svh"
`include "dff_scoreboard.svh"
`include "dff_environment.sv"
`include "dff_test.svh"

module dff_tb_top();
 
  //instantiation 
  
  dff_interface intf();
  dff_uvm dut(.clk(intf.clk),.rst(intf.rst),.din(intf.din),.dout(intf.dout));
  
  //config_db
  initial begin
    uvm_config_db#(virtual dff_interface)::set(null,"*","dff_interface",intf);
  end
  
  //initialize value
  
  initial begin
    intf.din=0;
  end
  
  //clock gen
  
  initial begin
    intf.clk=1;
    forever #5 intf.clk = ~intf.clk;
  end
  
  //rst gen
  
  initial begin
    intf.rst=0;
    #20 intf.rst=1;
    #10 intf.rst=0;
    #100 intf.rst=1;
    #120 intf.rst=0;
  end
  
  initial begin
    $monitor($time,"clk = %b, rst = %b, din = %b, dout = %b", intf.clk, intf.rst, intf.din, intf.dout);
  end
  
  // run test 
  
  initial begin
  run_test("dff_test");
  end
  
  //waveform
  
  initial begin
    `uvm_info("DUMPING FILES","DUMPING STARTS",UVM_NONE);
    $dumpfile("dump.vcd");
    $dumpvars;
    //#100 $finish;
  end
  
endmodule
