set moduleName distance_squared
set isCombinational 0
set isDatapathOnly 0
set isPipelined 0
set isOneStateSeq 0
set C_modelName distance_squared
set C_modelType { void 0 }
set C_modelArgList { 
	{ vector1_data_V int 64 {fifo 0}  }
	{ vector1_keep_V int 8 {fifo 0}  }
	{ vector1_last_V int 1 {fifo 0}  }
	{ vector2_data_V int 64 {fifo 0}  }
	{ vector2_keep_V int 8 {fifo 0}  }
	{ vector2_last_V int 1 {fifo 0}  }
	{ sum double 64 {pointer 1}  }
}

# RTL Port declarations: 
set portNum 24
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ vector1_data_V_dout sc_in sc_lv 64 signal 0 } 
	{ vector1_data_V_empty_n sc_in sc_logic 1 signal 0 } 
	{ vector1_data_V_read sc_out sc_logic 1 signal 0 } 
	{ vector1_keep_V_dout sc_in sc_lv 8 signal 1 } 
	{ vector1_keep_V_empty_n sc_in sc_logic 1 signal 1 } 
	{ vector1_keep_V_read sc_out sc_logic 1 signal 1 } 
	{ vector1_last_V_dout sc_in sc_lv 1 signal 2 } 
	{ vector1_last_V_empty_n sc_in sc_logic 1 signal 2 } 
	{ vector1_last_V_read sc_out sc_logic 1 signal 2 } 
	{ vector2_data_V_dout sc_in sc_lv 64 signal 3 } 
	{ vector2_data_V_empty_n sc_in sc_logic 1 signal 3 } 
	{ vector2_data_V_read sc_out sc_logic 1 signal 3 } 
	{ vector2_keep_V_dout sc_in sc_lv 8 signal 4 } 
	{ vector2_keep_V_empty_n sc_in sc_logic 1 signal 4 } 
	{ vector2_keep_V_read sc_out sc_logic 1 signal 4 } 
	{ vector2_last_V_dout sc_in sc_lv 1 signal 5 } 
	{ vector2_last_V_empty_n sc_in sc_logic 1 signal 5 } 
	{ vector2_last_V_read sc_out sc_logic 1 signal 5 } 
	{ sum sc_out sc_lv 64 signal 6 } 
}

set Spec2ImplPortList { 
	vector1_data_V { ap_fifo {  { vector1_data_V_dout fifo_data 0 64 }  { vector1_data_V_empty_n fifo_status 0 1 }  { vector1_data_V_read fifo_update 1 1 } } }
	vector1_keep_V { ap_fifo {  { vector1_keep_V_dout fifo_data 0 8 }  { vector1_keep_V_empty_n fifo_status 0 1 }  { vector1_keep_V_read fifo_update 1 1 } } }
	vector1_last_V { ap_fifo {  { vector1_last_V_dout fifo_data 0 1 }  { vector1_last_V_empty_n fifo_status 0 1 }  { vector1_last_V_read fifo_update 1 1 } } }
	vector2_data_V { ap_fifo {  { vector2_data_V_dout fifo_data 0 64 }  { vector2_data_V_empty_n fifo_status 0 1 }  { vector2_data_V_read fifo_update 1 1 } } }
	vector2_keep_V { ap_fifo {  { vector2_keep_V_dout fifo_data 0 8 }  { vector2_keep_V_empty_n fifo_status 0 1 }  { vector2_keep_V_read fifo_update 1 1 } } }
	vector2_last_V { ap_fifo {  { vector2_last_V_dout fifo_data 0 1 }  { vector2_last_V_empty_n fifo_status 0 1 }  { vector2_last_V_read fifo_update 1 1 } } }
	sum { ap_none {  { sum out_data 1 64 } } }
}
