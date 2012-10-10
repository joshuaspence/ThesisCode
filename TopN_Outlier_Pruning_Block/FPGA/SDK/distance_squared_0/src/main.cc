#include <stdio.h>
#include "xparameters.h"
#include "xdistance_squared.h"
#include "xaxidma.h"
#include "xscugic.h"
#include "platform.h"
#include "xil_printf.h"

XDistance_squared instance;
XDistance_squared_Config instanceConfig = {
	0,
	XPAR_DISTANCE_SQUARED_TOP_0_S_AXI_CONTROL_BUS_BASEADDR
};
XAxiDma AxiDmaA;
XAxiDma AxiDmaB;
XScuGic ScuGic;

volatile static bool doRun = false;
volatile static bool hasResult = false;

const int SIZE = 200;

int setup(void) {
    return XDistance_squared_Initialize(&instance, &instanceConfig);
}

void start(XDistance_squared * instancePtr) {
    XDistance_squared_InterruptEnable(instancePtr, 1);
    XDistance_squared_InterruptGlobalEnable(instancePtr);
    XDistance_squared_Start(instancePtr);
}

void isr(XDistance_squared * instancePtr) {
    /* Disable the global interrupt */
    XDistance_squared_InterruptGlobalDisable(instancePtr);

    /* Disable the local interrupt */
    XDistance_squared_InterruptDisable(instancePtr, 0xffffffff);

    /* Clear the local interrupt */
    XDistance_squared_InterruptClear(instancePtr, 1);

    /* Restart the core if it should run again */
    hasResult = true;
    if (doRun) {
        start(instancePtr);
    }
}

/* This functions sets up the interrupt on the ARM */
int setupInterrupt() {
    int result;
    XScuGic_Config * scuGicConfig = XScuGic_LookupConfig(XPAR_SCUGIC_SINGLE_DEVICE_ID);
    if (scuGicConfig == NULL) {
        xil_printf("Interrupt Configuration Lookup Failed\r\n");
        return XST_FAILURE;
    }

    if ((result = XScuGic_CfgInitialize(&ScuGic, scuGicConfig, scuGicConfig->CpuBaseAddress)) != XST_SUCCESS) {
        return result;
    }

    /* Self test */
    if ((result = XScuGic_SelfTest(&ScuGic)) != XST_SUCCESS) {
        return result;
    }

    /* Initialize the exception handler */
    Xil_ExceptionInit();

    /* Register the exception handler */
    xil_printf("Register the exception handler\r\n");
    Xil_ExceptionRegisterHandler(XIL_EXCEPTION_ID_INT, (Xil_ExceptionHandler) XScuGic_InterruptHandler, &ScuGic);

    /* Enable the exception handler */
    Xil_ExceptionEnable();

    /* Connect the Adder ISR to the exception table */
    xil_printf("Connect the Adder ISR to the Exception handler table\r\n");
    if ((result = XScuGic_Connect(&ScuGic, XPAR_FABRIC_DISTANCE_SQUARED_TOP_0_INTERRUPT_INTR,(Xil_InterruptHandler) isr, &instance)) != XST_SUCCESS) {
        return result;
    }

    xil_printf("Enable the Adder ISR\r\n");
    XScuGic_Enable(&ScuGic, XPAR_FABRIC_DISTANCE_SQUARED_TOP_0_INTERRUPT_INTR);

    return XST_SUCCESS;
}

int init_dma() {
    XAxiDma_Config * dmaConfigA;
    XAxiDma_Config * dmaConfigB;
    int status;

    dmaConfigA = XAxiDma_LookupConfig(XPAR_AXI_DMA_0_DEVICE_ID);
    if (!dmaConfigA) {
    	xil_printf("Error looking for AXI DMA config\r\n");
        return XST_FAILURE;
    }

    dmaConfigB = XAxiDma_LookupConfig(XPAR_AXI_DMA_1_DEVICE_ID);
	if (!dmaConfigB) {
		xil_printf("Error looking for AXI DMA config\r\n");
		return XST_FAILURE;
	}

    if ((status = XAxiDma_CfgInitialize(&AxiDmaA, dmaConfigA)) != XST_SUCCESS) {
    	xil_printf("Error initializing DMA1\r\n");
        return XST_FAILURE;
    }
    if ((status = XAxiDma_CfgInitialize(&AxiDmaB, dmaConfigB)) != XST_SUCCESS) {
    	xil_printf("Error initializing DMA2\r\n");
		return XST_FAILURE;
	}

    /* Check for scatter gather mode */
    if (XAxiDma_HasSg(&AxiDmaA)) {
    	xil_printf("Error DMA1 configured in SG mode\r\n");
        return XST_FAILURE;
    }
    if (XAxiDma_HasSg(&AxiDmaB)) {
	xil_printf("Error DMA2 configured in SG mode\n\r");
		return XST_FAILURE;
	}

    /* Disable the interrupts */
    XAxiDma_IntrDisable(&AxiDmaA, XAXIDMA_IRQ_ALL_MASK, XAXIDMA_DEVICE_TO_DMA);
    XAxiDma_IntrDisable(&AxiDmaA, XAXIDMA_IRQ_ALL_MASK, XAXIDMA_DMA_TO_DEVICE);
    XAxiDma_IntrDisable(&AxiDmaB, XAXIDMA_IRQ_ALL_MASK, XAXIDMA_DEVICE_TO_DMA);
	XAxiDma_IntrDisable(&AxiDmaB, XAXIDMA_IRQ_ALL_MASK, XAXIDMA_DMA_TO_DEVICE);

    return XST_SUCCESS;
}

int main() {
    init_platform();

    xil_printf("Example of AutoESL and DMA transfers\r\n");
    double input1[SIZE] = {1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1};
    double input2[SIZE] = {2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2};
    int status;

    /* Setup the distance_square unit */
    if ((status = setup()) != XST_SUCCESS) {
    	xil_printf("Setup failed\r\n");
    }


    /* Setup the interrupt */
    if ((status = setupInterrupt()) != XST_SUCCESS) {
    	xil_printf("Interrupt setup failed\r\n");
    }

    run = true;

    /* Set the configuration of the AutoESL block */
    //XDistance_squared_SetVal1(&instance, 16);
    //XDistance_squared_SetVal2(&instance, 8);
    start(&instance);

    /* Flush the cache */
    status = init_dma();
    unsigned int dma_size = SIZE * sizeof(double);
    Xil_DCacheFlushRange((unsigned) input1, dma_size);
    Xil_DCacheFlushRange((unsigned) input2, dma_size);

    /* Transfer to hw */
    if ((status = XAxiDma_SimpleTransfer(&AxiDmaA,(unsigned) input1, dma_size, XAXIDMA_DMA_TO_DEVICE)) != XST_SUCCESS) {
    	xil_printf("Error FAILED TO TRANSFER input1\r\n");
        return XST_FAILURE;
    }
    if ((status = XAxiDma_SimpleTransfer(&AxiDmaB,(unsigned) input2, dma_size, XAXIDMA_DMA_TO_DEVICE)) != XST_SUCCESS) {
    	xil_printf("Error FAILED TO TRANSFER input2\r\n");
		return XST_FAILURE;
	}

    /* Transfer from hw */
    while (!XDistance_squared_IsDone(&instance) || !hasResult);
    double result = (double) XDistance_squared_GetSum(&instance);
    xil_printf("Got result! = %f\r\n", result);

    cleanup_platform();
    return 0;
}
