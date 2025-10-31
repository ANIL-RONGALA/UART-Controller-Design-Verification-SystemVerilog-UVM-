class my_usart_callback extends uvm_reg_cbs;//callbacks;
  `uvm_object_utils(my_usart_callback)
  
  my_usart_rdr rdr;
  my_usart_isr isr;
  my_usart_rqr rqr;
  
  
  bit [7:0] reg_data;
  string reg_name;
  function new (string name = "usart_callback");
    super.new(name);
  endfunction
    
  virtual task post_read(uvm_reg_item rw);
    
    uvm_reg reg_element;
    
    $cast(reg_element, rw.element);
    

    
    reg_name = reg_element.get_name();
    
    if((reg_name == "rdr") && (rw.kind == UVM_READ)) begin
      assert(isr.RXNE.predict(1'b0));
      `uvm_info("CALL BACK", "RDR READ CLEARING RXNE", UVM_NONE)
      
    end
  endtask
    
  virtual task post_write(uvm_reg_item rw);
      
    uvm_reg reg_element;
    //register data is in rw.value[0]
    reg_data = rw.value[0][7:0];
      
    $cast(reg_element, rw.element);

      
    reg_name = reg_element.get_name();
      
    //there should 1 in reg_data[3] 
    if((reg_name = "rqr") && (rw.kind == UVM_WRITE) && reg_data[3]) begin
      assert(isr.RXNE.predict(1'b0));
      `uvm_info("CALL BACK", "RQR WRITE, Bit 3 (RXFQR) = 1, CLEARING RXNE ", UVM_NONE)
    end
      
  endtask
  
  // TC BIT IN ISR Register
  
   virtual task write_tdr(uvm_reg_item rw);
    
    uvm_reg reg_element;
    
    $cast(reg_element, rw.element);
    

    
    reg_name = reg_element.get_name();
    
     if((reg_name == "icr") && (rw.kind == UVM_WRITE)) begin
       assert(isr.TC.predict(1'b0));
       `uvm_info("CALL BACK", "TDR WRITE CLEARING TC", UVM_NONE)
      
    end
  endtask
  
  
    
  virtual task write_TCCF(uvm_reg_item rw);
      
    uvm_reg reg_element;
    //register data is in rw.value[0]
    reg_data = rw.value[0][7:0];
      
    $cast(reg_element, rw.element);

      
    reg_name = reg_element.get_name();
      
    //there should 1 in reg_data[6] 
    if((reg_name = "icr") && (rw.kind == UVM_WRITE) && reg_data[6]) begin
      assert(isr.TC.predict(1'b0));
      `uvm_info("CALL BACK", "ICR WRITE, Bit ^ (TCCF) = 1, CLEARING TC ", UVM_NONE)
    end
      
  endtask
 


endclass: my_usart_callback

