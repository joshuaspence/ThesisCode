
set TopModule "top_n_outlier_pruning_block"
set ClockPeriod "10.000000"
set ClockList {}
set multiClockList {}
set CombLogicFlag 1
set PipelineFlag 0
set DataflowTaskPipelineFlag  0
set TrivialPipelineFlag 0
set FloatingPointFlag 0
set ResetLevelFlag 1
set ResetStyle "control"
set ResetSyncFlag 1
set RtlPrefix ""
set ExtraCCFlags ""
set ExtraCLdFlags ""
set SynCheckOptions ""
set PresynOptions ""
set PreprocOptions ""
set SchedOptions ""
set BindOptions ""
set RtlGenOptions ""
set RtlWriterOptions ""
set CbcGenFlag ""
set CasGenFlag ""
set CasMonitorFlag ""
set AutoSimOptions {}
set ExportMCPathFlag "0"
set SCTraceFileName "mytrace"
set SCTraceFileFormat "vcd"
set SCTraceOption "all"
set TargetInfo "xc6vlx240t:ff1156:-3"
set SourceFiles {sc {} c ../../distance_squared.c}
set SourceFlags {sc {} c {{}}}
set DirectiveFile {C:/Users/Joshua/Desktop/AutoESL/distance_squared/distance_squared.prj/solution1/solution1.directive}
set TBFiles {verilog ../../distance_test.c bc ../../distance_test.c vhdl ../../distance_test.c sc ../../distance_test.c cas ../../distance_test.c c {}}
set TVInFiles {bc {} c {} sc {} cas {} vhdl {} verilog {}}
set TVOutFiles {bc {} c {} sc {} cas {} vhdl {} verilog {}}
set TBTops {verilog {} bc {} vhdl {} sc {} cas {} c {}}
set TBInstNames {verilog {} bc {} vhdl {} sc {} cas {} c {}}
set ExtraGlobalOptions {"area_timing" 1 "clock_gate" 1 "impl_flow" map "power_gate" 0}
set PlatformFiles {{DefaultPlatform {xilinx/virtex6/virtex6 xilinx/virtex6/virtex6_fpv6}}}
set DefaultPlatform "DefaultPlatform"
set TBTVFileNotFound ""
set AppFile "../autopilot.app"
set ApsFile "solution1.aps"
set AvePath "../.."
