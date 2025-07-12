class dff_driver extends uvm_driver#(dff_sequence_item);
  `uvm_component_utils(dff_driver);//factory registration
  
  virtual dff_interface intf;//interface
  dff_sequence_item seq_it;
  
  //constructor
  
  function new(input string name="dff_driver",uvm_component parent);
    super.new(name,parent);
  endfunction
  
  //build phase
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    seq_it=dff_sequence_item::type_id::create("seq_it");
    //config_db
    if(!uvm_config_db#(virtual dff_interface)::get(this,"","dff_interface",intf))
      `uvm_fatal("Driver","Unable to access the interface");
  endfunction 
  
  //run_phase
  
  virtual task run_phase(uvm_phase phase);
    forever begin
      seq_item_port.get_next_item(seq_it);
       @(posedge intf.clk)
         intf.din=seq_it.din;
      
      seq_item_port.item_done();
    end
  endtask
  
endclass
