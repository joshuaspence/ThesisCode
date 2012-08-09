set language "C"
set globalAPint ""
set globalVariable ""
set staticVariable ""
set moduleName "cpp_ap_fixed"
set rawDecl [list "dout_t" "cpp_ap_fixed\(din1_t d_in1, din2_t d_in2\)"]
set argAPint ""
set returnAPint ""
set portList ""
set portName0 "d_in1"
set portInterface0 "wire"
set portData0 "[list ap_ufixed 10 8 SC_RND SC_SAT 0 ]"
set portPointer0 "0"
set portArrayDim0 0
set portConst0 "0"
set portVolatile0 "0"
set portArrayOpt0 ""
set port0 [list $portName0 $portInterface0 $portData0 $portPointer0 $portArrayDim0 $portConst0 $portVolatile0 $portArrayOpt0]
lappend portList $port0
set portName1 "d_in2"
set portInterface1 "wire"
set portData1 "[list ap_fixed 6 3 SC_RND SC_WRAP 0 ]"
set portPointer1 "0"
set portArrayDim1 0
set portConst1 "0"
set portVolatile1 "0"
set portArrayOpt1 ""
set port1 [list $portName1 $portInterface1 $portData1 $portPointer1 $portArrayDim1 $portConst1 $portVolatile1 $portArrayOpt1]
lappend portList $port1
set portName2 "return"
set portInterface2 "wire"
set portData2 "[list ap_fixed 36 30 SC_TRN SC_WRAP 0 ]"
set portPointer2 "0"
set portArrayDim2 0
set portConst2 "0"
set portVolatile2 "0"
set portArrayOpt2 ""
set port2 [list $portName2 $portInterface2 $portData2 $portPointer2 $portArrayDim2 $portConst2 $portVolatile2 $portArrayOpt2]
lappend portList $port2
set dataPackList ""
set module [list $moduleName $portList $rawDecl $argAPint $returnAPint $dataPackList]
set hasCPPAPInt 0
set hasCPPAPFix 1
set hasSCFix 0
set hasCPPComplex 0
set hasCBool 0
