################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (14.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Middlewares/edge-impulse-sdk/CMSIS/NN/Source/SVDFunctions/arm_svdf_s8.c \
../Middlewares/edge-impulse-sdk/CMSIS/NN/Source/SVDFunctions/arm_svdf_state_s16_s8.c 

C_DEPS += \
./Middlewares/edge-impulse-sdk/CMSIS/NN/Source/SVDFunctions/arm_svdf_s8.d \
./Middlewares/edge-impulse-sdk/CMSIS/NN/Source/SVDFunctions/arm_svdf_state_s16_s8.d 

OBJS += \
./Middlewares/edge-impulse-sdk/CMSIS/NN/Source/SVDFunctions/arm_svdf_s8.o \
./Middlewares/edge-impulse-sdk/CMSIS/NN/Source/SVDFunctions/arm_svdf_state_s16_s8.o 


# Each subdirectory must supply rules for building sources it contributes
Middlewares/edge-impulse-sdk/CMSIS/NN/Source/SVDFunctions/%.o Middlewares/edge-impulse-sdk/CMSIS/NN/Source/SVDFunctions/%.su Middlewares/edge-impulse-sdk/CMSIS/NN/Source/SVDFunctions/%.cyclo: ../Middlewares/edge-impulse-sdk/CMSIS/NN/Source/SVDFunctions/%.c Middlewares/edge-impulse-sdk/CMSIS/NN/Source/SVDFunctions/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F446xx -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I"/home/ivysson/STM32CubeIDE/workspace_2.1.0/Projeto final/Middlewares" -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Middlewares-2f-edge-2d-impulse-2d-sdk-2f-CMSIS-2f-NN-2f-Source-2f-SVDFunctions

clean-Middlewares-2f-edge-2d-impulse-2d-sdk-2f-CMSIS-2f-NN-2f-Source-2f-SVDFunctions:
	-$(RM) ./Middlewares/edge-impulse-sdk/CMSIS/NN/Source/SVDFunctions/arm_svdf_s8.cyclo ./Middlewares/edge-impulse-sdk/CMSIS/NN/Source/SVDFunctions/arm_svdf_s8.d ./Middlewares/edge-impulse-sdk/CMSIS/NN/Source/SVDFunctions/arm_svdf_s8.o ./Middlewares/edge-impulse-sdk/CMSIS/NN/Source/SVDFunctions/arm_svdf_s8.su ./Middlewares/edge-impulse-sdk/CMSIS/NN/Source/SVDFunctions/arm_svdf_state_s16_s8.cyclo ./Middlewares/edge-impulse-sdk/CMSIS/NN/Source/SVDFunctions/arm_svdf_state_s16_s8.d ./Middlewares/edge-impulse-sdk/CMSIS/NN/Source/SVDFunctions/arm_svdf_state_s16_s8.o ./Middlewares/edge-impulse-sdk/CMSIS/NN/Source/SVDFunctions/arm_svdf_state_s16_s8.su

.PHONY: clean-Middlewares-2f-edge-2d-impulse-2d-sdk-2f-CMSIS-2f-NN-2f-Source-2f-SVDFunctions

