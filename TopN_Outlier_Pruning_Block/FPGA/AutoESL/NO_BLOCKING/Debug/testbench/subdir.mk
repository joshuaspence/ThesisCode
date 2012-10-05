################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
D:/Josh/ThesisCode/TopN_Outlier_Pruning_Block/source/vardump.c \
D:/Josh/ThesisCode/TopN_Outlier_Pruning_Block/source/wrapper.c 

CPP_SRCS += \
D:/Josh/ThesisCode/TopN_Outlier_Pruning_Block/source/test.cpp 

OBJS += \
./testbench/test.o \
./testbench/vardump.o \
./testbench/wrapper.o 

C_DEPS += \
./testbench/vardump.d \
./testbench/wrapper.d 

CPP_DEPS += \
./testbench/test.d 


# Each subdirectory must supply rules for building sources it contributes
testbench/test.o: D:/Josh/ThesisCode/TopN_Outlier_Pruning_Block/source/test.cpp
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C++ Compiler'
	g++ -D__AUTOESL__ -DSORTED_INSERT -DNO_BLOCKING -DUSE_DYNAMIC_ARRAY_SIZE=0 -I../../../../include -IC:/Xilinx/2012.1/AutoESL/include -IC:/Xilinx/2012.1/AutoESL/include/ap_sysc -IC:/Xilinx/2012.1/AutoESL/Win_x86/tools/systemc/include -ID:/Josh/ThesisCode/TopN_Outlier_Pruning_Block/FPGA/AutoESL -O0 -g3 -Wall -USE_INLINE=0 -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"testbench/test.d" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

testbench/vardump.o: D:/Josh/ThesisCode/TopN_Outlier_Pruning_Block/source/vardump.c
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C Compiler'
	gcc -D__AUTOESL__ -DSORTED_INSERT -DNO_BLOCKING -DUSE_DYNAMIC_ARRAY_SIZE=0 -I../../../../include -IC:/Xilinx/2012.1/AutoESL/include -IC:/Xilinx/2012.1/AutoESL/include/ap_sysc -IC:/Xilinx/2012.1/AutoESL/Win_x86/tools/systemc/include -ID:/Josh/ThesisCode/TopN_Outlier_Pruning_Block/FPGA/AutoESL -O0 -g3 -Wall -USE_INLINE=0 -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"testbench/vardump.d" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

testbench/wrapper.o: D:/Josh/ThesisCode/TopN_Outlier_Pruning_Block/source/wrapper.c
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C Compiler'
	gcc -D__AUTOESL__ -DSORTED_INSERT -DNO_BLOCKING -DUSE_DYNAMIC_ARRAY_SIZE=0 -I../../../../include -IC:/Xilinx/2012.1/AutoESL/include -IC:/Xilinx/2012.1/AutoESL/include/ap_sysc -IC:/Xilinx/2012.1/AutoESL/Win_x86/tools/systemc/include -ID:/Josh/ThesisCode/TopN_Outlier_Pruning_Block/FPGA/AutoESL -O0 -g3 -Wall -USE_INLINE=0 -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"testbench/wrapper.d" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


