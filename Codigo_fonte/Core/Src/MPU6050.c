#include "MPU6050.h"

// handle I2C interno
static I2C_HandleTypeDef *mpu_i2c;

void MPU6050_Init(MPU6050_t *mpu, I2C_HandleTypeDef *hi2c)
{
    mpu_i2c = hi2c;

    mpu->roll = 0;
    mpu->pitch = 0;
    mpu->yaw = 0;

    mpu->alpha = 0.98f;
    mpu->gz_bias = 0;
}

void MPU6050_Update(MPU6050_t *mpu)
{
    MPU6050_Read_Accel(&mpu->Ax, &mpu->Ay, &mpu->Az);
    MPU6050_Read_Gyro(&mpu->Gx, &mpu->Gy, &mpu->Gz);
}

void MPU6050_ComputeAngles(MPU6050_t *mpu)
{
	mpu->roll_acc  = atan2(mpu->Ay, mpu->Az) * 180.0f / M_PI;
	mpu->pitch_acc = atan2(-mpu->Ax,
                            sqrt(mpu->Ay * mpu->Ay + mpu->Az * mpu->Az))
                      * 180.0f / M_PI;
}

void MPU6050_ComputeComplementary(MPU6050_t *mpu)
{
	mpu->roll  = mpu->alpha * (mpu->roll  + mpu->Gx * mpu->dt)
	               + (1.0f - mpu->alpha) * mpu->roll_acc;

	mpu->pitch = mpu->alpha * (mpu->pitch + mpu->Gy * mpu->dt)
			   + (1.0f - mpu->alpha) * mpu->pitch_acc;
}

int MPU6050_IsStatic(MPU6050_t *mpu)
{
    float acc_norm = sqrt(mpu->Ax*mpu->Ax +
                          mpu->Ay*mpu->Ay +
                          mpu->Az*mpu->Az);

    return (fabs(mpu->Gx) < 0.5f &&
            fabs(mpu->Gy) < 0.5f &&
			fabs(mpu->Gz) < 3.0f &&
            fabs(acc_norm - 1.0f) < 0.05f);
}

void MPU6050_UpdateYawZUPT(MPU6050_t *mpu)
{
    if (MPU6050_IsStatic(mpu))
    {
        mpu->gz_bias = 0.999f * mpu->gz_bias + 0.001f * mpu->Gz;
        mpu->yaw *= 0.995f;
    }
    else
    {
        mpu->yaw += (mpu->Gz - mpu->gz_bias) * mpu->dt;
    }
}

void MPU6050_Read_Accel(float *Ax, float *Ay, float *Az)
{
    uint8_t data[6];
    int16_t raw[3];

    HAL_I2C_Mem_Read(mpu_i2c, MPU6050_ADDR, 0x3B, 1, data, 6, HAL_MAX_DELAY);

    raw[0] = (data[0] << 8) | data[1];
    raw[1] = (data[2] << 8) | data[3];
    raw[2] = (data[4] << 8) | data[5];

    *Ax = raw[0] / 16384.0f;
    *Ay = raw[1] / 16384.0f;
    *Az = raw[2] / 16384.0f;
}

void MPU6050_Read_Gyro(float *Gx, float *Gy, float *Gz)
{
    uint8_t data[6];
    int16_t raw[3];

    HAL_I2C_Mem_Read(mpu_i2c, MPU6050_ADDR, 0x43, 1, data, 6, HAL_MAX_DELAY);

    raw[0] = (data[0] << 8) | data[1];
    raw[1] = (data[2] << 8) | data[3];
    raw[2] = (data[4] << 8) | data[5];

    *Gx = raw[0] / 131.0f;
    *Gy = raw[1] / 131.0f;
    *Gz = raw[2] / 131.0f;
}