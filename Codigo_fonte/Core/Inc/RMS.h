#ifndef __RMS_H__
#define __RMS_H__

#include "stm32f4xx_hal.h"
#include <math.h>

int calcular_RMS(int *buffer_x, int *buffer_y, int *buffer_z, int tamanho_buffer);

#endif
