################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (14.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Middlewares/edge-impulse-sdk/tensorflow/lite/c/common.c 

C_DEPS += \
./Middlewares/edge-impulse-sdk/tensorflow/lite/c/common.d 

OBJS += \
./Middlewares/edge-impulse-sdk/tensorflow/lite/c/common.o 


# Each subdirectory must supply rules for building sources it contributes
Middlewares/edge-impulse-sdk/tensorflow/lite/c/%.o Middlewares/edge-impulse-sdk/tensorflow/lite/c/%.su Middlewares/edge-impulse-sdk/tensorflow/lite/c/%.cyclo: ../Middlewares/edge-impulse-sdk/tensorflow/lite/c/%.c Middlewares/edge-impulse-sdk/tensorflow/lite/c/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F446xx -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I"/home/ivysson/STM32CubeIDE/workspace_2.1.0/Projeto final/Middlewares" -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Middlewares-2f-edge-2d-impulse-2d-sdk-2f-tensorflow-2f-lite-2f-c

clean-Middlewares-2f-edge-2d-impulse-2d-sdk-2f-tensorflow-2f-lite-2f-c:
	-$(RM) ./Middlewares/edge-impulse-sdk/tensorflow/lite/c/common.cyclo ./Middlewares/edge-impulse-sdk/tensorflow/lite/c/common.d ./Middlewares/edge-impulse-sdk/tensorflow/lite/c/common.o ./Middlewares/edge-impulse-sdk/tensorflow/lite/c/common.su

.PHONY: clean-Middlewares-2f-edge-2d-impulse-2d-sdk-2f-tensorflow-2f-lite-2f-c

