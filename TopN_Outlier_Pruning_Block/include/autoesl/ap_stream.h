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

#ifndef __SIM_AP_STREAM__
#define __SIM_AP_STREAM__

#ifndef __cplusplus
#error C++ is required to include this header file
#else

#include <queue>
#include <stdio.h>

#ifndef AP_STREAM_MAX_QUEUE_SIZE
    //#define AP_STREAM_MAX_QUEUE_SIZE (1920*1080)
    #define AP_STREAM_MAX_QUEUE_SIZE 0 // MAX_SIZE=0 leads to an elastic stream
#endif /* #ifndef AP_STREAM_MAX_QUEUE_SIZE */

#ifdef __cplusplus
    #define C_EXTERN extern "C" // avoid C++ style name mangling
#else
    #define C_EXTERN extern
#endif /* #ifdef __cplusplus */

#define _paste(F,A) __AP_##F(A)

// Blocking Read & Write
#define AP_STREAM_READ(N,V) AP_STREAM_READ_FN(N)(V)
#define __AP_STREAM_READ_FN(N) ap_generic_stream_read_##N
#define AP_STREAM_READ_FN(name) _paste(STREAM_READ_FN,name)
#define AP_STREAM_WRITE(N,D) AP_STREAM_WRITE_FN(N)(D)
#define __AP_STREAM_WRITE_FN(N) ap_generic_stream_write_##N
#define AP_STREAM_WRITE_FN(name) _paste(STREAM_WRITE_FN,name)

// Nonblocking Read & Write
#define AP_STREAM_READ_NB(N,V) AP_STREAM_READ_NB_FN(N)(V)
#define __AP_STREAM_READ_NB_FN(N) ap_generic_stream_read_nb_##N
#define AP_STREAM_READ_NB_FN(name) _paste(STREAM_READ_NB_FN,name)
#define AP_STREAM_WRITE_NB(N,D) AP_STREAM_WRITE_NB_FN(N)(D)
#define __AP_STREAM_WRITE_NB_FN(N) ap_generic_stream_write_nb_##N
#define AP_STREAM_WRITE_NB_FN(name) _paste(STREAM_WRITE_NB_FN,name)

// Empty & Full
#define AP_STREAM_EMPTY(N) AP_STREAM_EMPTY_FN(N)()
#define __AP_STREAM_EMPTY_FN(N) ap_generic_stream_empty_##N
#define AP_STREAM_EMPTY_FN(name) _paste(STREAM_EMPTY_FN,name)
#define AP_STREAM_FULL(N) AP_STREAM_FULL_FN(N)()
#define __AP_STREAM_FULL_FN(N) ap_generic_stream_full_##N
#define AP_STREAM_FULL_FN(name) _paste(STREAM_FULL_FN,name)

#define AP_STREAM_INTERFACE(type, name) \
    C_EXTERN void ap_generic_stream_read_##name(type& value); \
    C_EXTERN void ap_generic_stream_write_##name(type data); \
    C_EXTERN bool ap_generic_stream_read_nb_##name(type& value); \
    C_EXTERN bool ap_generic_stream_write_nb_##name(type data); \
    C_EXTERN bool ap_generic_stream_empty_##name(); \
    C_EXTERN bool ap_generic_stream_full_##name();

#define AP_STREAM_SIZE(type, name, size) \
    ap_stream<type> ap_stream_##name(size, #name); \
    AP_STREAM_INTERFACE_DEF(type, name)

#define AP_STREAM_INTERFACE_DEF(type, name) \
    C_EXTERN void ap_generic_stream_read_##name(type& value) { \
        value = ap_stream_##name.pop(); \
    } \
    C_EXTERN void ap_generic_stream_write_##name(type data) { \
        ap_stream_##name.push(data); \
    } \
    C_EXTERN bool ap_generic_stream_read_nb_##name(type& value) { \
        bool empty_n = ap_stream_##name.read(value); \
        return empty_n; \
    } \
    C_EXTERN bool ap_generic_stream_write_nb_##name(type data) { \
        bool full_n = ap_stream_##name.write(data); \
        return full_n; \
    } \
    C_EXTERN bool ap_generic_stream_empty_##name() { \
        return ap_stream_##name.empty(); \
    } \
    C_EXTERN bool ap_generic_stream_full_##name() { \
        return ap_stream_##name.full(); \
    }

