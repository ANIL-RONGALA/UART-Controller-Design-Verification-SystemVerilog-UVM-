class my_usart_rdr extends uvm_reg;
  `uvm_object_utils(my_usart_rdr)
  
  rand uvm_reg_field RDR_CONTENT;
  
      
  function new (string name = "usart_rdr");
    super.new(name, 32, UVM_NO_COVERAGE);
  endfunction
    
  virtual function void build();
    RDR_CONTENT = uvm_reg_field::type_id::create("RDR_CONTENT");
    /*
    function void configure(
    	uvm_reg   parent,
        int    unsigned   size,
        int    unsigned   lsb_pos,
        string  access,
        bit    volatile,
        uvm_reg_data_t reset,
        bit    has_reset,
        bit    is_rand,
        bit    individaually_accessible )
        
    */
    RDR_CONTENT.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
    
    
  endfunction


endclass: my_usart_rdr

