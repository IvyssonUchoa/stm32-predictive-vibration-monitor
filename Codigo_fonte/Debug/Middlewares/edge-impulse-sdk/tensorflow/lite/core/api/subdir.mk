################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (14.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../Middlewares/edge-impulse-sdk/tensorflow/lite/core/api/common.cc \
../Middlewares/edge-impulse-sdk/tensorflow/lite/core/api/error_reporter.cc \
../Middlewares/edge-impulse-sdk/tensorflow/lite/core/api/flatbuffer_conversions.cc \
../Middlewares/edge-impulse-sdk/tensorflow/lite/core/api/op_resolver.cc \
../Middlewares/edge-impulse-sdk/tensorflow/lite/core/api/tensor_utils.cc 

CC_DEPS += \
./Middlewares/edge-impulse-sdk/tensorflow/lite/core/api/common.d \
./Middlewares/edge-impulse-sdk/tensorflow/lite/core/api/error_reporter.d \
./Middlewares/edge-impulse-sdk/tensorflow/lite/core/api/flatbuffer_conversions.d \
./Middlewares/edge-impulse-sdk/tensorflow/lite/core/api/op_resolver.d \
./Middlewares/edge-impulse-sdk/tensorflow/lite/core/api/tensor_utils.d 

OBJS += \
./Middlewares/edge-impulse-sdk/tensorflow/lite/core/api/common.o \
./Middlewares/edge-impulse-sdk/tensorflow/lite/core/api/error_reporter.o \
./Middlewares/edge-impulse-sdk/tensorflow/lite/core/api/flatbuffer_conversions.o \
./Middlewares/edge-impulse-sdk/tensorflow/lite/core/api/op_resolver.o \
./Middlewares/edge-impulse-sdk/tensorflow/lite/core/api/tensor_utils.o 


# Each subdirectory must supply rules for building sources it contributes
Middlewares/edge-impulse-sdk/tensorflow/lite/core/api/%.o Middlewares/edge-impulse-sdk/tensorflow/lite/core/api/%.su Middlewares/edge-impulse-sdk/tensorflow/lite/core/api/%.cyclo: ../Middlewares/edge-impulse-sdk/tensorflow/lite/core/api/%.cc Middlewares/edge-impulse-sdk/tensorflow/lite/core/api/subdir.mk
	arm-none-eabi-g++ "$<" -mcpu=cortex-m4 -std=gnu++14 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F446xx -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I"/home/ivysson/STM32CubeIDE/workspace_2.1.0/Projeto final/Middlewares" -O0 -ffunction-sections -fdata-sections -fno-exceptions -fno-rtti -fno-use-cxa-atexit -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Middlewares-2f-edge-2d-impulse-2d-sdk-2f-tensorflow-2f-lite-2f-core-2f-api

clean-Middlewares-2f-edge-2d-impulse-2d-sdk-2f-tensorflow-2f-lite-2f-core-2f-api:
	-$(RM) ./Middlewares/edge-impulse-sdk/tensorflow/lite/core/api/common.cyclo ./Middlewares/edge-impulse-sdk/tensorflow/lite/core/api/common.d ./Middlewares/edge-impulse-sdk/tensorflow/lite/core/api/common.o ./Middlewares/edge-impulse-sdk/tensorflow/lite/core/api/common.su ./Middlewares/edge-impulse-sdk/tensorflow/lite/core/api/error_reporter.cyclo ./Middlewares/edge-impulse-sdk/tensorflow/lite/core/api/error_reporter.d ./Middlewares/edge-impulse-sdk/tensorflow/lite/core/api/error_reporter.o ./Middlewares/edge-impulse-sdk/tensorflow/lite/core/api/error_reporter.su ./Middlewares/edge-impulse-sdk/tensorflow/lite/core/api/flatbuffer_conversions.cyclo ./Middlewares/edge-impulse-sdk/tensorflow/lite/core/api/flatbuffer_conversions.d ./Middlewares/edge-impulse-sdk/tensorflow/lite/core/api/flatbuffer_conversions.o ./Middlewares/edge-impulse-sdk/tensorflow/lite/core/api/flatbuffer_conversions.su ./Middlewares/edge-impulse-sdk/tensorflow/lite/core/api/op_resolver.cyclo ./Middlewares/edge-impulse-sdk/tensorflow/lite/core/api/op_resolver.d ./Middlewares/edge-impulse-sdk/tensorflow/lite/core/api/op_resolver.o ./Middlewares/edge-impulse-sdk/tensorflow/lite/core/api/op_resolver.su ./Middlewares/edge-impulse-sdk/tensorflow/lite/core/api/tensor_utils.cyclo ./Middlewares/edge-impulse-sdk/tensorflow/lite/core/api/tensor_utils.d ./Middlewares/edge-impulse-sdk/tensorflow/lite/core/api/tensor_utils.o ./Middlewares/edge-impulse-sdk/tensorflow/lite/core/api/tensor_utils.su

.PHONY: clean-Middlewares-2f-edge-2d-impulse-2d-sdk-2f-tensorflow-2f-lite-2f-core-2f-api

