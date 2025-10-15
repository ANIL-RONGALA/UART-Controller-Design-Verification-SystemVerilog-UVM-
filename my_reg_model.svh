class my_reg_model extends uvm_reg_block;
  `uvm_object_utils(my_reg_model)
  
  rand my_usart_cr1 cr1;
  rand my_usart_cr2 cr2;
  rand my_usart_isr isr;
  rand my_usart_rdr rdr;
  rand my_usart_rqr rqr;
  rand my_usart_tdr tdr;
  rand my_usart_icr icr;
  
      
  function new (string name = "");
    super.new(name);
  endfunction
  
  function void build();
    cr1 = my_usart_cr1::type_id::create("cr1");
    cr1.build();
    cr1.configure(this);
    //backdoor path
    cr1.add_hdl_path_slice("cr1", 0, 32);
    
    cr2 = my_usart_cr2::type_id::create("cr2");
    cr2.build();
    cr2.configure(this);
    cr2.add_hdl_path_slice("cr2", 0, 32);
    
    isr = my_usart_isr::type_id::create("isr");
    isr.build();
    isr.configure(this);
    isr.add_hdl_path_slice("isr", 0, 32);
    
    rdr = my_usart_rdr::type_id::create("rdr");
    rdr.build();
    rdr.configure(this);
    rdr.add_hdl_path_slice("rdr", 0, 32);
    
    rqr = my_usart_rqr::type_id::create("rqr");
    rqr.build();
    rqr.configure(this);
    rqr.add_hdl_path_slice("rqr", 0, 32);
    
    
    tdr = my_usart_tdr::type_id::create("tdr");
    tdr.build();
    tdr.configure(this);
    tdr.add_hdl_path_slice("tdr", 0, 32);
    
    icr = my_usart_icr::type_id::create("icr");
    icr.build();
    icr.configure(this);
    icr.add_hdl_path_slice("icr", 0, 32);
  
  
  /*
  Virtual function uvm_reg_map create_map(
  		string  name,
    	uvm_reg_addr_t base_addr,
   		 int    unsigned    n_bytes,
    	uvm_endianness_e    endian,
        bit   byte_addressing = 1
        
  )
  */
  	//need to update the base_addr
    default_map = create_map("reg_map", 32'h40004c00, 4, UVM_LITTLE_ENDIAN, 0);
  
  	//add_reg(reg, offset, access)
    default_map.add_reg(cr1, 32'h00, "RW");
    default_map.add_reg(cr2, 32'h04, "Rw");
    default_map.add_reg(rqr, 32'h18, "RW");
    default_map.add_reg(icr, 32'h20, "RW");
    default_map.add_reg(isr, 32'h1C, "RW");
    default_map.add_reg(rdr, 32'h24, "RW");
    default_map.add_reg(tdr, 32'h28, "RW");


    
    
    add_hdl_path("top.dut1", "RTL");
    
    lock_model();
  endfunction
   
endclass : my_reg_model