/*
 * Copyright (c) 2009 Xilinx, Inc.  All rights reserved.
 *
 * Xilinx, Inc.
 * XILINX IS PROVIDING THIS DESIGN, CODE, OR INFORMATION "AS IS" AS A
 * COURTESY TO YOU.  BY PROVIDING THIS DESIGN, CODE, OR INFORMATION AS
 * ONE POSSIBLE   IMPLEMENTATION OF THIS FEATURE, APPLICATION OR
 * STANDARD, XILINX IS MAKING NO REPRESENTATION THAT THIS IMPLEMENTATION
 * IS FREE FROM ANY CLAIMS OF INFRINGEMENT, AND YOU ARE RESPONSIBLE
 * FOR OBTAINING ANY RIGHTS YOU MAY REQUIRE FOR YOUR IMPLEMENTATION.
 * XILINX EXPRESSLY DISCLAIMS ANY WARRANTY WHATSOEVER WITH RESPECT TO
 * THE ADEQUACY OF THE IMPLEMENTATION, INCLUDING BUT NOT LIMITED TO
 * ANY WARRANTIES OR REPRESENTATIONS THAT THIS IMPLEMENTATION IS FREE
 * FROM CLAIMS OF INFRINGEMENT, IMPLIED WARRANTIES OF MERCHANTABILITY
 * AND FITNESS FOR A PARTICULAR PURPOSE.
 *
 */

/*
 * helloworld.c: simple test application
 */

#include <stdio.h>
#include "platform.h"
#include "xparameters.h"
#include "xil_io.h"
#include "xstatus.h"
#include "xbasic.h"  // DM added
#include "xintc.h"
#include "xil_exception.h"
#include "xuartlite_l.h"

#define pritnf xil_printf
void print(char *str);



// BASIC PCORE SETUP
XBasic Basic;
XBasic_Config Basic_Config =
{
    0,
    XPAR_BASIC_TOP_0_S_AXI_BUS_A_BASEADDR
};

int SetupBasic(void)
{
    return XBasic_Initialize(&Basic, &Basic_Config);
}

//-------------- Setup Interrupt control -----------------------------
//
#define INTC_DEVICE_ID		  XPAR_INTC_0_DEVICE_ID
#define XBASIC_INTERRUPT_ID   XPAR_MICROBLAZE_0_INTC_BASIC_TOP_0_INTERRUPT_INTR
XIntc InterruptController;  /* The instance of the Interrupt Controller */

int interrupt_count = 0;   // just for statiscs
int interrupt_asserted = 0;

void XBasic_InterruptHandler(void *InstancePtr)
{

	interrupt_count++;
	// clear the interrupt
	XBasic_InterruptClear(&Basic, 1);
	// poor man semaphore
	interrupt_asserted = 1;

}


//----------------------------------------------------
int SetupInterrupt(void)
{
	int Status;

    // Initialize the interrupt controller driver so that it is ready to use.
	Status = XIntc_Initialize(&InterruptController, INTC_DEVICE_ID);
	if (Status != XST_SUCCESS)
	{
		return XST_FAILURE;
	}

	// Connect a device driver handler that will be called when an interrupt
	// for the device occurs, the device driver handler performs the specific
	// interrupt processing for the device
	Status = XIntc_Connect
			   ( &InterruptController, XBASIC_INTERRUPT_ID,
				(XInterruptHandler)XBasic_InterruptHandler,
				 NULL
			   );
	if (Status != XST_SUCCESS)
	{
		return XST_FAILURE;
	}

	// Start the interrupt controller such that interrupts are enabled for
	// all devices that cause interrupts, specific real mode so that
	// the timer counter can cause interrupts thru the interrupt controller.
	//
	Status = XIntc_Start(&InterruptController, XIN_REAL_MODE);
	if (Status != XST_SUCCESS)  { return XST_FAILURE; }

	// Enable the interrupt for the AESL BASIC CORE
	XIntc_Enable(&InterruptController, XBASIC_INTERRUPT_ID);



    //  Initialize the exception table.
	Xil_ExceptionInit();

	// Register the interrupt controller handler with the exception table.
	Xil_ExceptionRegisterHandler(
			XIL_EXCEPTION_ID_INT,
			(Xil_ExceptionHandler) XIntc_InterruptHandler,
			&InterruptController
			);

	// Enable non-critical exceptions.
	Xil_ExceptionEnable();

    XBasic_InterruptEnable(&Basic, 1);
    XBasic_InterruptGlobalEnable(&Basic);

	return XST_SUCCESS;
}



void print_core_regs(void )
{

	xil_printf ("\n\r   A       reg [0x%08x] ", XBasic_GetA(&Basic ) );
	xil_printf ("\n\r   B       reg [0x%08x] ", XBasic_GetB(&Basic ));
	xil_printf ("\n\r   C       reg [0x%08x] ", XBasic_GetC(&Basic ) );
	xil_printf ("\n\r   DONE    reg [0x%08x] ", XBasic_IsDone(&Basic) );
	xil_printf ("\n\r   IDLE    reg [0x%08x] ", XBasic_IsIdle(&Basic) );

	xil_printf ("\n\r   INT STATS   [%d]     ", interrupt_count );

}

int ReadInt(int size)
{
  int value=0;
  char c ='0';
  int i;
  for (i=0; i <size; i++)
  {
	c=inbyte();
    if (c==' ' )
    {
       c='0';
       outbyte(c);
    }
    else if (c=='\n')
    {
    	break;
    	return value;
    }
    else if (c=='\r')
    {
    	break;
    	return value;
    }
    else
    {
      outbyte(c);
      value=value*10+c-'0';
    }
  }

  return value;
}


int main()
{
	//init_platform();

    int a = 1000;
    int b = 1000;
    u32 result;

    // initialize AESL PCORE

    int status;
    status = XBasic_Initialize(&Basic, &Basic_Config);
    if (status != XST_SUCCESS) {
        xil_printf("\n\r ==> Basic failed.\n\r");
    } else {
        xil_printf("\n\r ==> Basic succeeded.\n\r");
    }

    // Initialize the interrupts (local then global)
    status = SetupInterrupt();
    if (status != XST_SUCCESS) {
        xil_printf("\n\r ==> SetupInterrupt failed.\n\r\n\r");
    } else {
        xil_printf("\n\r ==> SetupInterrupt succeeded.\n\r\n\r");
    }


    // Get and setup the data
    while (1)
    {
    print("\n\r ===========================================================");
    print("\n\r =========== START OF AESL BASIC CORE TEST =================");
    print("\n\r ================      RESULT = A + B     ==================\n\r");

    while (a > 255)
    {
    	print("\n\r --> Please enter number between (0-255) for variable A : ");
    	a = ReadInt(3);
    }

    while (b > 255)
    {
    	print("\n\r --> Please enter number between (0-255) for variable B : ");
    	 b = ReadInt(3);
     }

    XBasic_SetA(&Basic,a);
    XBasic_SetB(&Basic,b);

    // Start
    XBasic_Start(&Basic);

    // Wait for idle
    //while (!XBasic_IsIdle(&Basic));
    // wait for flag from interrupt handler
    while (!interrupt_asserted);
    interrupt_asserted = 0;


    result = XBasic_GetC(&Basic);

    xil_printf ("\n\r ==> RESULT:   %03d + %03d  = %03d ", a , b,  result);

    print_core_regs();

    print("\n\r ===========================================================");
    print("\n\r ===========================================================\n\r");
    // reset variable to value bigger then 255 to prompt user for new input
    a =1000;
    b =1000;

    }

    //cleanup_platform();

    return 0;
}
