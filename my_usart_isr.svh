class my_usart_isr extends uvm_reg;
  `uvm_object_utils(my_usart_isr)
  
  rand uvm_reg_field ISR_CONTENT1;
  rand uvm_reg_field ISR_CONTENT2;
  rand uvm_reg_field TC;
  rand uvm_reg_field RXNE;
  
      
  function new (string name = "my_usart_isr");
    super.new(name, 32, UVM_NO_COVERAGE);
  endfunction
    
  virtual function void build();
    ISR_CONTENT1 = uvm_reg_field::type_id::create("ISR_CONTENT1");
    ISR_CONTENT2 = uvm_reg_field::type_id::create("ISR_CONTENT2");
    TC = uvm_reg_field::type_id::create("TC");
    RXNE = uvm_reg_field::type_id::create("RXNE");
    
    
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
    ISR_CONTENT1.configure(this, 25, 7, "RW", 0, 25'h0, 1, 1, 1);
    ISR_CONTENT2.configure(this, 5, 0, "RW", 0, 5'h0, 1, 1, 1);
    TC.configure(this, 1, 6, "RW", 0, 1'b0, 1, 1, 1);
    RXNE.configure(this, 1, 5, "RW",0, 1'b0, 1, 1, 1 );
    
    add_hdl_path_slice(.name("ISR_CONTENT1"), .offset(7), .size(25));
    add_hdl_path_slice(.name("TC"), .offset(6), .size(1));
    add_hdl_path_slice(.name("RXNE"), .offset(5), .size(1));
    add_hdl_path_slice(.name("ISR_CONTENT2"), .offset(0), .size(5));
    
  endfunction


endclass: my_usart_isr

