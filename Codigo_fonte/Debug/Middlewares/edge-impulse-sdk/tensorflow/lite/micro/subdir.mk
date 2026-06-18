################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (14.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../Middlewares/edge-impulse-sdk/tensorflow/lite/micro/all_ops_resolver.cc \
../Middlewares/edge-impulse-sdk/tensorflow/lite/micro/fake_micro_context.cc \
../Middlewares/edge-impulse-sdk/tensorflow/lite/micro/flatbuffer_conversions_bridge.cc \
../Middlewares/edge-impulse-sdk/tensorflow/lite/micro/flatbuffer_utils.cc \
../Middlewares/edge-impulse-sdk/tensorflow/lite/micro/memory_helpers.cc \
../Middlewares/edge-impulse-sdk/tensorflow/lite/micro/micro_allocation_info.cc \
../Middlewares/edge-impulse-sdk/tensorflow/lite/micro/micro_allocator.cc \
../Middlewares/edge-impulse-sdk/tensorflow/lite/micro/micro_context.cc \
../Middlewares/edge-impulse-sdk/tensorflow/lite/micro/micro_error_reporter.cc \
../Middlewares/edge-impulse-sdk/tensorflow/lite/micro/micro_graph.cc \
../Middlewares/edge-impulse-sdk/tensorflow/lite/micro/micro_interpreter.cc \
../Middlewares/edge-impulse-sdk/tensorflow/lite/micro/micro_log.cc \
../Middlewares/edge-impulse-sdk/tensorflow/lite/micro/micro_profiler.cc \
../Middlewares/edge-impulse-sdk/tensorflow/lite/micro/micro_resource_variable.cc \
../Middlewares/edge-impulse-sdk/tensorflow/lite/micro/micro_string.cc \
../Middlewares/edge-impulse-sdk/tensorflow/lite/micro/micro_time.cc \
../Middlewares/edge-impulse-sdk/tensorflow/lite/micro/micro_utils.cc \
../Middlewares/edge-impulse-sdk/tensorflow/lite/micro/mock_micro_graph.cc \
../Middlewares/edge-impulse-sdk/tensorflow/lite/micro/non_persistent_arena_buffer_allocator.cc \
../Middlewares/edge-impulse-sdk/tensorflow/lite/micro/op_resolver_bridge.cc \
../Middlewares/edge-impulse-sdk/tensorflow/lite/micro/persistent_arena_buffer_allocator.cc \
../Middlewares/edge-impulse-sdk/tensorflow/lite/micro/recording_micro_allocator.cc \
../Middlewares/edge-impulse-sdk/tensorflow/lite/micro/recording_single_arena_buffer_allocator.cc \
../Middlewares/edge-impulse-sdk/tensorflow/lite/micro/schema_utils.cc \
../Middlewares/edge-impulse-sdk/tensorflow/lite/micro/single_arena_buffer_allocator.cc \
../Middlewares/edge-impulse-sdk/tensorflow/lite/micro/system_setup.cc \
../Middlewares/edge-impulse-sdk/tensorflow/lite/micro/test_helper_custom_ops.cc \
../Middlewares/edge-impulse-sdk/tensorflow/lite/micro/test_helpers.cc 

