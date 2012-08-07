################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
C:/Users/Joshua/Desktop/AutoESL/blah/distance_test.c 

OBJS += \
./testbench/distance_test.o 

C_DEPS += \
./testbench/distance_test.d 


# Each subdirectory must supply rules for building sources it contributes
testbench/distance_test.o: C:/Users/Joshua/Desktop/AutoESL/blah/distance_test.c
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C Compiler'
	gcc -IC:/Xilinx/2012.1/AutoESL/include -IC:/Xilinx/2012.1/AutoESL/include/ap_sysc -IC:/Xilinx/2012.1/AutoESL/Win_x86/tools/systemc/include -IC:/Users/Joshua/Desktop/AutoESL/blah -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


