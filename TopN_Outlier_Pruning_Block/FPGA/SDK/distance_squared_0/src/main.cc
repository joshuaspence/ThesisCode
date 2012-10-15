#include <stdio.h>
#include "xparameters.h"
#include "xdistance_squared.h"
#include "platform.h"

/*============================================================================*/
/* Static variables                                                           */
/*============================================================================*/
static XDistance_squared instance;
static XDistance_squared_Config instance_config = {
	0,
	XPAR_DISTANCE_SQUARED_TOP_0_S_AXI_CONTROL_BUS_BASEADDR
};
/*----------------------------------------------------------------------------*/

/*============================================================================*/
/* Print method                                                               */
/*============================================================================*/
#define printf(...)     do { xil_printf(__VA_ARGS__); } while (0)

static void print_core_regs(XDistance_squared * ptr) {
    printf("    return              reg   [0x%08x]\r\n", XDistance_squared_GetReturn(ptr));
    printf("    DONE                reg   [0x%08x]\r\n", XDistance_squared_IsDone(ptr));
    printf("    IDLE                reg   [0x%08x]\r\n", XDistance_squared_IsIdle(ptr));
    printf("    interrupt_count     stats [%u]\r\n",     interrupt_count);
}
/*----------------------------------------------------------------------------*/

/*============================================================================*/
/* Interrupt handler                                                          */
/*============================================================================*/
#include "xscugic.h"

static XScuGic hw_interrupt_controller;

volatile static bool do_run = false;
volatile static bool has_result = false;
volatile static unsigned int interrupt_count = 0;

void hw_isr(void * instancePtr) {
    interrupt_count++;
    
    /* Disable the global interrupt */
    XDistance_squared_InterruptGlobalDisable(instancePtr);

    /* Disable the local interrupt */
    XDistance_squared_InterruptDisable(instancePtr, 0xffffffff);

    /* Clear the local interrupt */
    XDistance_squared_InterruptClear(instancePtr, 1);

    /* Restart the core if it should run again */
    has_result = true;
    if (do_run) {
        hw_start(instancePtr);
    }
}

/* This functions sets up the interrupt on the ARM */
static int hw_setup_interrupt(void) {
    int status;
    
    XScuGic_Config * hw_interrupt_controller_config = XScuGic_LookupConfig(XPAR_SCUGIC_SINGLE_DEVICE_ID);
    if (scuGicConfig == NULL) {
        printf("Interrupt Configuration Lookup Failed\r\n");
        return XST_FAILURE;
    }

    if ((status = XScuGic_CfgInitialize(
            &hw_interrupt_controller,
            hw_interrupt_controller_config,
            hw_interrupt_controller_config->CpuBaseAddress)) != XST_SUCCESS) {
        return status;
    }

    /* Self test */
    if ((status = XScuGic_SelfTest(&hw_interrupt_controller)) != XST_SUCCESS) {
        return status;
    }
    
    /* Connect the hardware ISR to the exception table */
    printf("Connect the hardware ISR to the exception handler table\r\n");
    if ((status = XScuGic_Connect(
            &hw_interrupt_controller,
            XPAR_FABRIC_DISTANCE_SQUARED_TOP_0_INTERRUPT_INTR,
            (Xil_InterruptHandler) hw_isr,
            &instance)) != XST_SUCCESS) {
        return status;
    }

    printf("Enable the hardware ISR\r\n");
    XScuGic_Enable(&ScuGic, XPAR_FABRIC_DISTANCE_SQUARED_TOP_0_INTERRUPT_INTR);

    /* Initialize the exception table */
    Xil_ExceptionInit();

    /* Register the exception handler */
    printf("Register the exception handler\r\n");
    Xil_ExceptionRegisterHandler(
            XIL_EXCEPTION_ID_INT,
            (Xil_ExceptionHandler) hw_isr,
            &hw_interrupt_controller
            );

    /* Enable non-critical exceptions */
    Xil_ExceptionEnable();

    return XST_SUCCESS;
}
/*----------------------------------------------------------------------------*/

/*============================================================================*/
/* DMA configuration                                                          */
/*============================================================================*/
#include "xaxidma.h"

static XAxiDma AxiDmaA;
static XAxiDma AxiDmaB;

int init_dma() {
    XAxiDma_Config * dmaConfigA;
    XAxiDma_Config * dmaConfigB;
    int status;

    dmaConfigA = XAxiDma_LookupConfig(XPAR_AXI_DMA_0_DEVICE_ID);
    if (!dmaConfigA) {
    	printf("Error looking for AXI DMA config\r\n");
        return XST_FAILURE;
    }

    dmaConfigB = XAxiDma_LookupConfig(XPAR_AXI_DMA_1_DEVICE_ID);
	if (!dmaConfigB) {
		printf("Error looking for AXI DMA config\r\n");
		return XST_FAILURE;
	}

    if ((status = XAxiDma_CfgInitialize(&AxiDmaA, dmaConfigA)) != XST_SUCCESS) {
    	printf("Error initializing DMA1\r\n");
        return XST_FAILURE;
    }
    if ((status = XAxiDma_CfgInitialize(&AxiDmaB, dmaConfigB)) != XST_SUCCESS) {
    	printf("Error initializing DMA2\r\n");
		return XST_FAILURE;
	}

    /* Check for scatter gather mode */
    if (XAxiDma_HasSg(&AxiDmaA)) {
    	printf("Error DMA1 configured in SG mode\r\n");
        return XST_FAILURE;
    }
    if (XAxiDma_HasSg(&AxiDmaB)) {
	    printf("Error DMA2 configured in SG mode\n\r");
		return XST_FAILURE;
	}

    /* Disable the interrupts */
    XAxiDma_IntrDisable(&AxiDmaA, XAXIDMA_IRQ_ALL_MASK, XAXIDMA_DEVICE_TO_DMA);
    XAxiDma_IntrDisable(&AxiDmaA, XAXIDMA_IRQ_ALL_MASK, XAXIDMA_DMA_TO_DEVICE);
    XAxiDma_IntrDisable(&AxiDmaB, XAXIDMA_IRQ_ALL_MASK, XAXIDMA_DEVICE_TO_DMA);
	XAxiDma_IntrDisable(&AxiDmaB, XAXIDMA_IRQ_ALL_MASK, XAXIDMA_DMA_TO_DEVICE);

    return XST_SUCCESS;
}
/*----------------------------------------------------------------------------*/

static int hw_setup(void) {
    return XDistance_squared_Initialize(&instance, &instance_config);
}

static void hw_start(XDistance_squared * instancePtr) {
    XDistance_squared_InterruptEnable(instancePtr, 1);
    XDistance_squared_InterruptGlobalEnable(instancePtr);
    XDistance_squared_Start(instancePtr);
}

#include <stdlib.h>
static void fill_random(double * array, const size_t array_size) {
    unsigned int i;
    for (i = 0; i < array_size; i++) {
        array[i] = (double) rand();
    }
}

int main() {
    int status;
    static const int size = 200;

    init_platform();

    double input1[size];
    double input2[size];
    fill_random(input1, size);
    fill_random(input2, size);

    /* Setup the distance_square unit */
    if ((status = hw_setup()) != XST_SUCCESS) {
    	printf("Setup failed\r\n");
    }


    /* Setup the interrupt */
    if ((status = hw_setup_interrupt()) != XST_SUCCESS) {
    	printf("Interrupt setup failed\r\n");
    }

    do_run = true;

    /* Set the configuration of the AutoESL block */
    hw_start(&instance);

    /* Flush the cache */
    status = init_dma();
    unsigned int dma_size = size * sizeof(double);
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
