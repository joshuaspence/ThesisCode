/* -*- c++ -*-*/
/*
 * Copyright (C) 2011 XILINX, Inc. 
 *
 *
 */

#ifndef __SIM_AP_SHIFT_REG_H__
#define __SIM_AP_SHIFT_REG_H__


/*
 * This file contains a C++ model of shift register.
 * It defines C level simulation model.
 */
#ifndef __cplusplus
#error C++ is required to include this header file
#endif
#include <cassert>

//////////////////////////////////////////////
// C level simulation model for ap_shift_reg
//////////////////////////////////////////////
template<typename T, unsigned int Depth = 32>
class ap_shift_reg
{
  public:
    /// Constructors
    ap_shift_reg() { }
    ap_shift_reg(const char* name) { }
    /// Destructor
    virtual ~ap_shift_reg() { }

    // Shift the queue, push to back and read from a given address.
    T shift(T DataIn, unsigned int Addr = Depth-1, bool Enable = true) {
        assert(Addr < Depth && "Out-of-bound shift is found in ap_shift_reg.");
        T ret = Array[Addr];
        if (Enable) {
            for (unsigned int i = Depth-1; i > 0; --i)
                Array[i] = Array[i-1];
            Array[0] = DataIn;
        }
        return ret;
    }

    // Read from a given address.
    T read(unsigned int Addr = Depth-1) {
        assert(Addr < Depth && "Out-of-bound read is found in ap_shift_reg.");
        return Array[Addr];
    }

  protected:
    T Array[Depth];
};


#endif  // __SIM_AP_SHIFT_REG_H__
