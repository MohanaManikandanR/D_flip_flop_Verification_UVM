class dff_scoreboard extends uvm_scoreboard;
  `uvm_component_utils(dff_scoreboard);//factory registration
  
  uvm_analysis_imp#(dff_sequence_item,dff_scoreboard) recv; 
  
  //constructor
  
  function new(input string name="dff_scoreboard",uvm_component parent);
    super.new(name,parent);
  endfunction
  
  //build phase
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    recv=new("recv",this);
  endfunction
    
  //compare block
  
  function void write(dff_sequence_item seq_it);
    if(seq_it.rst==0) begin
      if(seq_it.dout != seq_it.din) begin
        $error("Error  time=%t,din=%b,dout=%b",$time,seq_it.din,seq_it.dout);
      end 
    end
  endfunction
    
endclass
