class dff_test extends uvm_test;
  
  `uvm_component_utils(dff_test);//factory registration
  
  dff_environment env;
  dff_sequence seq;
  //constructor
  
  function new(string name="dff_test",uvm_component parent);
    super.new(name,parent);
  endfunction
   
  //build phase
  
  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    env=dff_environment::type_id::create("env",this);
    seq = dff_sequence::type_id::create("seq", this);
  endfunction
  
  //run phase
  
  task run_phase(uvm_phase phase);
    phase.raise_objection(this);
    seq.start(env.ag.seqcr);
    phase.drop_objection(this);
  endtask
  
endclass