CC_DEPS += \
./Middlewares/edge-impulse-sdk/tensorflow/lite/micro/all_ops_resolver.d \
./Middlewares/edge-impulse-sdk/tensorflow/lite/micro/fake_micro_context.d \
./Middlewares/edge-impulse-sdk/tensorflow/lite/micro/flatbuffer_conversions_bridge.d \
./Middlewares/edge-impulse-sdk/tensorflow/lite/micro/flatbuffer_utils.d \
./Middlewares/edge-impulse-sdk/tensorflow/lite/micro/memory_helpers.d \
./Middlewares/edge-impulse-sdk/tensorflow/lite/micro/micro_allocation_info.d \
./Middlewares/edge-impulse-sdk/tensorflow/lite/micro/micro_allocator.d \
./Middlewares/edge-impulse-sdk/tensorflow/lite/micro/micro_context.d \
./Middlewares/edge-impulse-sdk/tensorflow/lite/micro/micro_error_reporter.d \
./Middlewares/edge-impulse-sdk/tensorflow/lite/micro/micro_graph.d \
./Middlewares/edge-impulse-sdk/tensorflow/lite/micro/micro_interpreter.d \
./Middlewares/edge-impulse-sdk/tensorflow/lite/micro/micro_log.d \
./Middlewares/edge-impulse-sdk/tensorflow/lite/micro/micro_profiler.d \
./Middlewares/edge-impulse-sdk/tensorflow/lite/micro/micro_resource_variable.d \
./Middlewares/edge-impulse-sdk/tensorflow/lite/micro/micro_string.d \
./Middlewares/edge-impulse-sdk/tensorflow/lite/micro/micro_time.d \
./Middlewares/edge-impulse-sdk/tensorflow/lite/micro/micro_utils.d \
./Middlewares/edge-impulse-sdk/tensorflow/lite/micro/mock_micro_graph.d \
./Middlewares/edge-impulse-sdk/tensorflow/lite/micro/non_persistent_arena_buffer_allocator.d \
./Middlewares/edge-impulse-sdk/tensorflow/lite/micro/op_resolver_bridge.d \
./Middlewares/edge-impulse-sdk/tensorflow/lite/micro/persistent_arena_buffer_allocator.d \
./Middlewares/edge-impulse-sdk/tensorflow/lite/micro/recording_micro_allocator.d \
./Middlewares/edge-impulse-sdk/tensorflow/lite/micro/recording_single_arena_buffer_allocator.d \
./Middlewares/edge-impulse-sdk/tensorflow/lite/micro/schema_utils.d \
./Middlewares/edge-impulse-sdk/tensorflow/lite/micro/single_arena_buffer_allocator.d \
./Middlewares/edge-impulse-sdk/tensorflow/lite/micro/system_setup.d \
./Middlewares/edge-impulse-sdk/tensorflow/lite/micro/test_helper_custom_ops.d \
./Middlewares/edge-impulse-sdk/tensorflow/lite/micro/test_helpers.d 

OBJS += \
./Middlewares/edge-impulse-sdk/tensorflow/lite/micro/all_ops_resolver.o \
./Middlewares/edge-impulse-sdk/tensorflow/lite/micro/fake_micro_context.o \
./Middlewares/edge-impulse-sdk/tensorflow/lite/micro/flatbuffer_conversions_bridge.o \
./Middlewares/edge-impulse-sdk/tensorflow/lite/micro/flatbuffer_utils.o \
./Middlewares/edge-impulse-sdk/tensorflow/lite/micro/memory_helpers.o \
./Middlewares/edge-impulse-sdk/tensorflow/lite/micro/micro_allocation_info.o \
./Middlewares/edge-impulse-sdk/tensorflow/lite/micro/micro_allocator.o \
./Middlewares/edge-impulse-sdk/tensorflow/lite/micro/micro_context.o \
./Middlewares/edge-impulse-sdk/tensorflow/lite/micro/micro_error_reporter.o \
./Middlewares/edge-impulse-sdk/tensorflow/lite/micro/micro_graph.o \
./Middlewares/edge-impulse-sdk/tensorflow/lite/micro/micro_interpreter.o \
./Middlewares/edge-impulse-sdk/tensorflow/lite/micro/micro_log.o \
./Middlewares/edge-impulse-sdk/tensorflow/lite/micro/micro_profiler.o \
./Middlewares/edge-impulse-sdk/tensorflow/lite/micro/micro_resource_variable.o \
./Middlewares/edge-impulse-sdk/tensorflow/lite/micro/micro_string.o \
./Middlewares/edge-impulse-sdk/tensorflow/lite/micro/micro_time.o \
./Middlewares/edge-impulse-sdk/tensorflow/lite/micro/micro_utils.o \
./Middlewares/edge-impulse-sdk/tensorflow/lite/micro/mock_micro_graph.o \
./Middlewares/edge-impulse-sdk/tensorflow/lite/micro/non_persistent_arena_buffer_allocator.o \
./Middlewares/edge-impulse-sdk/tensorflow/lite/micro/op_resolver_bridge.o \
./Middlewares/edge-impulse-sdk/tensorflow/lite/micro/persistent_arena_buffer_allocator.o \
./Middlewares/edge-impulse-sdk/tensorflow/lite/micro/recording_micro_allocator.o \
./Middlewares/edge-impulse-sdk/tensorflow/lite/micro/recording_single_arena_buffer_allocator.o \
./Middlewares/edge-impulse-sdk/tensorflow/lite/micro/schema_utils.o \
./Middlewares/edge-impulse-sdk/tensorflow/lite/micro/single_arena_buffer_allocator.o \
./Middlewares/edge-impulse-sdk/tensorflow/lite/micro/system_setup.o \
./Middlewares/edge-impulse-sdk/tensorflow/lite/micro/test_helper_custom_ops.o \
./Middlewares/edge-impulse-sdk/tensorflow/lite/micro/test_helpers.o 


