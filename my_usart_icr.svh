class my_usart_icr extends uvm_reg;
  `uvm_object_utils(my_usart_icr)
  
  rand uvm_reg_field ICR_CONTENT1;//7 to 31
  rand uvm_reg_field ICR_CONTENT2;//0 to 5
  rand uvm_reg_field TCCF;//6
  
  function new(string name = "my_usart_icr");
    super.new(name, 32, UVM_NO_COVERAGE);
  endfunction
  
  
  virtual function void build();
    
    ICR_CONTENT1 = uvm_reg_field::type_id::create("ICR_CONTENT1");
    ICR_CONTENT2 = uvm_reg_field::type_id::create("ICR_CONTENT2");
    TCCF = uvm_reg_field::type_id::create("TCCF");
    
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
    
    ICR_CONTENT1.configure(this, 25, 7, "RW", 0, 25'h0, 1, 1, 1);
    ICR_CONTENT2.configure(this, 6, 0, "RW", 0, 6'h0, 1, 1, 1);
    TCCF.configure(this, 1, 6, "RW", 0, 1'h0, 1, 1, 1);
    
    
    add_hdl_path_slice(.name("ICR_CONTENT1"), .offset(7), .size(25));
    add_hdl_path_slice(.name("ICR_CONTENT2"), .offset(0), .size(6));
    add_hdl_path_slice(.name("TCCF"), .offset(6), .size(1));
    
  endfunction
  
endclass : my_usart_icr