################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (14.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CPP_SRCS += \
../Middlewares/edge-impulse-sdk/porting/ambiq/debug_log.cpp \
../Middlewares/edge-impulse-sdk/porting/ambiq/ei_classifier_porting.cpp 

OBJS += \
./Middlewares/edge-impulse-sdk/porting/ambiq/debug_log.o \
./Middlewares/edge-impulse-sdk/porting/ambiq/ei_classifier_porting.o 

CPP_DEPS += \
./Middlewares/edge-impulse-sdk/porting/ambiq/debug_log.d \
./Middlewares/edge-impulse-sdk/porting/ambiq/ei_classifier_porting.d 


# Each subdirectory must supply rules for building sources it contributes
Middlewares/edge-impulse-sdk/porting/ambiq/%.o Middlewares/edge-impulse-sdk/porting/ambiq/%.su Middlewares/edge-impulse-sdk/porting/ambiq/%.cyclo: ../Middlewares/edge-impulse-sdk/porting/ambiq/%.cpp Middlewares/edge-impulse-sdk/porting/ambiq/subdir.mk
	arm-none-eabi-g++ "$<" -mcpu=cortex-m4 -std=gnu++14 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F446xx -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I"/home/ivysson/STM32CubeIDE/workspace_2.1.0/Projeto final/Middlewares" -O0 -ffunction-sections -fdata-sections -fno-exceptions -fno-rtti -fno-use-cxa-atexit -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Middlewares-2f-edge-2d-impulse-2d-sdk-2f-porting-2f-ambiq

clean-Middlewares-2f-edge-2d-impulse-2d-sdk-2f-porting-2f-ambiq:
	-$(RM) ./Middlewares/edge-impulse-sdk/porting/ambiq/debug_log.cyclo ./Middlewares/edge-impulse-sdk/porting/ambiq/debug_log.d ./Middlewares/edge-impulse-sdk/porting/ambiq/debug_log.o ./Middlewares/edge-impulse-sdk/porting/ambiq/debug_log.su ./Middlewares/edge-impulse-sdk/porting/ambiq/ei_classifier_porting.cyclo ./Middlewares/edge-impulse-sdk/porting/ambiq/ei_classifier_porting.d ./Middlewares/edge-impulse-sdk/porting/ambiq/ei_classifier_porting.o ./Middlewares/edge-impulse-sdk/porting/ambiq/ei_classifier_porting.su

.PHONY: clean-Middlewares-2f-edge-2d-impulse-2d-sdk-2f-porting-2f-ambiq

