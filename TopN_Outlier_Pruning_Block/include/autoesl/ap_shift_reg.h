/*****************************************************************************
 *
 *     Author: Xilinx, Inc.
 *
 *     This text contains proprietary, confidential information of
 *     Xilinx, Inc. , is distributed by under license from Xilinx,
 *     Inc., and may be used, copied and/or disclosed only pursuant to
 *     the terms of a valid license agreement with Xilinx, Inc.
 *
 *     XILINX IS PROVIDING THIS DESIGN, CODE, OR INFORMATION "AS IS"
 *     AS A COURTESY TO YOU, SOLELY FOR USE IN DEVELOPING PROGRAMS AND
 *     SOLUTIONS FOR XILINX DEVICES.  BY PROVIDING THIS DESIGN, CODE,
 *     OR INFORMATION AS ONE POSSIBLE IMPLEMENTATION OF THIS FEATURE,
 *     APPLICATION OR STANDARD, XILINX IS MAKING NO REPRESENTATION
 *     THAT THIS IMPLEMENTATION IS FREE FROM ANY CLAIMS OF INFRINGEMENT,
 *     AND YOU ARE RESPONSIBLE FOR OBTAINING ANY RIGHTS YOU MAY REQUIRE
 *     FOR YOUR IMPLEMENTATION.  XILINX EXPRESSLY DISCLAIMS ANY
 *     WARRANTY WHATSOEVER WITH RESPECT TO THE ADEQUACY OF THE
 *     IMPLEMENTATION, INCLUDING BUT NOT LIMITED TO ANY WARRANTIES OR
 *     REPRESENTATIONS THAT THIS IMPLEMENTATION IS FREE FROM CLAIMS OF
 *     INFRINGEMENT, IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS
 *     FOR A PARTICULAR PURPOSE.
 *
 *     Xilinx products are not intended for use in life support appliances,
 *     devices, or systems. Use in such applications is expressly prohibited.
 *
 *     (c) Copyright 2011 Xilinx Inc.
 *     All rights reserved.
 *
 *****************************************************************************/

#ifndef __SIM_AP_SHIFT_REG_H__
#define __SIM_AP_SHIFT_REG_H__

/*
 * This file contains a C++ model of shift register.
 * It defines C level simulation model.
 */
#ifndef __cplusplus
    #error C++ is required to include this header file
#endif /* #ifndef __cplusplus */

#include <cassert>

//////////////////////////////////////////////
// C level simulation model for ap_shift_reg
//////////////////////////////////////////////
template<typename T, unsigned int Depth = 32>
class ap_shift_reg {
public:
    /// Constructors
    ap_shift_reg() { }
    ap_shift_reg(const char * name) { }

    /// Destructor
    virtual ~ap_shift_reg() { }

    // Shift the queue, push to back and read from a given address.
    T shift(T DataIn, unsigned int Addr = Depth - 1, bool Enable = true) {
        assert(Addr < Depth && "Out-of-bound shift is found in ap_shift_reg.");
        T ret = Array[Addr];
        if (Enable) {
            for (unsigned int i = Depth - 1; i > 0; --i)
                Array[i] = Array[i-1];
            Array[0] = DataIn;
        }
        return ret;
    }

    // Read from a given address.
    T read(unsigned int Addr = Depth - 1) {
        assert(Addr < Depth && "Out-of-bound read is found in ap_shift_reg.");
        return Array[Addr];
    }

protected:
    T Array[Depth];
};

#endif  /* #ifndef __SIM_AP_SHIFT_REG_H__ */