class my_usart_tdr extends uvm_reg;
  `uvm_object_utils(my_usart_tdr)
  
  rand uvm_reg_field TDR_CONTENT;
  
  
  function new (string name = "my_usart_tdr");
    super.new(name, 32, UVM_NO_COVERAGE);
  endfunction
  
  virtual function void build();
  
  	 TDR_CONTENT = uvm_reg_field::type_id::create("TDR_CONTENT");
  

  
  
    TDR_CONTENT.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
  
  	add_hdl_path_slice(.name("TDR_CONTENT"), .offset(0), .size(32));
  
  endfunction
  
endclass : my_usart_tdr
  
  