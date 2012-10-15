#include <stdio.h>
#include <stdlib.h>
#include "xparameters.h"
#include "xstatus.h"
#include "xpseudo_asm.h"
#include "xil_exception.h"
#include "xttcps.h"
#include "xscugic.h"
#include "xuartps.h"
#include "xil_printf.h"
#include "tx_api.h"


#define DEMO_STACK_SIZE         4096
#define DEMO_BYTE_POOL_SIZE     64000
#define DEMO_BLOCK_POOL_SIZE    100
#define DEMO_QUEUE_SIZE         100


/************************** Constant Definitions *****************************/

/*
 * The following constants map to the XPAR parameters created in the
 * xparameters.h file. They are only defined here such that a user can easily
 * change all the needed parameters in one place.
 */

#define TTC_DEVICE_ID       XPAR_XTTCPS_0_DEVICE_ID
#define TTC_INTR_ID         42 /*XPAR_XTTCPS_0_INTR*/
#define TTCPSS_CLOCK_HZ     XPAR_XTTCPS_0_CLOCK_HZ
#define INTC_DEVICE_ID      XPAR_SCUGIC_SINGLE_DEVICE_ID
#define UART_DEVICE_ID      XPAR_XUARTPS_0_DEVICE_ID

/**************************** Type Definitions *******************************/
typedef struct {
    u32 OutputHz;   /* Output frequency */
    u16 Interval;   /* Interval value */
    u8 Prescaler;   /* Prescaler value */
    u16 Options;    /* Option settings */
    u32 IntrMask;   /* tmr/cntr interrupts to enable */
} TmrCntrParams;

/***************** Macros (Inline Functions) Definitions *********************/


/************************** Function Prototypes ******************************/

// Routine to initialize uart for use by xil_printf routine
static int Init_UART(u16 DevId, XUartPs *UartPtr, u32 BaudRate);

// Set up routines for timer counters
static int SetupTimer(int DeviceID, XTtcPs *TmrInst, TmrCntrParams *TimerSetup);

//
static int SetupInterruptSystem(u16 IntcDeviceID, XScuGic *IntcInstancePtr);

// Interrupt handler for the timer
static void TmrIntrHandler(void *CallBackRef);
void    _tx_timer_interrupt(void);

/************************** Variable Definitions *****************************/

static volatile u8  ErrorCount;     // Errors seen at interrupt time
static volatile u32 TmrIntrCntr;    // Ticker interrupts between PWM change
static volatile u16 TimerValue;     // Present timer value - global variable, don't optimize out

//*** system device variables
static XUartPs     Uart0;     // UART serial port device instance
static XTtcPs      Ttc0;      // Timer device instance
static XScuGic     Gic0;      // Interrupt controller instance

/* Define the ThreadX object control blocks...  */
TX_THREAD                       thread_0;
TX_THREAD                       thread_1;
TX_THREAD                       thread_2;
TX_THREAD                       thread_3;
TX_THREAD                       thread_4;
TX_THREAD                       thread_5;
TX_THREAD                       thread_6;
TX_THREAD                       thread_7;
TX_QUEUE                        queue_0;
TX_SEMAPHORE                    semaphore_0;
TX_MUTEX                        mutex_0;
TX_EVENT_FLAGS_GROUP            event_flags_0;
TX_BYTE_POOL                    byte_pool_0;
TX_BLOCK_POOL                   block_pool_0;

/* Define the counters used in the demo application...  */
ULONG                           thread_0_counter;
ULONG                           thread_1_counter;
ULONG                           thread_1_messages_sent;
ULONG                           thread_2_counter;
ULONG                           thread_2_messages_received;
ULONG                           thread_3_counter;
ULONG                           thread_4_counter;
ULONG                           thread_5_counter;
ULONG                           thread_6_counter;
ULONG                           thread_7_counter;


/* Define thread prototypes.  */
void  thread_0_entry(ULONG thread_input);
void  thread_1_entry(ULONG thread_input);
void  thread_2_entry(ULONG thread_input);
void  thread_3_and_4_entry(ULONG thread_input);
void  thread_5_entry(ULONG thread_input);
void  thread_6_and_7_entry(ULONG thread_input);


