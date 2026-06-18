################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (14.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../Middlewares/edge-impulse-sdk/tensorflow/lite/kernels/internal/portable_tensor_utils.cc \
../Middlewares/edge-impulse-sdk/tensorflow/lite/kernels/internal/quantization_util.cc \
../Middlewares/edge-impulse-sdk/tensorflow/lite/kernels/internal/reference_portable_tensor_utils.cc \
../Middlewares/edge-impulse-sdk/tensorflow/lite/kernels/internal/tensor_utils.cc 

CC_DEPS += \
./Middlewares/edge-impulse-sdk/tensorflow/lite/kernels/internal/portable_tensor_utils.d \
./Middlewares/edge-impulse-sdk/tensorflow/lite/kernels/internal/quantization_util.d \
./Middlewares/edge-impulse-sdk/tensorflow/lite/kernels/internal/reference_portable_tensor_utils.d \
./Middlewares/edge-impulse-sdk/tensorflow/lite/kernels/internal/tensor_utils.d 

OBJS += \
./Middlewares/edge-impulse-sdk/tensorflow/lite/kernels/internal/portable_tensor_utils.o \
./Middlewares/edge-impulse-sdk/tensorflow/lite/kernels/internal/quantization_util.o \
./Middlewares/edge-impulse-sdk/tensorflow/lite/kernels/internal/reference_portable_tensor_utils.o \
./Middlewares/edge-impulse-sdk/tensorflow/lite/kernels/internal/tensor_utils.o 


# Each subdirectory must supply rules for building sources it contributes
Middlewares/edge-impulse-sdk/tensorflow/lite/kernels/internal/%.o Middlewares/edge-impulse-sdk/tensorflow/lite/kernels/internal/%.su Middlewares/edge-impulse-sdk/tensorflow/lite/kernels/internal/%.cyclo: ../Middlewares/edge-impulse-sdk/tensorflow/lite/kernels/internal/%.cc Middlewares/edge-impulse-sdk/tensorflow/lite/kernels/internal/subdir.mk
	arm-none-eabi-g++ "$<" -mcpu=cortex-m4 -std=gnu++14 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F446xx -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I"/home/ivysson/STM32CubeIDE/workspace_2.1.0/Projeto final/Middlewares" -O0 -ffunction-sections -fdata-sections -fno-exceptions -fno-rtti -fno-use-cxa-atexit -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Middlewares-2f-edge-2d-impulse-2d-sdk-2f-tensorflow-2f-lite-2f-kernels-2f-internal

clean-Middlewares-2f-edge-2d-impulse-2d-sdk-2f-tensorflow-2f-lite-2f-kernels-2f-internal:
	-$(RM) ./Middlewares/edge-impulse-sdk/tensorflow/lite/kernels/internal/portable_tensor_utils.cyclo ./Middlewares/edge-impulse-sdk/tensorflow/lite/kernels/internal/portable_tensor_utils.d ./Middlewares/edge-impulse-sdk/tensorflow/lite/kernels/internal/portable_tensor_utils.o ./Middlewares/edge-impulse-sdk/tensorflow/lite/kernels/internal/portable_tensor_utils.su ./Middlewares/edge-impulse-sdk/tensorflow/lite/kernels/internal/quantization_util.cyclo ./Middlewares/edge-impulse-sdk/tensorflow/lite/kernels/internal/quantization_util.d ./Middlewares/edge-impulse-sdk/tensorflow/lite/kernels/internal/quantization_util.o ./Middlewares/edge-impulse-sdk/tensorflow/lite/kernels/internal/quantization_util.su ./Middlewares/edge-impulse-sdk/tensorflow/lite/kernels/internal/reference_portable_tensor_utils.cyclo ./Middlewares/edge-impulse-sdk/tensorflow/lite/kernels/internal/reference_portable_tensor_utils.d ./Middlewares/edge-impulse-sdk/tensorflow/lite/kernels/internal/reference_portable_tensor_utils.o ./Middlewares/edge-impulse-sdk/tensorflow/lite/kernels/internal/reference_portable_tensor_utils.su ./Middlewares/edge-impulse-sdk/tensorflow/lite/kernels/internal/tensor_utils.cyclo ./Middlewares/edge-impulse-sdk/tensorflow/lite/kernels/internal/tensor_utils.d ./Middlewares/edge-impulse-sdk/tensorflow/lite/kernels/internal/tensor_utils.o ./Middlewares/edge-impulse-sdk/tensorflow/lite/kernels/internal/tensor_utils.su

.PHONY: clean-Middlewares-2f-edge-2d-impulse-2d-sdk-2f-tensorflow-2f-lite-2f-kernels-2f-internal

