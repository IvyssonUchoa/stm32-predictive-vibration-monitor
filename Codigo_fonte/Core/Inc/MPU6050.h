#ifndef __MPU6050_H__
#define __MPU6050_H__

#include "stm32f4xx_hal.h"
#include "math.h"

// Endereço padrão
#define MPU6050_ADDR (0x68 << 1)

typedef struct
{
	// sensores brutos
	float Ax, Ay, Az;
	float Gx, Gy, Gz;

	// ângulos do acelerômetro
	float roll_acc;
	float pitch_acc;

	// ângulos finais
	float roll;
	float pitch;
	float yaw;

	// controle
	float dt;
	float alpha;

	// bias gyro Z
	float gz_bias;

} MPU6050_t;

// --- Funções principais ---
void MPU6050_Init(MPU6050_t *mpu, I2C_HandleTypeDef *hi2c);
void MPU6050_Update(MPU6050_t *mpu);

void MPU6050_ComputeAngles(MPU6050_t *mpu);
void MPU6050_ComputeComplementary(MPU6050_t *mpu);

int  MPU6050_IsStatic(MPU6050_t *mpu);
void MPU6050_UpdateYawZUPT(MPU6050_t *mpu);

// --- Auxiliares ---
void MPU6050_Read_Accel(float *Ax, float *Ay, float *Az);
void MPU6050_Read_Gyro(float *Gx, float *Gy, float *Gz);

#endif