/* Define main entry point.  */
int main() {
    // local variables
    TmrCntrParams TimerSetup;   // Timer setup structure
	
    /*
     * Init uart to use as printf output
     * Paramerters being passed:
     *    Uart device ID from xparameters.h
     *    A pointer that will be initialized to the software instance of the uart
     *    Baud rate
    */
    if (Init_UART(UART_DEVICE_ID, &Uart0, 9600) != XST_SUCCESS) { 
        // UART init failed
        xil_printf("Init UART failed\r\n");
        return XST_FAILURE;
    } else {
        xil_printf("Init UART success\r\n");
    }
	
    /*
     * Connect the Intc to the interrupt subsystem such that interrupts can
     * occur. This function is application specific.
     * Paramerters being passed:
     *    GIC device ID from xparameters.h
     *    A pointer that will be initialized to the software instance of the GIC
     */
    if (SetupInterruptSystem(INTC_DEVICE_ID, &Gic0) != XST_SUCCESS) {
        // GIC setup failed
        xil_printf("Init GIC failed\r\n");
        return XST_FAILURE;
    } else {
        xil_printf("Init GIC success\r\n");
    }
	
    /*
     * Set timer parameters for the TTC
     * This initializes values in a structure that will later
     * be passed, as a parameter, to the TTC initialization routine
    */
    TimerSetup.Prescaler = 4;
    // set interval mode, count up, waveform mode disabled
    TimerSetup.Options = (XTTCPS_OPTION_INTERVAL_MODE |
                          XTTCPS_OPTION_WAVE_DISABLE);
    // 10ms count up interval
    TimerSetup.Interval = 34000;
    // enable the interval interrupt
    TimerSetup.IntrMask = XTTCPS_IXR_INTERVAL_MASK;
	
    /*
     * Initialize the TTC timer
     * Paramerters being passed:
     *    TTC device ID from xparameters.h
     *    A pointer that will be initialized to the software instance of the timer (TTC)
     *    The structure that was set up above
    */
    if (SetupTimer(TTC_DEVICE_ID, &Ttc0, &TimerSetup) != XST_SUCCESS) {
		// timer init failed
        xil_printf("Init TTC failed\r\n");
        return XST_FAILURE;
    } else {
        xil_printf("Init TTC success\r\n");
    }
	
    /* Enter the ThreadX kernel.  */
    tx_kernel_enter();
	
    /* Never get here in a ThreadX system...  */
    return XST_SUCCESS;
}


