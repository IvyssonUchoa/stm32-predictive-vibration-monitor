################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (14.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../Middlewares/edge-impulse-sdk/tensorflow/lite/kernels/kernel_util_lite.cc 

CC_DEPS += \
./Middlewares/edge-impulse-sdk/tensorflow/lite/kernels/kernel_util_lite.d 

OBJS += \
./Middlewares/edge-impulse-sdk/tensorflow/lite/kernels/kernel_util_lite.o 


# Each subdirectory must supply rules for building sources it contributes
Middlewares/edge-impulse-sdk/tensorflow/lite/kernels/%.o Middlewares/edge-impulse-sdk/tensorflow/lite/kernels/%.su Middlewares/edge-impulse-sdk/tensorflow/lite/kernels/%.cyclo: ../Middlewares/edge-impulse-sdk/tensorflow/lite/kernels/%.cc Middlewares/edge-impulse-sdk/tensorflow/lite/kernels/subdir.mk
	arm-none-eabi-g++ "$<" -mcpu=cortex-m4 -std=gnu++14 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F446xx -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I"/home/ivysson/STM32CubeIDE/workspace_2.1.0/Projeto final/Middlewares" -O0 -ffunction-sections -fdata-sections -fno-exceptions -fno-rtti -fno-use-cxa-atexit -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Middlewares-2f-edge-2d-impulse-2d-sdk-2f-tensorflow-2f-lite-2f-kernels

clean-Middlewares-2f-edge-2d-impulse-2d-sdk-2f-tensorflow-2f-lite-2f-kernels:
	-$(RM) ./Middlewares/edge-impulse-sdk/tensorflow/lite/kernels/kernel_util_lite.cyclo ./Middlewares/edge-impulse-sdk/tensorflow/lite/kernels/kernel_util_lite.d ./Middlewares/edge-impulse-sdk/tensorflow/lite/kernels/kernel_util_lite.o ./Middlewares/edge-impulse-sdk/tensorflow/lite/kernels/kernel_util_lite.su

.PHONY: clean-Middlewares-2f-edge-2d-impulse-2d-sdk-2f-tensorflow-2f-lite-2f-kernels

