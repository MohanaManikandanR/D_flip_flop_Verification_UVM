class dff_sequence extends uvm_sequence#(dff_sequence_item);
  `uvm_object_utils(dff_sequence);//factory registration
  
  dff_sequence_item seq_it;
  
  //constructor
  
  function new(input string name="dff_sequence");
    super.new(name);
  endfunction
  
  
  task body;
    seq_it=dff_sequence_item::type_id::create("seq_it");//build phase
    repeat(50) begin
      start_item(seq_it);
      seq_it.din=$urandom_range(1,0);
      finish_item(seq_it);
    end
  endtask
  
endclass
