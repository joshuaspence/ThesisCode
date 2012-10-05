################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CPP_SRCS += \
D:/Josh/ThesisCode/TopN_Outlier_Pruning_Block/source/top_n_outlier_pruning_block.cpp 

OBJS += \
./source/top_n_outlier_pruning_block.o 

CPP_DEPS += \
./source/top_n_outlier_pruning_block.d 


# Each subdirectory must supply rules for building sources it contributes
source/top_n_outlier_pruning_block.o: D:/Josh/ThesisCode/TopN_Outlier_Pruning_Block/source/top_n_outlier_pruning_block.cpp
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C++ Compiler'
	g++ -D__AUTOESL__ -DSORTED_INSERT -DNO_BLOCKING -DUSE_DYNAMIC_ARRAY_SIZE=0 -I../../include -I../../../../include -IC:/Xilinx/2012.1/AutoESL/include -IC:/Xilinx/2012.1/AutoESL/include/ap_sysc -IC:/Xilinx/2012.1/AutoESL/Win_x86/tools/systemc/include -ID:/Josh/ThesisCode/TopN_Outlier_Pruning_Block/FPGA/AutoESL -O0 -g3 -Wall -USE_INLINE=0 -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"source/top_n_outlier_pruning_block.d" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


