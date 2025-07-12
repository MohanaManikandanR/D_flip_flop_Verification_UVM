class dff_sequence_item extends uvm_sequence_item;
  `uvm_object_utils(dff_sequence_item);//factory registration
  
  //only signals
 
  rand logic rst;
  logic din;
  rand logic dout;
  
  //constructor
  
  function new(string name="dff_sequence_item");
    super.new(name);
  endfunction
  
endclass
