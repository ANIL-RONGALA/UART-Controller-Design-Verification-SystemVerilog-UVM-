class my_usart_cr1 extends uvm_reg;
  `uvm_object_utils(my_usart_cr1)
  
  rand uvm_reg_field CR1_CONTENT;
  
      
  function new (string name = "usart_cr1");
    super.new(name, 32, UVM_NO_COVERAGE);
  endfunction
    
  virtual function void build();
    CR1_CONTENT = uvm_reg_field::type_id::create("CR1_CONTENT");
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
    CR1_CONTENT.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
    
    
  endfunction


endclass: my_usart_cr1

