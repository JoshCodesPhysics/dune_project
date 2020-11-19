set moduleName ped_alg
set isTopModule 1
set isTaskLevelControl 1
set isCombinational 0
set isDatapathOnly 0
set isFreeRunPipelineModule 0
set isPipelined 0
set pipeline_type none
set FunctionProtocol ap_ctrl_hs
set isOneStateSeq 0
set ProfileFlag 0
set StallSigGenFlag 0
set isEnableWaveformDebug 1
set C_modelName {ped_alg}
set C_modelType { void 0 }
set C_modelArgList {
	{ ped_val int 16 regular {pointer 2}  }
	{ accum int 8 regular {pointer 2}  }
	{ ADC int 16 regular {pointer 1}  }
	{ tdata int 16 regular  }
	{ tvalid uint 1 regular  }
	{ tkeep0 uint 1 regular  }
	{ tkeep1 uint 1 regular  }
	{ tready uint 1 regular  }
	{ treset uint 1 regular  }
}
set C_modelArgMapList {[ 
	{ "Name" : "ped_val", "interface" : "wire", "bitwidth" : 16, "direction" : "READWRITE", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "ped_val","cData": "short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}]} , 
 	{ "Name" : "accum", "interface" : "wire", "bitwidth" : 8, "direction" : "READWRITE", "bitSlice":[{"low":0,"up":7,"cElement": [{"cName": "accum","cData": "char","bit_use": { "low": 0,"up": 7},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}]} , 
 	{ "Name" : "ADC", "interface" : "wire", "bitwidth" : 16, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "ADC","cData": "short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}]} , 
 	{ "Name" : "tdata", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "tdata","cData": "short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}]} , 
 	{ "Name" : "tvalid", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "tvalid","cData": "bool","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}]} , 
 	{ "Name" : "tkeep0", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "tkeep0","cData": "bool","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}]} , 
 	{ "Name" : "tkeep1", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "tkeep1","cData": "bool","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}]} , 
 	{ "Name" : "tready", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "tready","cData": "bool","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}]} , 
 	{ "Name" : "treset", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "treset","cData": "bool","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}]} ]}
# RTL Port declarations: 
set portNum 20
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ ped_val_i sc_in sc_lv 16 signal 0 } 
	{ ped_val_o sc_out sc_lv 16 signal 0 } 
	{ ped_val_o_ap_vld sc_out sc_logic 1 outvld 0 } 
	{ accum_i sc_in sc_lv 8 signal 1 } 
	{ accum_o sc_out sc_lv 8 signal 1 } 
	{ accum_o_ap_vld sc_out sc_logic 1 outvld 1 } 
	{ ADC sc_out sc_lv 16 signal 2 } 
	{ ADC_ap_vld sc_out sc_logic 1 outvld 2 } 
	{ tdata sc_in sc_lv 16 signal 3 } 
	{ tvalid sc_in sc_logic 1 signal 4 } 
	{ tkeep0 sc_in sc_logic 1 signal 5 } 
	{ tkeep1 sc_in sc_logic 1 signal 6 } 
	{ tready sc_in sc_logic 1 signal 7 } 
	{ treset sc_in sc_logic 1 signal 8 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "ped_val_i", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "ped_val", "role": "i" }} , 
 	{ "name": "ped_val_o", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "ped_val", "role": "o" }} , 
 	{ "name": "ped_val_o_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "ped_val", "role": "o_ap_vld" }} , 
 	{ "name": "accum_i", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "accum", "role": "i" }} , 
 	{ "name": "accum_o", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "accum", "role": "o" }} , 
 	{ "name": "accum_o_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "accum", "role": "o_ap_vld" }} , 
 	{ "name": "ADC", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "ADC", "role": "default" }} , 
 	{ "name": "ADC_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "ADC", "role": "ap_vld" }} , 
 	{ "name": "tdata", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "tdata", "role": "default" }} , 
 	{ "name": "tvalid", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "tvalid", "role": "default" }} , 
 	{ "name": "tkeep0", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "tkeep0", "role": "default" }} , 
 	{ "name": "tkeep1", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "tkeep1", "role": "default" }} , 
 	{ "name": "tready", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "tready", "role": "default" }} , 
 	{ "name": "treset", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "treset", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "",
		"CDFG" : "ped_alg",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "1", "EstimateLatencyMax" : "4",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"Port" : [
			{"Name" : "ped_val", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "accum", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "ADC", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "tdata", "Type" : "None", "Direction" : "I"},
			{"Name" : "tvalid", "Type" : "None", "Direction" : "I"},
			{"Name" : "tkeep0", "Type" : "None", "Direction" : "I"},
			{"Name" : "tkeep1", "Type" : "None", "Direction" : "I"},
			{"Name" : "tready", "Type" : "None", "Direction" : "I"},
			{"Name" : "treset", "Type" : "None", "Direction" : "I"}]}]}


set ArgLastReadFirstWriteLatency {
	ped_alg {
		ped_val {Type IO LastRead 2 FirstWrite 2}
		accum {Type IO LastRead 2 FirstWrite 4}
		ADC {Type O LastRead -1 FirstWrite 3}
		tdata {Type I LastRead 0 FirstWrite -1}
		tvalid {Type I LastRead 0 FirstWrite -1}
		tkeep0 {Type I LastRead 0 FirstWrite -1}
		tkeep1 {Type I LastRead 0 FirstWrite -1}
		tready {Type I LastRead 0 FirstWrite -1}
		treset {Type I LastRead 0 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "1", "Max" : "4"}
	, {"Name" : "Interval", "Min" : "2", "Max" : "5"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	ped_val { ap_ovld {  { ped_val_i in_data 0 16 }  { ped_val_o out_data 1 16 }  { ped_val_o_ap_vld out_vld 1 1 } } }
	accum { ap_ovld {  { accum_i in_data 0 8 }  { accum_o out_data 1 8 }  { accum_o_ap_vld out_vld 1 1 } } }
	ADC { ap_vld {  { ADC out_data 1 16 }  { ADC_ap_vld out_vld 1 1 } } }
	tdata { ap_none {  { tdata in_data 0 16 } } }
	tvalid { ap_none {  { tvalid in_data 0 1 } } }
	tkeep0 { ap_none {  { tkeep0 in_data 0 1 } } }
	tkeep1 { ap_none {  { tkeep1 in_data 0 1 } } }
	tready { ap_none {  { tready in_data 0 1 } } }
	treset { ap_none {  { treset in_data 0 1 } } }
}

set busDeadlockParameterList { 
}

# RTL port scheduling information:
set fifoSchedulingInfoList { 
}

# RTL bus port read request latency information:
set busReadReqLatencyList { 
}

# RTL bus port write response latency information:
set busWriteResLatencyList { 
}

# RTL array port load latency information:
set memoryLoadLatencyList { 
}
