################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (14.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Middlewares/edge-impulse-sdk/CMSIS/NN/Source/SoftmaxFunctions/arm_nn_softmax_common_s8.c \
../Middlewares/edge-impulse-sdk/CMSIS/NN/Source/SoftmaxFunctions/arm_softmax_q15.c \
../Middlewares/edge-impulse-sdk/CMSIS/NN/Source/SoftmaxFunctions/arm_softmax_q7.c \
../Middlewares/edge-impulse-sdk/CMSIS/NN/Source/SoftmaxFunctions/arm_softmax_s16.c \
../Middlewares/edge-impulse-sdk/CMSIS/NN/Source/SoftmaxFunctions/arm_softmax_s8.c \
../Middlewares/edge-impulse-sdk/CMSIS/NN/Source/SoftmaxFunctions/arm_softmax_s8_s16.c \
../Middlewares/edge-impulse-sdk/CMSIS/NN/Source/SoftmaxFunctions/arm_softmax_u8.c \
../Middlewares/edge-impulse-sdk/CMSIS/NN/Source/SoftmaxFunctions/arm_softmax_with_batch_q7.c 

C_DEPS += \
./Middlewares/edge-impulse-sdk/CMSIS/NN/Source/SoftmaxFunctions/arm_nn_softmax_common_s8.d \
./Middlewares/edge-impulse-sdk/CMSIS/NN/Source/SoftmaxFunctions/arm_softmax_q15.d \
./Middlewares/edge-impulse-sdk/CMSIS/NN/Source/SoftmaxFunctions/arm_softmax_q7.d \
./Middlewares/edge-impulse-sdk/CMSIS/NN/Source/SoftmaxFunctions/arm_softmax_s16.d \
./Middlewares/edge-impulse-sdk/CMSIS/NN/Source/SoftmaxFunctions/arm_softmax_s8.d \
./Middlewares/edge-impulse-sdk/CMSIS/NN/Source/SoftmaxFunctions/arm_softmax_s8_s16.d \
./Middlewares/edge-impulse-sdk/CMSIS/NN/Source/SoftmaxFunctions/arm_softmax_u8.d \
./Middlewares/edge-impulse-sdk/CMSIS/NN/Source/SoftmaxFunctions/arm_softmax_with_batch_q7.d 

OBJS += \
./Middlewares/edge-impulse-sdk/CMSIS/NN/Source/SoftmaxFunctions/arm_nn_softmax_common_s8.o \
./Middlewares/edge-impulse-sdk/CMSIS/NN/Source/SoftmaxFunctions/arm_softmax_q15.o \
./Middlewares/edge-impulse-sdk/CMSIS/NN/Source/SoftmaxFunctions/arm_softmax_q7.o \
./Middlewares/edge-impulse-sdk/CMSIS/NN/Source/SoftmaxFunctions/arm_softmax_s16.o \
./Middlewares/edge-impulse-sdk/CMSIS/NN/Source/SoftmaxFunctions/arm_softmax_s8.o \
./Middlewares/edge-impulse-sdk/CMSIS/NN/Source/SoftmaxFunctions/arm_softmax_s8_s16.o \
./Middlewares/edge-impulse-sdk/CMSIS/NN/Source/SoftmaxFunctions/arm_softmax_u8.o \
./Middlewares/edge-impulse-sdk/CMSIS/NN/Source/SoftmaxFunctions/arm_softmax_with_batch_q7.o 


# Each subdirectory must supply rules for building sources it contributes
Middlewares/edge-impulse-sdk/CMSIS/NN/Source/SoftmaxFunctions/%.o Middlewares/edge-impulse-sdk/CMSIS/NN/Source/SoftmaxFunctions/%.su Middlewares/edge-impulse-sdk/CMSIS/NN/Source/SoftmaxFunctions/%.cyclo: ../Middlewares/edge-impulse-sdk/CMSIS/NN/Source/SoftmaxFunctions/%.c Middlewares/edge-impulse-sdk/CMSIS/NN/Source/SoftmaxFunctions/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F446xx -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I"/home/ivysson/STM32CubeIDE/workspace_2.1.0/Projeto final/Middlewares" -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Middlewares-2f-edge-2d-impulse-2d-sdk-2f-CMSIS-2f-NN-2f-Source-2f-SoftmaxFunctions

