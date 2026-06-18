################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (14.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Middlewares/edge-impulse-sdk/CMSIS/DSP/Source/CommonTables/arm_common_tables.c \
../Middlewares/edge-impulse-sdk/CMSIS/DSP/Source/CommonTables/arm_common_tables_f16.c \
../Middlewares/edge-impulse-sdk/CMSIS/DSP/Source/CommonTables/arm_const_structs.c \
../Middlewares/edge-impulse-sdk/CMSIS/DSP/Source/CommonTables/arm_const_structs_f16.c \
../Middlewares/edge-impulse-sdk/CMSIS/DSP/Source/CommonTables/arm_mve_tables.c \
../Middlewares/edge-impulse-sdk/CMSIS/DSP/Source/CommonTables/arm_mve_tables_f16.c 

C_DEPS += \
./Middlewares/edge-impulse-sdk/CMSIS/DSP/Source/CommonTables/arm_common_tables.d \
./Middlewares/edge-impulse-sdk/CMSIS/DSP/Source/CommonTables/arm_common_tables_f16.d \
./Middlewares/edge-impulse-sdk/CMSIS/DSP/Source/CommonTables/arm_const_structs.d \
./Middlewares/edge-impulse-sdk/CMSIS/DSP/Source/CommonTables/arm_const_structs_f16.d \
./Middlewares/edge-impulse-sdk/CMSIS/DSP/Source/CommonTables/arm_mve_tables.d \
./Middlewares/edge-impulse-sdk/CMSIS/DSP/Source/CommonTables/arm_mve_tables_f16.d 

OBJS += \
./Middlewares/edge-impulse-sdk/CMSIS/DSP/Source/CommonTables/arm_common_tables.o \
./Middlewares/edge-impulse-sdk/CMSIS/DSP/Source/CommonTables/arm_common_tables_f16.o \
./Middlewares/edge-impulse-sdk/CMSIS/DSP/Source/CommonTables/arm_const_structs.o \
./Middlewares/edge-impulse-sdk/CMSIS/DSP/Source/CommonTables/arm_const_structs_f16.o \
./Middlewares/edge-impulse-sdk/CMSIS/DSP/Source/CommonTables/arm_mve_tables.o \
./Middlewares/edge-impulse-sdk/CMSIS/DSP/Source/CommonTables/arm_mve_tables_f16.o 


# Each subdirectory must supply rules for building sources it contributes
Middlewares/edge-impulse-sdk/CMSIS/DSP/Source/CommonTables/%.o Middlewares/edge-impulse-sdk/CMSIS/DSP/Source/CommonTables/%.su Middlewares/edge-impulse-sdk/CMSIS/DSP/Source/CommonTables/%.cyclo: ../Middlewares/edge-impulse-sdk/CMSIS/DSP/Source/CommonTables/%.c Middlewares/edge-impulse-sdk/CMSIS/DSP/Source/CommonTables/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F446xx -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I"/home/ivysson/STM32CubeIDE/workspace_2.1.0/Projeto final/Middlewares" -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Middlewares-2f-edge-2d-impulse-2d-sdk-2f-CMSIS-2f-DSP-2f-Source-2f-CommonTables

clean-Middlewares-2f-edge-2d-impulse-2d-sdk-2f-CMSIS-2f-DSP-2f-Source-2f-CommonTables:
	-$(RM) ./Middlewares/edge-impulse-sdk/CMSIS/DSP/Source/CommonTables/arm_common_tables.cyclo ./Middlewares/edge-impulse-sdk/CMSIS/DSP/Source/CommonTables/arm_common_tables.d ./Middlewares/edge-impulse-sdk/CMSIS/DSP/Source/CommonTables/arm_common_tables.o ./Middlewares/edge-impulse-sdk/CMSIS/DSP/Source/CommonTables/arm_common_tables.su ./Middlewares/edge-impulse-sdk/CMSIS/DSP/Source/CommonTables/arm_common_tables_f16.cyclo ./Middlewares/edge-impulse-sdk/CMSIS/DSP/Source/CommonTables/arm_common_tables_f16.d ./Middlewares/edge-impulse-sdk/CMSIS/DSP/Source/CommonTables/arm_common_tables_f16.o ./Middlewares/edge-impulse-sdk/CMSIS/DSP/Source/CommonTables/arm_common_tables_f16.su ./Middlewares/edge-impulse-sdk/CMSIS/DSP/Source/CommonTables/arm_const_structs.cyclo ./Middlewares/edge-impulse-sdk/CMSIS/DSP/Source/CommonTables/arm_const_structs.d ./Middlewares/edge-impulse-sdk/CMSIS/DSP/Source/CommonTables/arm_const_structs.o ./Middlewares/edge-impulse-sdk/CMSIS/DSP/Source/CommonTables/arm_const_structs.su ./Middlewares/edge-impulse-sdk/CMSIS/DSP/Source/CommonTables/arm_const_structs_f16.cyclo ./Middlewares/edge-impulse-sdk/CMSIS/DSP/Source/CommonTables/arm_const_structs_f16.d ./Middlewares/edge-impulse-sdk/CMSIS/DSP/Source/CommonTables/arm_const_structs_f16.o ./Middlewares/edge-impulse-sdk/CMSIS/DSP/Source/CommonTables/arm_const_structs_f16.su ./Middlewares/edge-impulse-sdk/CMSIS/DSP/Source/CommonTables/arm_mve_tables.cyclo ./Middlewares/edge-impulse-sdk/CMSIS/DSP/Source/CommonTables/arm_mve_tables.d ./Middlewares/edge-impulse-sdk/CMSIS/DSP/Source/CommonTables/arm_mve_tables.o ./Middlewares/edge-impulse-sdk/CMSIS/DSP/Source/CommonTables/arm_mve_tables.su ./Middlewares/edge-impulse-sdk/CMSIS/DSP/Source/CommonTables/arm_mve_tables_f16.cyclo ./Middlewares/edge-impulse-sdk/CMSIS/DSP/Source/CommonTables/arm_mve_tables_f16.d ./Middlewares/edge-impulse-sdk/CMSIS/DSP/Source/CommonTables/arm_mve_tables_f16.o ./Middlewares/edge-impulse-sdk/CMSIS/DSP/Source/CommonTables/arm_mve_tables_f16.su

.PHONY: clean-Middlewares-2f-edge-2d-impulse-2d-sdk-2f-CMSIS-2f-DSP-2f-Source-2f-CommonTables