# Each subdirectory must supply rules for building sources it contributes
Middlewares/edge-impulse-sdk/tensorflow/lite/micro/%.o Middlewares/edge-impulse-sdk/tensorflow/lite/micro/%.su Middlewares/edge-impulse-sdk/tensorflow/lite/micro/%.cyclo: ../Middlewares/edge-impulse-sdk/tensorflow/lite/micro/%.cc Middlewares/edge-impulse-sdk/tensorflow/lite/micro/subdir.mk
	arm-none-eabi-g++ "$<" -mcpu=cortex-m4 -std=gnu++14 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F446xx -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I"/home/ivysson/STM32CubeIDE/workspace_2.1.0/Projeto final/Middlewares" -O0 -ffunction-sections -fdata-sections -fno-exceptions -fno-rtti -fno-use-cxa-atexit -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Middlewares-2f-edge-2d-impulse-2d-sdk-2f-tensorflow-2f-lite-2f-micro

clean-Middlewares-2f-edge-2d-impulse-2d-sdk-2f-tensorflow-2f-lite-2f-micro:
	-$(RM) ./Middlewares/edge-impulse-sdk/tensorflow/lite/micro/all_ops_resolver.cyclo ./Middlewares/edge-impulse-sdk/tensorflow/lite/micro/all_ops_resolver.d ./Middlewares/edge-impulse-sdk/tensorflow/lite/micro/all_ops_resolver.o ./Middlewares/edge-impulse-sdk/tensorflow/lite/micro/all_ops_resolver.su ./Middlewares/edge-impulse-sdk/tensorflow/lite/micro/fake_micro_context.cyclo ./Middlewares/edge-impulse-sdk/tensorflow/lite/micro/fake_micro_context.d ./Middlewares/edge-impulse-sdk/tensorflow/lite/micro/fake_micro_context.o ./Middlewares/edge-impulse-sdk/tensorflow/lite/micro/fake_micro_context.su ./Middlewares/edge-impulse-sdk/tensorflow/lite/micro/flatbuffer_conversions_bridge.cyclo ./Middlewares/edge-impulse-sdk/tensorflow/lite/micro/flatbuffer_conversions_bridge.d ./Middlewares/edge-impulse-sdk/tensorflow/lite/micro/flatbuffer_conversions_bridge.o ./Middlewares/edge-impulse-sdk/tensorflow/lite/micro/flatbuffer_conversions_bridge.su ./Middlewares/edge-impulse-sdk/tensorflow/lite/micro/flatbuffer_utils.cyclo ./Middlewares/edge-impulse-sdk/tensorflow/lite/micro/flatbuffer_utils.d ./Middlewares/edge-impulse-sdk/tensorflow/lite/micro/flatbuffer_utils.o ./Middlewares/edge-impulse-sdk/tensorflow/lite/micro/flatbuffer_utils.su ./Middlewares/edge-impulse-sdk/tensorflow/lite/micro/memory_helpers.cyclo ./Middlewares/edge-impulse-sdk/tensorflow/lite/micro/memory_helpers.d ./Middlewares/edge-impulse-sdk/tensorflow/lite/micro/memory_helpers.o ./Middlewares/edge-impulse-sdk/tensorflow/lite/micro/memory_helpers.su ./Middlewares/edge-impulse-sdk/tensorflow/lite/micro/micro_allocation_info.cyclo ./Middlewares/edge-impulse-sdk/tensorflow/lite/micro/micro_allocation_info.d ./Middlewares/edge-impulse-sdk/tensorflow/lite/micro/micro_allocation_info.o ./Middlewares/edge-impulse-sdk/tensorflow/lite/micro/micro_allocation_info.su ./Middlewares/edge-impulse-sdk/tensorflow/lite/micro/micro_allocator.cyclo ./Middlewares/edge-impulse-sdk/tensorflow/lite/micro/micro_allocator.d ./Middlewares/edge-impulse-sdk/tensorflow/lite/micro/micro_allocator.o ./Middlewares/edge-impulse-sdk/tensorflow/lite/micro/micro_allocator.su ./Middlewares/edge-impulse-sdk/tensorflow/lite/micro/micro_context.cyclo ./Middlewares/edge-impulse-sdk/tensorflow/lite/micro/micro_context.d ./Middlewares/edge-impulse-sdk/tensorflow/lite/micro/micro_context.o ./Middlewares/edge-impulse-sdk/tensorflow/lite/micro/micro_context.su ./Middlewares/edge-impulse-sdk/tensorflow/lite/micro/micro_error_reporter.cyclo ./Middlewares/edge-impulse-sdk/tensorflow/lite/micro/micro_error_reporter.d ./Middlewares/edge-impulse-sdk/tensorflow/lite/micro/micro_error_reporter.o ./Middlewares/edge-impulse-sdk/tensorflow/lite/micro/micro_error_reporter.su ./Middlewares/edge-impulse-sdk/tensorflow/lite/micro/micro_graph.cyclo ./Middlewares/edge-impulse-sdk/tensorflow/lite/micro/micro_graph.d ./Middlewares/edge-impulse-sdk/tensorflow/lite/micro/micro_graph.o ./Middlewares/edge-impulse-sdk/tensorflow/lite/micro/micro_graph.su ./Middlewares/edge-impulse-sdk/tensorflow/lite/micro/micro_interpreter.cyclo ./Middlewares/edge-impulse-sdk/tensorflow/lite/micro/micro_interpreter.d ./Middlewares/edge-impulse-sdk/tensorflow/lite/micro/micro_interpreter.o ./Middlewares/edge-impulse-sdk/tensorflow/lite/micro/micro_interpreter.su ./Middlewares/edge-impulse-sdk/tensorflow/lite/micro/micro_log.cyclo ./Middlewares/edge-impulse-sdk/tensorflow/lite/micro/micro_log.d ./Middlewares/edge-impulse-sdk/tensorflow/lite/micro/micro_log.o ./Middlewares/edge-impulse-sdk/tensorflow/lite/micro/micro_log.su ./Middlewares/edge-impulse-sdk/tensorflow/lite/micro/micro_profiler.cyclo ./Middlewares/edge-impulse-sdk/tensorflow/lite/micro/micro_profiler.d ./Middlewares/edge-impulse-sdk/tensorflow/lite/micro/micro_profiler.o ./Middlewares/edge-impulse-sdk/tensorflow/lite/micro/micro_profiler.su ./Middlewares/edge-impulse-sdk/tensorflow/lite/micro/micro_resource_variable.cyclo ./Middlewares/edge-impulse-sdk/tensorflow/lite/micro/micro_resource_variable.d ./Middlewares/edge-impulse-sdk/tensorflow/lite/micro/micro_resource_variable.o ./Middlewares/edge-impulse-sdk/tensorflow/lite/micro/micro_resource_variable.su ./Middlewares/edge-impulse-sdk/tensorflow/lite/micro/micro_string.cyclo ./Middlewares/edge-impulse-sdk/tensorflow/lite/micro/micro_string.d ./Middlewares/edge-impulse-sdk/tensorflow/lite/micro/micro_string.o ./Middlewares/edge-impulse-sdk/tensorflow/lite/micro/micro_string.su ./Middlewares/edge-impulse-sdk/tensorflow/lite/micro/micro_time.cyclo ./Middlewares/edge-impulse-sdk/tensorflow/lite/micro/micro_time.d ./Middlewares/edge-impulse-sdk/tensorflow/lite/micro/micro_time.o ./Middlewares/edge-impulse-sdk/tensorflow/lite/micro/micro_time.su ./Middlewares/edge-impulse-sdk/tensorflow/lite/micro/micro_utils.cyclo ./Middlewares/edge-impulse-sdk/tensorflow/lite/micro/micro_utils.d ./Middlewares/edge-impulse-sdk/tensorflow/lite/micro/micro_utils.o ./Middlewares/edge-impulse-sdk/tensorflow/lite/micro/micro_utils.su ./Middlewares/edge-impulse-sdk/tensorflow/lite/micro/mock_micro_graph.cyclo ./Middlewares/edge-impulse-sdk/tensorflow/lite/micro/mock_micro_graph.d ./Middlewares/edge-impulse-sdk/tensorflow/lite/micro/mock_micro_graph.o ./Middlewares/edge-impulse-sdk/tensorflow/lite/micro/mock_micro_graph.su ./Middlewares/edge-impulse-sdk/tensorflow/lite/micro/non_persistent_arena_buffer_allocator.cyclo ./Middlewares/edge-impulse-sdk/tensorflow/lite/micro/non_persistent_arena_buffer_allocator.d ./Middlewares/edge-impulse-sdk/tensorflow/lite/micro/non_persistent_arena_buffer_allocator.o ./Middlewares/edge-impulse-sdk/tensorflow/lite/micro/non_persistent_arena_buffer_allocator.su ./Middlewares/edge-impulse-sdk/tensorflow/lite/micro/op_resolver_bridge.cyclo ./Middlewares/edge-impulse-sdk/tensorflow/lite/micro/op_resolver_bridge.d ./Middlewares/edge-impulse-sdk/tensorflow/lite/micro/op_resolver_bridge.o ./Middlewares/edge-impulse-sdk/tensorflow/lite/micro/op_resolver_bridge.su
	-$(RM) ./Middlewares/edge-impulse-sdk/tensorflow/lite/micro/persistent_arena_buffer_allocator.cyclo ./Middlewares/edge-impulse-sdk/tensorflow/lite/micro/persistent_arena_buffer_allocator.d ./Middlewares/edge-impulse-sdk/tensorflow/lite/micro/persistent_arena_buffer_allocator.o ./Middlewares/edge-impulse-sdk/tensorflow/lite/micro/persistent_arena_buffer_allocator.su ./Middlewares/edge-impulse-sdk/tensorflow/lite/micro/recording_micro_allocator.cyclo ./Middlewares/edge-impulse-sdk/tensorflow/lite/micro/recording_micro_allocator.d ./Middlewares/edge-impulse-sdk/tensorflow/lite/micro/recording_micro_allocator.o ./Middlewares/edge-impulse-sdk/tensorflow/lite/micro/recording_micro_allocator.su ./Middlewares/edge-impulse-sdk/tensorflow/lite/micro/recording_single_arena_buffer_allocator.cyclo ./Middlewares/edge-impulse-sdk/tensorflow/lite/micro/recording_single_arena_buffer_allocator.d ./Middlewares/edge-impulse-sdk/tensorflow/lite/micro/recording_single_arena_buffer_allocator.o ./Middlewares/edge-impulse-sdk/tensorflow/lite/micro/recording_single_arena_buffer_allocator.su ./Middlewares/edge-impulse-sdk/tensorflow/lite/micro/schema_utils.cyclo ./Middlewares/edge-impulse-sdk/tensorflow/lite/micro/schema_utils.d ./Middlewares/edge-impulse-sdk/tensorflow/lite/micro/schema_utils.o ./Middlewares/edge-impulse-sdk/tensorflow/lite/micro/schema_utils.su ./Middlewares/edge-impulse-sdk/tensorflow/lite/micro/single_arena_buffer_allocator.cyclo ./Middlewares/edge-impulse-sdk/tensorflow/lite/micro/single_arena_buffer_allocator.d ./Middlewares/edge-impulse-sdk/tensorflow/lite/micro/single_arena_buffer_allocator.o ./Middlewares/edge-impulse-sdk/tensorflow/lite/micro/single_arena_buffer_allocator.su ./Middlewares/edge-impulse-sdk/tensorflow/lite/micro/system_setup.cyclo ./Middlewares/edge-impulse-sdk/tensorflow/lite/micro/system_setup.d ./Middlewares/edge-impulse-sdk/tensorflow/lite/micro/system_setup.o ./Middlewares/edge-impulse-sdk/tensorflow/lite/micro/system_setup.su ./Middlewares/edge-impulse-sdk/tensorflow/lite/micro/test_helper_custom_ops.cyclo ./Middlewares/edge-impulse-sdk/tensorflow/lite/micro/test_helper_custom_ops.d ./Middlewares/edge-impulse-sdk/tensorflow/lite/micro/test_helper_custom_ops.o ./Middlewares/edge-impulse-sdk/tensorflow/lite/micro/test_helper_custom_ops.su ./Middlewares/edge-impulse-sdk/tensorflow/lite/micro/test_helpers.cyclo ./Middlewares/edge-impulse-sdk/tensorflow/lite/micro/test_helpers.d ./Middlewares/edge-impulse-sdk/tensorflow/lite/micro/test_helpers.o ./Middlewares/edge-impulse-sdk/tensorflow/lite/micro/test_helpers.su

.PHONY: clean-Middlewares-2f-edge-2d-impulse-2d-sdk-2f-tensorflow-2f-lite-2f-micro

