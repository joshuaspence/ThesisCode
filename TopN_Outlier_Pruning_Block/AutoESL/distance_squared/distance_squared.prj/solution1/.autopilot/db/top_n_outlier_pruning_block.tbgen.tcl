set moduleName top_n_outlier_pruning_block
set isCombinational 1
set isDatapathOnly 0
set isPipelined 0
set isOneStateSeq 0
set C_modelName top_n_outlier_pruning_block
set C_modelType { int 32 }
set C_modelArgList { 
	{ dummy int 8 {pointer 0}  }
}

# RTL Port declarations: 
set portNum 2
set portList { 
	{ dummy sc_in sc_lv 8 signal 0 } 
	{ ap_return sc_out sc_lv 32 signal -1 } 
}

set Spec2ImplPortList { 
	dummy { ap_none {  { dummy in_data 0 8 } } }
}