clean-Middlewares-2f-edge-2d-impulse-2d-sdk-2f-CMSIS-2f-NN-2f-Source-2f-SoftmaxFunctions:
	-$(RM) ./Middlewares/edge-impulse-sdk/CMSIS/NN/Source/SoftmaxFunctions/arm_nn_softmax_common_s8.cyclo ./Middlewares/edge-impulse-sdk/CMSIS/NN/Source/SoftmaxFunctions/arm_nn_softmax_common_s8.d ./Middlewares/edge-impulse-sdk/CMSIS/NN/Source/SoftmaxFunctions/arm_nn_softmax_common_s8.o ./Middlewares/edge-impulse-sdk/CMSIS/NN/Source/SoftmaxFunctions/arm_nn_softmax_common_s8.su ./Middlewares/edge-impulse-sdk/CMSIS/NN/Source/SoftmaxFunctions/arm_softmax_q15.cyclo ./Middlewares/edge-impulse-sdk/CMSIS/NN/Source/SoftmaxFunctions/arm_softmax_q15.d ./Middlewares/edge-impulse-sdk/CMSIS/NN/Source/SoftmaxFunctions/arm_softmax_q15.o ./Middlewares/edge-impulse-sdk/CMSIS/NN/Source/SoftmaxFunctions/arm_softmax_q15.su ./Middlewares/edge-impulse-sdk/CMSIS/NN/Source/SoftmaxFunctions/arm_softmax_q7.cyclo ./Middlewares/edge-impulse-sdk/CMSIS/NN/Source/SoftmaxFunctions/arm_softmax_q7.d ./Middlewares/edge-impulse-sdk/CMSIS/NN/Source/SoftmaxFunctions/arm_softmax_q7.o ./Middlewares/edge-impulse-sdk/CMSIS/NN/Source/SoftmaxFunctions/arm_softmax_q7.su ./Middlewares/edge-impulse-sdk/CMSIS/NN/Source/SoftmaxFunctions/arm_softmax_s16.cyclo ./Middlewares/edge-impulse-sdk/CMSIS/NN/Source/SoftmaxFunctions/arm_softmax_s16.d ./Middlewares/edge-impulse-sdk/CMSIS/NN/Source/SoftmaxFunctions/arm_softmax_s16.o ./Middlewares/edge-impulse-sdk/CMSIS/NN/Source/SoftmaxFunctions/arm_softmax_s16.su ./Middlewares/edge-impulse-sdk/CMSIS/NN/Source/SoftmaxFunctions/arm_softmax_s8.cyclo ./Middlewares/edge-impulse-sdk/CMSIS/NN/Source/SoftmaxFunctions/arm_softmax_s8.d ./Middlewares/edge-impulse-sdk/CMSIS/NN/Source/SoftmaxFunctions/arm_softmax_s8.o ./Middlewares/edge-impulse-sdk/CMSIS/NN/Source/SoftmaxFunctions/arm_softmax_s8.su ./Middlewares/edge-impulse-sdk/CMSIS/NN/Source/SoftmaxFunctions/arm_softmax_s8_s16.cyclo ./Middlewares/edge-impulse-sdk/CMSIS/NN/Source/SoftmaxFunctions/arm_softmax_s8_s16.d ./Middlewares/edge-impulse-sdk/CMSIS/NN/Source/SoftmaxFunctions/arm_softmax_s8_s16.o ./Middlewares/edge-impulse-sdk/CMSIS/NN/Source/SoftmaxFunctions/arm_softmax_s8_s16.su ./Middlewares/edge-impulse-sdk/CMSIS/NN/Source/SoftmaxFunctions/arm_softmax_u8.cyclo ./Middlewares/edge-impulse-sdk/CMSIS/NN/Source/SoftmaxFunctions/arm_softmax_u8.d ./Middlewares/edge-impulse-sdk/CMSIS/NN/Source/SoftmaxFunctions/arm_softmax_u8.o ./Middlewares/edge-impulse-sdk/CMSIS/NN/Source/SoftmaxFunctions/arm_softmax_u8.su ./Middlewares/edge-impulse-sdk/CMSIS/NN/Source/SoftmaxFunctions/arm_softmax_with_batch_q7.cyclo ./Middlewares/edge-impulse-sdk/CMSIS/NN/Source/SoftmaxFunctions/arm_softmax_with_batch_q7.d ./Middlewares/edge-impulse-sdk/CMSIS/NN/Source/SoftmaxFunctions/arm_softmax_with_batch_q7.o ./Middlewares/edge-impulse-sdk/CMSIS/NN/Source/SoftmaxFunctions/arm_softmax_with_batch_q7.su

.PHONY: clean-Middlewares-2f-edge-2d-impulse-2d-sdk-2f-CMSIS-2f-NN-2f-Source-2f-SoftmaxFunctions

