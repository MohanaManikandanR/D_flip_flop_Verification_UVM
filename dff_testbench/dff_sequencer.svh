class dff_sequencer extends uvm_sequencer#(dff_sequence_item);
  `uvm_component_utils(dff_sequencer);//factory registration
  
  dff_sequence seq;
  
  //constructor
  
  function new(input string name="dff_sequencer",uvm_component parent);
    super.new(name,parent);
  endfunction
  
  //build phase
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    seq=dff_sequence::type_id::create("dff_sequence"); //classname or handle 
  endfunction
  
  
endclass
