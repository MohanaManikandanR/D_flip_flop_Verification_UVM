class dff_agent extends uvm_agent;
  `uvm_component_utils(dff_agent);//factory registration
  
  dff_sequencer seqcr;
  dff_driver drv;
  dff_monitor mon;
  //constructor
  
  function new(input string name="dff_agent",uvm_component parent=null);
    super.new(name,parent);
  endfunction
  
  //build phase
  
  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    if(get_is_active() == UVM_ACTIVE) begin
      seqcr = dff_sequencer::type_id::create("seqcr",this);
      drv = dff_driver::type_id::create("drv",this);
    end
    mon=dff_monitor::type_id::create("mon",this);
    
  endfunction
  
  //connect phase
  
  virtual function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    if (get_is_active()) begin
      drv.seq_item_port.connect(seqcr.seq_item_export);
    end
  endfunction
  
endclass