/* Define what the initial system looks like. */
void tx_application_define(void * first_unused_memory) {
	CHAR * pointer;
	
	/* Create a byte memory pool from which to allocate the thread stacks.  */
    tx_byte_pool_create(&byte_pool_0, "byte pool 0", first_unused_memory, DEMO_BYTE_POOL_SIZE);

    /*
	 * Put system definition stuff in here, e.g. thread creates and other assorted
     * create information.
	 */
	
    /* Allocate the stack for thread 0. */
    tx_byte_allocate(&byte_pool_0, (VOID **) &pointer, DEMO_STACK_SIZE, TX_NO_WAIT);
	
    /* Create the main thread. */
    tx_thread_create(&thread_0, "thread 0", thread_0_entry, 0,  
            pointer, DEMO_STACK_SIZE, 
            1, 1, TX_NO_TIME_SLICE, TX_AUTO_START);
	
    /* Allocate the stack for thread 1. */
    tx_byte_allocate(&byte_pool_0, (VOID **) &pointer, DEMO_STACK_SIZE, TX_NO_WAIT);
	
    /*
	 *Create threads 1 and 2. These threads pass information through a ThreadX 
     * message queue. It is also interesting to note that these threads have a time
     * slice.
	 */
    tx_thread_create(&thread_1, "thread 1", thread_1_entry, 1,  
            pointer, DEMO_STACK_SIZE, 
            16, 16, 4, TX_AUTO_START);

    /* Allocate the stack for thread 2. */
    tx_byte_allocate(&byte_pool_0, (VOID **) &pointer, DEMO_STACK_SIZE, TX_NO_WAIT);
	
    tx_thread_create(&thread_2, "thread 2", thread_2_entry, 2,  
            pointer, DEMO_STACK_SIZE, 
            16, 16, 4, TX_AUTO_START);
	
    /* Allocate the stack for thread 3. */
    tx_byte_allocate(&byte_pool_0, (VOID **) &pointer, DEMO_STACK_SIZE, TX_NO_WAIT);
	
    /*
	 * Create threads 3 and 4. These threads compete for a ThreadX counting semaphore.  
     * An interesting thing here is that both threads share the same instruction area.
	 */
    tx_thread_create(&thread_3, "thread 3", thread_3_and_4_entry, 3,  
            pointer, DEMO_STACK_SIZE, 
            8, 8, TX_NO_TIME_SLICE, TX_AUTO_START);
	
    /* Allocate the stack for thread 4. */
    tx_byte_allocate(&byte_pool_0, (VOID **) &pointer, DEMO_STACK_SIZE, TX_NO_WAIT);
	
    tx_thread_create(&thread_4, "thread 4", thread_3_and_4_entry, 4,  
            pointer, DEMO_STACK_SIZE, 
            8, 8, TX_NO_TIME_SLICE, TX_AUTO_START);
	
    /* Allocate the stack for thread 5. */
    tx_byte_allocate(&byte_pool_0, (VOID **) &pointer, DEMO_STACK_SIZE, TX_NO_WAIT);
	
    /*
	 * Create thread 5.  This thread simply pends on an event flag which will be set
     * by thread_0.
	 */
    tx_thread_create(&thread_5, "thread 5", thread_5_entry, 5,  
            pointer, DEMO_STACK_SIZE, 
            4, 4, TX_NO_TIME_SLICE, TX_AUTO_START);
	
    /* Allocate the stack for thread 6. */
    tx_byte_allocate(&byte_pool_0, (VOID **) &pointer, DEMO_STACK_SIZE, TX_NO_WAIT);
	
    /* Create threads 6 and 7. These threads compete for a ThreadX mutex. */
    tx_thread_create(&thread_6, "thread 6", thread_6_and_7_entry, 6,  
            pointer, DEMO_STACK_SIZE, 
            8, 8, TX_NO_TIME_SLICE, TX_AUTO_START);
	
    /* Allocate the stack for thread 7. */
    tx_byte_allocate(&byte_pool_0, (VOID **) &pointer, DEMO_STACK_SIZE, TX_NO_WAIT);
	
    tx_thread_create(&thread_7, "thread 7", thread_6_and_7_entry, 7,  
            pointer, DEMO_STACK_SIZE, 
            8, 8, TX_NO_TIME_SLICE, TX_AUTO_START);
	
    /* Allocate the message queue. */
    tx_byte_allocate(&byte_pool_0, (VOID **) &pointer, DEMO_QUEUE_SIZE*sizeof(ULONG), TX_NO_WAIT);
	
    /* Create the message queue shared by threads 1 and 2. */
    tx_queue_create(&queue_0, "queue 0", TX_1_ULONG, pointer, DEMO_QUEUE_SIZE*sizeof(ULONG));
	
    /* Create the semaphore used by threads 3 and 4. */
    tx_semaphore_create(&semaphore_0, "semaphore 0", 1);
	
    /* Create the event flags group used by threads 1 and 5. */
    tx_event_flags_create(&event_flags_0, "event flags 0");
	
    /* Create the mutex used by thread 6 and 7 without priority inheritance. */
    tx_mutex_create(&mutex_0, "mutex 0", TX_NO_INHERIT);
	
    /* Allocate the memory for a small block pool. */
    tx_byte_allocate(&byte_pool_0, (VOID **) &pointer, DEMO_BLOCK_POOL_SIZE, TX_NO_WAIT);
	
    /* Create a block memory pool to allocate a message buffer from. */
    tx_block_pool_create(&block_pool_0, "block pool 0", sizeof(ULONG), pointer, DEMO_BLOCK_POOL_SIZE);
	
    /* Allocate a block and release the block memory. */
    tx_block_allocate(&block_pool_0, (VOID **) &pointer, TX_NO_WAIT);
	
    /* Release the block back to the pool. */
    tx_block_release(pointer);
	
    /* Allocate the stack for MicroBlaze print thread. */
    tx_byte_allocate(&byte_pool_0, (VOID **) &pointer, DEMO_STACK_SIZE*2, TX_NO_WAIT);
}

