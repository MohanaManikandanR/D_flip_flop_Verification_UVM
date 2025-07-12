class dff_monitor extends uvm_monitor;
  `uvm_component_utils(dff_monitor);//factory registration
  
  uvm_analysis_port#(dff_sequence_item) send;//analysis port
  virtual dff_interface intf;
  dff_sequence_item seq_it;
  
  //constructor
  
  function new(input string name="dff_monitor",uvm_component parent);
    super.new(name,parent);
  endfunction
  
  //build phase
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    seq_it=dff_sequence_item::type_id::create("seq_it");
    send =new ("send",this);
    //config_db
    if(!uvm_config_db#(virtual dff_interface)::get(this,"","dff_interface",intf))
      `uvm_fatal("monitor","Unable to access the interface");
  endfunction 
  
  //run phase
  
  virtual task run_phase(uvm_phase phase);
    forever begin
      @(posedge intf.clk)
      seq_it.din=intf.din;
      seq_it.dout=intf.dout; 
      send.write(seq_it); //sends signals to scrboard via analysis port
    end
  endtask
     
endclass
