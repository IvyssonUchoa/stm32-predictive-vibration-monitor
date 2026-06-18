################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (14.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CPP_SRCS += \
../Middlewares/edge-impulse-sdk/classifier/ei_run_classifier_c.cpp 

OBJS += \
./Middlewares/edge-impulse-sdk/classifier/ei_run_classifier_c.o 

CPP_DEPS += \
./Middlewares/edge-impulse-sdk/classifier/ei_run_classifier_c.d 


# Each subdirectory must supply rules for building sources it contributes
Middlewares/edge-impulse-sdk/classifier/%.o Middlewares/edge-impulse-sdk/classifier/%.su Middlewares/edge-impulse-sdk/classifier/%.cyclo: ../Middlewares/edge-impulse-sdk/classifier/%.cpp Middlewares/edge-impulse-sdk/classifier/subdir.mk
	arm-none-eabi-g++ "$<" -mcpu=cortex-m4 -std=gnu++14 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F446xx -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I"/home/ivysson/STM32CubeIDE/workspace_2.1.0/Projeto final/Middlewares" -O0 -ffunction-sections -fdata-sections -fno-exceptions -fno-rtti -fno-use-cxa-atexit -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Middlewares-2f-edge-2d-impulse-2d-sdk-2f-classifier

clean-Middlewares-2f-edge-2d-impulse-2d-sdk-2f-classifier:
	-$(RM) ./Middlewares/edge-impulse-sdk/classifier/ei_run_classifier_c.cyclo ./Middlewares/edge-impulse-sdk/classifier/ei_run_classifier_c.d ./Middlewares/edge-impulse-sdk/classifier/ei_run_classifier_c.o ./Middlewares/edge-impulse-sdk/classifier/ei_run_classifier_c.su

.PHONY: clean-Middlewares-2f-edge-2d-impulse-2d-sdk-2f-classifier