/* Define the test threads.  */
void thread_0_entry(ULONG thread_input) {
	UINT status;
	
    /* This thread simply sits in while-forever-sleep loop. */
    while (1) {
        /* Increment the thread counter. */
        thread_0_counter++;
#if 1
        /* Print out run counters of all the threads.  */
        xil_printf("***** ThreadX ZYNQ Demonstration ****\r\n\n");
        xil_printf("Thread 0 Counter:  %08x\r\n", thread_0_counter);
        xil_printf("Thread 1 Counter:  %08x\r\n", thread_1_counter);
        xil_printf("Thread 2 Counter:  %08x\r\n", thread_2_counter);
        xil_printf("Thread 3 Counter:  %08x\r\n", thread_3_counter);
        xil_printf("Thread 4 Counter:  %08x\r\n", thread_4_counter);
        xil_printf("Thread 5 Counter:  %08x\r\n", thread_5_counter);
        xil_printf("Thread 6 Counter:  %08x\r\n", thread_6_counter);
        xil_printf("Thread 7 Counter:  %08x\r\n\n\n", thread_7_counter);
#endif
		
        /* Sleep for 100 ticks. */
        tx_thread_sleep(100);
		
        /* Set event flag 0 to wakeup thread 5. */
        status =  tx_event_flags_set(&event_flags_0, 0x1, TX_OR);
		
        /* Check status.  */
        if (status != TX_SUCCESS)
            break;
    }
}

void thread_1_entry (ULONG thread_input) {
	UINT status;
	
    /* This thread simply sends messages to a queue shared by thread 2. */
    while (1) {
        /* Increment the thread counter. */
        thread_1_counter++;
		
        /* Send message to queue 0. */
        status =  tx_queue_send(&queue_0, &thread_1_messages_sent, TX_WAIT_FOREVER);
		
        /* Check completion status. */
        if (status != TX_SUCCESS)
            break;
		
        /* Increment the message sent. */
        thread_1_messages_sent++;
    }
}

void thread_2_entry(ULONG thread_input) {
	ULONG received_message;
	UINT status;
	
    /* This thread retrieves messages placed on the queue by thread 1. */
    while (1) {
        /* Increment the thread counter. */
        thread_2_counter++;
		
        /* Retrieve a message from the queue. */
        status = tx_queue_receive(&queue_0, &received_message, TX_WAIT_FOREVER);
		
        /*
		 * Check completion status and make sure the message is what we 
         * expected.
		 */
        if ((status != TX_SUCCESS) || (received_message != thread_2_messages_received))
            break;
        
        /* Otherwise, all is okay.  Increment the received message count. */
        thread_2_messages_received++;
    }
}

void  thread_3_and_4_entry(ULONG thread_input) {
	UINT status;
	
    /*
	 * This function is executed from thread 3 and thread 4. As the loop
     * below shows, these function compete for ownership of semaphore_0.
	 */
    while (1) {
        /* Increment the thread counter. */
        if (thread_input == 3)
            thread_3_counter++;
        else
            thread_4_counter++;
		
        /* Get the semaphore with suspension. */
        status =  tx_semaphore_get(&semaphore_0, TX_WAIT_FOREVER);
		
        /* Check status. */
        if (status != TX_SUCCESS)
            break;
		
        /* Sleep for 2 ticks to hold the semaphore. */
        tx_thread_sleep(2);
		
        /* Release the semaphore. */
        status =  tx_semaphore_put(&semaphore_0);
		
        /* Check status. */
        if (status != TX_SUCCESS)
            break;
    }
}

void thread_5_entry(ULONG thread_input){
	UINT status;
	ULONG actual_flags;

    /* This thread simply waits for an event in a forever loop. */
    while (1) {
        /* Increment the thread counter. */
        thread_5_counter++;
		
        /* Wait for event flag 0. */
        status =  tx_event_flags_get(&event_flags_0, 0x1, TX_OR_CLEAR, 
                                                &actual_flags, TX_WAIT_FOREVER);
		
        /* Check status.  */
        if ((status != TX_SUCCESS) || (actual_flags != 0x1))
            break;
    }
}

