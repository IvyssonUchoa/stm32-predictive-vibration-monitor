################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (14.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CPP_SRCS += \
../Middlewares/edge-impulse-sdk/porting/himax-we2/debug_log.cpp \
../Middlewares/edge-impulse-sdk/porting/himax-we2/ei_classifier_porting.cpp 

C_SRCS += \
../Middlewares/edge-impulse-sdk/porting/himax-we2/ethosu_driver.c 

C_DEPS += \
./Middlewares/edge-impulse-sdk/porting/himax-we2/ethosu_driver.d 

OBJS += \
./Middlewares/edge-impulse-sdk/porting/himax-we2/debug_log.o \
./Middlewares/edge-impulse-sdk/porting/himax-we2/ei_classifier_porting.o \
./Middlewares/edge-impulse-sdk/porting/himax-we2/ethosu_driver.o 

CPP_DEPS += \
./Middlewares/edge-impulse-sdk/porting/himax-we2/debug_log.d \
./Middlewares/edge-impulse-sdk/porting/himax-we2/ei_classifier_porting.d 


# Each subdirectory must supply rules for building sources it contributes
Middlewares/edge-impulse-sdk/porting/himax-we2/%.o Middlewares/edge-impulse-sdk/porting/himax-we2/%.su Middlewares/edge-impulse-sdk/porting/himax-we2/%.cyclo: ../Middlewares/edge-impulse-sdk/porting/himax-we2/%.cpp Middlewares/edge-impulse-sdk/porting/himax-we2/subdir.mk
	arm-none-eabi-g++ "$<" -mcpu=cortex-m4 -std=gnu++14 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F446xx -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I"/home/ivysson/STM32CubeIDE/workspace_2.1.0/Projeto final/Middlewares" -O0 -ffunction-sections -fdata-sections -fno-exceptions -fno-rtti -fno-use-cxa-atexit -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"
Middlewares/edge-impulse-sdk/porting/himax-we2/%.o Middlewares/edge-impulse-sdk/porting/himax-we2/%.su Middlewares/edge-impulse-sdk/porting/himax-we2/%.cyclo: ../Middlewares/edge-impulse-sdk/porting/himax-we2/%.c Middlewares/edge-impulse-sdk/porting/himax-we2/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F446xx -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I"/home/ivysson/STM32CubeIDE/workspace_2.1.0/Projeto final/Middlewares" -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Middlewares-2f-edge-2d-impulse-2d-sdk-2f-porting-2f-himax-2d-we2

clean-Middlewares-2f-edge-2d-impulse-2d-sdk-2f-porting-2f-himax-2d-we2:
	-$(RM) ./Middlewares/edge-impulse-sdk/porting/himax-we2/debug_log.cyclo ./Middlewares/edge-impulse-sdk/porting/himax-we2/debug_log.d ./Middlewares/edge-impulse-sdk/porting/himax-we2/debug_log.o ./Middlewares/edge-impulse-sdk/porting/himax-we2/debug_log.su ./Middlewares/edge-impulse-sdk/porting/himax-we2/ei_classifier_porting.cyclo ./Middlewares/edge-impulse-sdk/porting/himax-we2/ei_classifier_porting.d ./Middlewares/edge-impulse-sdk/porting/himax-we2/ei_classifier_porting.o ./Middlewares/edge-impulse-sdk/porting/himax-we2/ei_classifier_porting.su ./Middlewares/edge-impulse-sdk/porting/himax-we2/ethosu_driver.cyclo ./Middlewares/edge-impulse-sdk/porting/himax-we2/ethosu_driver.d ./Middlewares/edge-impulse-sdk/porting/himax-we2/ethosu_driver.o ./Middlewares/edge-impulse-sdk/porting/himax-we2/ethosu_driver.su

.PHONY: clean-Middlewares-2f-edge-2d-impulse-2d-sdk-2f-porting-2f-himax-2d-we2