// Extern stream
#define EXTERN_AP_STREAM(type, name) \
    extern ap_stream<type> ap_stream_##name; \
    AP_STREAM_INTERFACE(type, name)
#define EXTERN_AP_STREAM_SIZE(type, name, size) \
    EXTERN_AP_STREAM(type, name)

#ifdef AESL_TB
    #define AP_STREAM(type, name) EXTERN_AP_STREAM(type, name)
#else
    #define AP_STREAM(type, name) AP_STREAM_SIZE(type, name, 0)
#endif /* #ifdef AESL_TB */

// FIFO stream
#define AP_STREAM_FIFO(type, name) AP_STREAM(type, name)
#define AP_STREAM_FIFO_SIZE(type, name, size) AP_STREAM_SIZE(type, name, size)
#define EXTERN_AP_STREAM_FIFO(type, name) EXTERN_AP_STREAM(type, name)
#define EXTERN_AP_STREAM_FIFO_SIZE(type, name, size) EXTERN_AP_STREAM_SIZE(type, name, size)

// HS stream
#define AP_STREAM_HS(type, name) AP_STREAM(type, name)
#define AP_STREAM_HS_SIZE(type, name, size) AP_STREAM_SIZE(type, name, size)
#define EXTERN_AP_STREAM_HS(type, name) EXTERN_AP_STREAM(type, name)
#define EXTERN_AP_STREAM_HS_SIZE(type, name, size) EXTERN_AP_STREAM_SIZE(type, name, size)

/////////////// ap_stream class //////////////
template <class T>
class ap_stream {
protected:
    const char * _name;
    std::deque<T> _data; // container for the elements
    unsigned _capacity;

public:
    // default constructor
    ap_stream(const char * name) {
        // capacity set to predefined maximum
        _capacity = AP_STREAM_MAX_QUEUE_SIZE;
        _name = name;
    }

    ap_stream(unsigned int max, const char * name) {
        _capacity = (max > 0) ? max : AP_STREAM_MAX_QUEUE_SIZE;
        _name = name;
    }

    typename std::deque<T>::size_type size() const {
        return _data.size();
    }

    typedef typename std::deque<T>::const_iterator iterator;

    iterator begin() const { return _data.begin(); }
    iterator end() const { return _data.end(); }

    bool empty() const { return _data.empty(); }
    bool full() const {
        if (_capacity > 0)
            return (_data.size() >= _capacity);
        return false;
    }

    bool read(T& head) {
        if (empty()) {
            head = T();
            return false;
        }
        head = pop();
        return true;
    }

    bool write(const T& tail) {
        if (full())
            return false;
        push(tail);
        return true;
    }

    void push(const T& elem) {
        if (!full())
            _data.push_back(elem);
        else {
            printf("WARNING: Pushing a full FIFO \'%s\'; increasing FIFO capacity from %d to %d.\n", _name, _capacity, _capacity + 1);
            //assert(0);
            ++_capacity;
            _data.push_back(elem);
        }
    }

    T pop() {
        if (_data.empty()) {
            printf("WARNING: Popping an empty FIFO \'%s\'.\n", _name);
            return T();
            //assert(0);
        }
        T elem(_data.front());
        _data.pop_front();
        return elem;
    }

    T front() {
        if (_data.empty()) {
            printf("WARNING: Peeking the front of an empty FIFO \'%s\'.\n", _name);
            return T();
            //assert(0);
        }
        return _data.front();
    }

    T back() {
        if (_data.empty()) {
            printf("WARNING: Peeking the back of an empty FIFO \'%s\'.\n", _name);
            return T();
            //assert(0);
        }
        return _data.back();
    }
};

#endif /* #ifndef __cplusplus */
#endif /* #ifndef __SIM_AP_STREAM__ &/