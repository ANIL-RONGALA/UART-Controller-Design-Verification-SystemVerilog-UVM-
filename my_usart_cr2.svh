class my_usart_cr2 extends uvm_reg;
  `uvm_object_utils(my_usart_cr2)
  
  rand uvm_reg_field CR2_CONTENT;
  
      
  function new (string name = "usart_cr2");
    super.new(name, 32, UVM_NO_COVERAGE);
  endfunction
    
  virtual function void build();
    CR2_CONTENT = uvm_reg_field::type_id::create("CR2_CONTENT");
    
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
    CR2_CONTENT.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
    
    
  endfunction


endclass: my_usart_cr2

