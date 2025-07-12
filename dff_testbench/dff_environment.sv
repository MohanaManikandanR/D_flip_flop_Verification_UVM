class dff_environment extends uvm_env;
  
  `uvm_component_utils(dff_environment); //factory registration
  
  dff_agent ag;
  dff_scoreboard scr;
  
  //constructor
  
  function new(input string name="dff_environment",uvm_component parent);
    super.new(name,parent);
  endfunction
  
  //build phase
  
  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    ag=dff_agent::type_id::create("ag",this);
    scr=dff_scoreboard::type_id::create("scr",this);
    
  endfunction
  
  //connect phase
  
  virtual function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    ag.mon.send.connect(scr.recv);
  endfunction
  
endclass