void  thread_6_and_7_entry(ULONG thread_input) {
	UINT status;
	
    /*
	 * This function is executed from thread 6 and thread 7. As the loop
     * below shows, these function compete for ownership of mutex_0.
	 */
    while (1) {
        /* Increment the thread counter. */
        if (thread_input == 6)
            thread_6_counter++;
        else
            thread_7_counter++;
		
        /* Get the mutex with suspension. */
        status =  tx_mutex_get(&mutex_0, TX_WAIT_FOREVER);
		
        /* Check status. */
        if (status != TX_SUCCESS)
            break;
		
        /*
		 * Get the mutex again with suspension. This shows
         * that an owning thread may retrieve the mutex it
         * owns multiple times.
		 */
        status =  tx_mutex_get(&mutex_0, TX_WAIT_FOREVER);
		
        /* Check status. */
        if (status != TX_SUCCESS)
            break;
		
        /* Sleep for 2 ticks to hold the mutex. */
        tx_thread_sleep(2);
		
        /* Release the mutex. */
        status =  tx_mutex_put(&mutex_0);
		
        /* Check status. */
        if (status != TX_SUCCESS)
            break;
		
        /*
		 * Release the mutex again. This will actually 
         * release ownership since it was obtained twice.
		 */
        status =  tx_mutex_put(&mutex_0);
		
        /* Check status. */
        if (status != TX_SUCCESS)
            break;
    }
}

/******************************************************************************/
/**
 *
 * This function initializes the UART for printf output.
 *
 * @param   DevId device ID.
 * @param   UartPtr UART instance pointer.
 * @param   BaudRate baud rate for the UART.
 *
 * @return  XST_SUCCESS to indicate success, otherwise XST_FAILURE.
 *
 * @note    None.
 *
 ****************************************************************************/
int Init_UART(u16 DevId, XUartPs * UartPtr, u32 BaudRate) {
    int Status;
    XUartPs_Config * UartConfig;
	
    /*
     * Initialize the UART 0 and 1 driver so that it's ready to use
     * Look up the configuration in the config table,
     * then initialize it.
     */
    UartConfig = XUartPs_LookupConfig(DevId);
    if (NULL == UartConfig) {
        xil_printf("UartPss_LookupConfig(%d) failed\r\n", DevId);
        return XST_FAILURE;
    }
	
    Status = XUartPs_CfgInitialize(UartPtr,
                    UartConfig,
                    UartConfig->BaseAddress);
    if (Status != XST_SUCCESS) {
        xil_printf("UartPss_CfgInitialize failed\r\n");
        return XST_FAILURE;
    }
	
    XUartPs_SetBaudRate(UartPtr, BaudRate);
	
    return XST_SUCCESS;
}

/****************************************************************************/
/**
*
* This function sets up the timer.
*
 * @param   DevId device ID.
 * @param   TTCPtr timer instance pointer.
 * @param   TTC misc parameters structure.
*
* @return   XST_SUCCESS if everything sets up well, XST_FAILURE otherwise.
*
*****************************************************************************/
int SetupTimer(int DeviceID, XTtcPs * TmrInst, TmrCntrParams * TimerSetup) {
    int Status;
    u16 i;
    XTtcPs_Config * Config;
	
    /*
     * Disable the interrupt for the Timer counter
     */
    XScuGic_Disable(&Gic0, TTC_INTR_ID);
	
    /*
     * Look up the configuration based on the device identifier
     */
    Config = XTtcPs_LookupConfig(DeviceID);
    if (NULL == Config) {
        xil_printf("Failed to find timer device\r\n");
        return XST_FAILURE;
    }
	
    // stop the timer, don't have an instance yet so have to do it manually
    XTtcPs_WriteReg(Config->BaseAddress, XTTCPS_CNT_CNTRL_OFFSET, 0x33);
	
    // just reading the timer interrupt status register is suppose to clear it
    XTtcPs_ReadReg(Config->BaseAddress, XTTCPS_ISR_OFFSET);
	
    // print the timer interrupt status to see if all interrupts are cleared
    i = XTtcPs_ReadReg(Config->BaseAddress, XTTCPS_ISR_OFFSET);
    xil_printf("addr %08x, value %08x\r\n", (Config->BaseAddress+XTTCPS_ISR_OFFSET), i);
	
    /*
     * Initialize the device
     */
    Status = XTtcPs_CfgInitialize(TmrInst, Config, Config->BaseAddress);
    if (Status != XST_SUCCESS) {
        xil_printf("Failed to configure timer %x\r\n", Status);
        return XST_FAILURE;
    }
	
    /*
     * Set the options
     */
    XTtcPs_SetOptions(TmrInst, TimerSetup->Options);
	
    /*
     * Set the interval and prescale
     */
    XTtcPs_SetInterval(TmrInst, TimerSetup->Interval);
    XTtcPs_SetPrescaler(TmrInst, TimerSetup->Prescaler);
	
    /*
     * Register the timer interrupt handler to the interrupt controller
     */
    Status = XScuGic_Connect(&Gic0, TTC_INTR_ID,
        (Xil_ExceptionHandler)TmrIntrHandler, (void *)&Ttc0);
    if (Status != XST_SUCCESS) {
        xil_printf("Failed to connect timer intr handler to intr ctrl\r\n");
        return XST_FAILURE;
    }
	
    /*
     * Enable the interrupt for the Timer counter
     */
    XScuGic_Enable(&Gic0, TTC_INTR_ID);
	
    /*
     * Enable selected tmr/cntr interrupts
     */
    XTtcPs_EnableInterrupts(TmrInst, TimerSetup->IntrMask);
	
    /*
     * Start the tick timer/counter
     */
    XTtcPs_Start(TmrInst);
	
    return XST_SUCCESS;
}

