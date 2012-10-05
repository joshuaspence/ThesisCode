// ==============================================================
// File generated by AutoESL - High-Level Synthesis System (C, C++, SystemC)
// Version: 2012.1
// Copyright (C) 2012 Xilinx Inc. All rights reserved.
// 
// ==============================================================

#ifndef __distance_squared_grp_fu_215_ACMP_dadddsub_1__HH__
#define __distance_squared_grp_fu_215_ACMP_dadddsub_1__HH__
#include "ACMP_dadddsub.h"
#include <systemc>

template<
    int ID,
    int NUM_STAGE,
    int din0_WIDTH,
    int din1_WIDTH,
    int dout_WIDTH>
SC_MODULE(distance_squared_grp_fu_215_ACMP_dadddsub_1) {
    sc_core::sc_in_clk clk;
    sc_core::sc_in<sc_dt::sc_logic> reset;
    sc_core::sc_in<sc_dt::sc_logic> ce;
    sc_core::sc_in< sc_dt::sc_lv<din0_WIDTH> >   din0;
    sc_core::sc_in< sc_dt::sc_lv<din1_WIDTH> >   din1;
    sc_core::sc_in< sc_dt::sc_lv<2> >   opcode;
    sc_core::sc_out< sc_dt::sc_lv<dout_WIDTH> >   dout;



    ACMP_dadddsub<ID, 5, din0_WIDTH, din1_WIDTH, dout_WIDTH> ACMP_dadddsub_U;

    SC_CTOR(distance_squared_grp_fu_215_ACMP_dadddsub_1):  ACMP_dadddsub_U ("ACMP_dadddsub_U") {
        ACMP_dadddsub_U.clk(clk);
        ACMP_dadddsub_U.reset(reset);
        ACMP_dadddsub_U.ce(ce);
        ACMP_dadddsub_U.din0(din0);
        ACMP_dadddsub_U.din1(din1);
        ACMP_dadddsub_U.dout(dout);
        ACMP_dadddsub_U.opcode(opcode);

    }

};

#endif //