/****************************************************************************/
/**
*
* This function setups the interrupt system such that interrupts can occur.
* This function is application specific since the actual system may or may not
* have an interrupt controller.  The TTC could be directly connected to a
* processor without an interrupt controller.  The user should modify this
* function to fit the application.
*
* @param    IntcDeviceID is the unique ID of the interrupt controller
* @param    IntcInstacePtr is a pointer to the interrupt controller
*       instance.
*
* @return   XST_SUCCESS if successful, otherwise XST_FAILURE.
*
*****************************************************************************/
static int SetupInterruptSystem(u16 IntcDeviceID, XScuGic * IntcInstancePtr) {
    int Status;
	
    XScuGic_Config *IntcConfig; /* The configuration parameters of the
                    interrupt controller */
	
    /*
     * Initialize the interrupt controller driver
     */
    IntcConfig = XScuGic_LookupConfig(IntcDeviceID);
    if (NULL == IntcConfig) {
        return XST_FAILURE;
    }
	
    Status = XScuGic_CfgInitialize(IntcInstancePtr, IntcConfig,
                    IntcConfig->CpuBaseAddress);
    if (Status != XST_SUCCESS) {
        return XST_FAILURE;
    }
	
    /*
     * Register the interrupt controller interrupt handler to the hardware
     * interrupt handling logic in the ARM processor.
     */
    Xil_ExceptionRegisterHandler(XIL_EXCEPTION_ID_INT,
            (Xil_ExceptionHandler) XScuGic_InterruptHandler,
            IntcInstancePtr);
	
    return XST_SUCCESS;
}

/***************************************************************************/
/**
*
* This function is the handler which handles the periodic timer interrupt.
* It counts the number of interrupts that occur and rolls over.
*
* This handler provides an example of how to handle data for the TTC and
* is application specific.
*
* @param    CallBackRef contains a callback reference from the driver, in
*       this case it is the instance pointer for the TTC driver.
*
* @return   None.
*
*****************************************************************************/
static void TmrIntrHandler(void * CallBackRef) {
    u32 StatusEvent;
	
    /*
     * tmr interval interrupt occurs when tmr value == 50000
     * Value here is directly related to interrupt latency.
     * The timer was at 0 when the interrupt occured
     */
    TimerValue = XTtcPs_GetCounterValue(&Ttc0);     // read the tmr value
	
    /*
     * Read the interrupt status to clear timer interrupts.
     */
    StatusEvent = XTtcPs_GetInterruptStatus((XTtcPs *)CallBackRef);

    if (0 != (XTTCPS_IXR_INTERVAL_MASK & StatusEvent)) {
        TmrIntrCntr++;
    } else {
        /*
         * The Interval event should be the only one enabled. If it is
         * not it is an error
         */
        ErrorCount++;
    }
	
    /* Call ThreadX timer interrupt processing here!  */
    _tx_timer_interrupt();
}