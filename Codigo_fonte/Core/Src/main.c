/* USER CODE BEGIN Header */
/**
  ******************************************************************************
  * @file           : main.c
  * @brief          : Main program body
  ******************************************************************************
  * @attention
  *
  * Copyright (c) 2026 STMicroelectronics.
  * All rights reserved.
  *
  * This software is licensed under terms that can be found in the LICENSE file
  * in the root directory of this software component.
  * If no LICENSE file comes with this software, it is provided AS-IS.
  *
  ******************************************************************************
  */
/* USER CODE END Header */
/* Includes ------------------------------------------------------------------*/
#include "main.h"

/* Private includes ----------------------------------------------------------*/
/* USER CODE BEGIN Includes */
#include <stdio.h>
#include <stdarg.h>
#include <string.h>
#include <stdint.h>

#include "MPU6050.h"
#include "ei_wrapper.h"
#include "RMS.h"

/* USER CODE END Includes */

/* Private typedef -----------------------------------------------------------*/
/* USER CODE BEGIN PTD */
#define TEMPO_TURNO_SEGUNDOS  28800 // ou 28800 para 8 horas

#define AMOSTRAS_RMS 250
#define N_AMOSTRAS_IA (AMOSTRAS_RMS * 1 * 3)  // 750 = 250 amostras * 1 segundo * 3 param

#define MARGEM_RMS 1.1f // Limite tolerável de vibração (10%)

#define RMS_parado 10

/* USER CODE END PTD */

/* Private define ------------------------------------------------------------*/
/* USER CODE BEGIN PD */

/* USER CODE END PD */

/* Private macro -------------------------------------------------------------*/
/* USER CODE BEGIN PM */

/* USER CODE END PM */

/* Private variables ---------------------------------------------------------*/
I2C_HandleTypeDef hi2c1;

RTC_HandleTypeDef hrtc;

TIM_HandleTypeDef htim2;

UART_HandleTypeDef huart2;

/* USER CODE BEGIN PV */
MPU6050_t mpu;

volatile uint8_t data_ready = 0;

//Buffer para guardar os dados para inferencia
float buffer_ia[N_AMOSTRAS_IA];
volatile int ind_buffer = 0;

//Buffer para guardar os dados para RMS
int buffer_rms_x[AMOSTRAS_RMS];
int buffer_rms_y[AMOSTRAS_RMS];
int buffer_rms_z[AMOSTRAS_RMS];
volatile int sample_index = 0;

const char* classes[] = {
		"instavel nivel 2", // indeciso
		"instavel nivel 3",
		"instavel nivel 1",
		"estavel",
		"instavel nivel 4", // indeciso
		"parado"
};
/* USER CODE END PV */

/* Private function prototypes -----------------------------------------------*/
void SystemClock_Config(void);
static void MX_GPIO_Init(void);
static void MX_I2C1_Init(void);
static void MX_TIM2_Init(void);
static void MX_USART2_UART_Init(void);
static void MX_RTC_Init(void);
/* USER CODE BEGIN PFP */

/* USER CODE END PFP */

/* Private user code ---------------------------------------------------------*/
/* USER CODE BEGIN 0 */
void ei_printf(const char *format, ...) {
    // Não faz nada! Deixa a IA no modo silencioso.
}

int _write(int file, char *ptr, int len)
{
  // Função responsável por receber os dados da função printf() e enviar pela UART
    HAL_UART_Transmit(&huart2, (uint8_t*)ptr, len, HAL_MAX_DELAY);
    return len;
}

void emitir_sinal_alerta(){
	// Acende Leds e Buzzer para emitir um alerta
	HAL_GPIO_WritePin(GPIOC, BUZZER_Pin, GPIO_PIN_SET);
	HAL_Delay(500);

	HAL_GPIO_WritePin(GPIOA, LED_VERMELHO_Pin, GPIO_PIN_SET);
	HAL_Delay(1200);
	HAL_GPIO_WritePin(GPIOA, LED_VERMELHO_Pin, GPIO_PIN_RESET);
	HAL_Delay(1500);
	HAL_GPIO_WritePin(GPIOA, LED_VERMELHO_Pin, GPIO_PIN_SET);

	HAL_Delay(800);
	HAL_GPIO_WritePin(GPIOC, BUZZER_Pin, GPIO_PIN_RESET);
}

void emitir_sinal_atencao(){
	// Emite um sinal luminoso para indicar a realização de ações específicas

	HAL_GPIO_WritePin(GPIOA, LED_AMARELO_Pin, GPIO_PIN_SET);
	HAL_Delay(1500);
	HAL_GPIO_WritePin(GPIOA, LED_AMARELO_Pin, GPIO_PIN_RESET);
}

void emitir_sinal_sucesso(){
	// Emite um sinal luminoso para indicar que o sistema está funcionando corretamente
	HAL_GPIO_WritePin(GPIOC, LED_VERDE_Pin, GPIO_PIN_SET);
	HAL_Delay(1000);
	HAL_GPIO_WritePin(GPIOC, LED_VERDE_Pin, GPIO_PIN_RESET);
}

/* USER CODE END 0 */

/**
  * @brief  The application entry point.
  * @retval int
  */
int main(void)
{

  /* USER CODE BEGIN 1 */

  /* USER CODE END 1 */

  /* MCU Configuration--------------------------------------------------------*/

  /* Reset of all peripherals, Initializes the Flash interface and the Systick. */
  HAL_Init();

  /* USER CODE BEGIN Init */

  /* USER CODE END Init */

  /* Configure the system clock */
  SystemClock_Config();

  /* USER CODE BEGIN SysInit */

  /* USER CODE END SysInit */

  /* Initialize all configured peripherals */
  MX_GPIO_Init();
  MX_I2C1_Init();
  MX_TIM2_Init();
  MX_USART2_UART_Init();
  MX_RTC_Init();
  /* USER CODE BEGIN 2 */
    HAL_GPIO_WritePin(GPIOC, MPU_Pin, GPIO_PIN_SET); // Liga o MPU pelo transistor
    HAL_Delay(200);

	MPU6050_Init(&mpu, &hi2c1);

	uint8_t Data = 0;
	HAL_I2C_Mem_Write(&hi2c1, MPU6050_ADDR, 0x6B, 1, &Data, 1, 100); // Tira do Sleep
	HAL_I2C_Mem_Write(&hi2c1, MPU6050_ADDR, 0x19, 1, &Data, 1, 100); // Sample rate 1kHz

	HAL_Delay(200);

	if (HAL_I2C_IsDeviceReady(&hi2c1, 0x68 << 1, 3, 100) == HAL_OK){ // se o MPU está funcionando

		emitir_sinal_atencao();
		HAL_Delay(200);
		emitir_sinal_atencao();

		HAL_TIM_Base_Start_IT(&htim2); // Ativa o timer 2
		HAL_PWR_EnableBkUpAccess(); // Ativa o acesso aos dados de backup

		// Lê os dados do MPU
		uint8_t reading_sensor = 1;
		while (reading_sensor) {
			  if (data_ready == 1 && ind_buffer < N_AMOSTRAS_IA) {

				// Atualiza as leituras (Accel e Gyro)
				MPU6050_Update(&mpu);

				// Obtem os dados do MPU
				int ac_x = (int)(mpu.Ax * 1000.0f);
				int ac_y = (int)(mpu.Ay * 1000.0f);
				int ac_z = (int)(mpu.Az * 1000.0f);

				// Guarda os dados coletados nos buffers
				buffer_ia[ind_buffer++] = (float)ac_x;
				buffer_ia[ind_buffer++] = (float)ac_y;
				buffer_ia[ind_buffer++] = (float)ac_z;

				buffer_rms_x[sample_index] = ac_x;
				buffer_rms_y[sample_index] = ac_y;
				buffer_rms_z[sample_index] = ac_z;
				sample_index++;

				// Quando o buffer estiver cheio, sae do loop e faz a inferencia
				if (ind_buffer >= N_AMOSTRAS_IA){
					reading_sensor = 0;
				}

				printf("{\"status\": \"RAW_DATA\", \"message\": \"\", \"data\": {\"x\": %d, \"y\": %d, \"z\": %d} }\r\n", ac_x, ac_y, ac_z);

				data_ready = 0; // baixa a flag
			  }
		}

		HAL_TIM_Base_Stop_IT(&htim2); // para o timer 2
		HAL_Delay(100);

		int result = executar_inferencia(buffer_ia);
		int RMS = calcular_RMS(buffer_rms_x, buffer_rms_y, buffer_rms_z, (int)AMOSTRAS_RMS);

		ind_buffer = 0;
		sample_index = 0;

		// Verifica se o micro acordou pelo standby
		if (__HAL_PWR_GET_FLAG(PWR_FLAG_SB) != RESET){
			// Limpa as flags de Standby e Wakeup
			__HAL_PWR_CLEAR_FLAG(PWR_FLAG_SB);
			__HAL_PWR_CLEAR_FLAG(PWR_FLAG_WU);

			// Começa a parte da decisão do estado do motor
			// Lê o RMS calibrado salvo no RTC Backup Register 1
			uint32_t valor_lido_flash = HAL_RTCEx_BKUPRead(&hrtc, RTC_BKP_DR1);
			int rms_calibrado = (int)valor_lido_flash;

			// Verifica se houve erro durante a calibração
			if (rms_calibrado <= 0){
				printf("{\"status\": \"ERRO\", \"message\": \"RMS Nao Calibrado. Necessario Nova Calibracao. Reset o Sistema\"}\r\n");
				emitir_sinal_alerta();
				HAL_Delay(200);
				emitir_sinal_alerta();

			} else {
				// Se está tudo certo com a calibração
				float rms_error = (rms_calibrado * MARGEM_RMS);

				if ((result == 3 || result == 5) && RMS <= rms_error){
					// Motor parado e RMS dentro da margem aceitável
					printf("{\"status\": \"OK\", \"message\": \"Motor e RMS Estaveis\", \"data\": {\"RMS\": %d, \"RMS_medio\": %d, \"RMS_limite\": %d, \"Classe\": \"%s\"}}\r\n",
					       RMS, (int)rms_calibrado, (int)rms_error, "Estavel");
					emitir_sinal_sucesso();
					HAL_Delay(200);
					emitir_sinal_sucesso();
				}

				else if ((result != 3 && result != 5) && RMS > rms_error){
					// Motor Instável e RMS Instável
					printf("{\"status\": \"ERRO\", \"message\": \"Motor e RMS Instavels. Verificar Saude do Motor\", \"data\": {\"RMS\": %d,  \"RMS_medio\": %d, \"RMS_limite\": %d, \"Classe\": \"%s\"}}\r\n",
					       RMS,(int)rms_calibrado, (int)rms_error, "Instavel");
					emitir_sinal_alerta();
					HAL_Delay(200);
					emitir_sinal_alerta();
				}

				else {
					// Falha na Inferência do Motor ou do Calculo do RMS
					// Pode indicar inicio de anomalia
					printf("{\"status\": \"ERRO\", \"message\": \"Motor OU RMS Instavels. Falha em uma das Leituras. Verificar Saude do Motor e do Sistema\", \"data\": {\"RMS\": %d,  \"RMS_medio\": %d, \"RMS_limite\": %d, \"Classe\": \"%s\"}}\r\n",
					       RMS, (int)rms_calibrado, (int)rms_error, classes[result]);
					emitir_sinal_alerta();
					HAL_Delay(200);
					emitir_sinal_alerta();
				}
			}

		} else { 	// Primeia vez ligado ou Reset de hardware
			// Calibra o RMS para o valor decidido pelo TinyML
			HAL_Delay(5000);

			printf("{\"status\": \"OK\", \"message\": \"Iniciando Calibracao do Sistema\"}\r\n");

				// Salva o RMS correspondente ao estado estável do motor em um registrador de backup
				uint32_t valor_para_salvar = (uint32_t)RMS;
				HAL_RTCEx_BKUPWrite(&hrtc, RTC_BKP_DR1, valor_para_salvar);

				// Indica fim de calibração
				printf("{\"status\": \"OK\", \"message\": \"RMS Calibrado para Motor Estável\", \"data\": {\"RMS_medio\": %d}}\r\n", (int)RMS);

				emitir_sinal_sucesso();
				HAL_Delay(200);
				emitir_sinal_sucesso();
		}

	}
	else{
		// emitir alerta para reset do MPU
		printf("{\"status\": \"ERRO\", \"message\": \"MPU Nao Detectado. Atencao Imediata\"}\r\n");

		__HAL_PWR_CLEAR_FLAG(PWR_FLAG_SB); // Reseta flag de wakeup

		emitir_sinal_alerta();
		HAL_Delay(200);
		emitir_sinal_alerta();

	}

	HAL_Delay(100);

	printf("{\"status\": \"OK\", \"message\": \"Entrando em StandBy\"}\r\n");

	HAL_GPIO_WritePin(GPIOC, MPU_Pin, GPIO_PIN_RESET); // Desliga o MPU pelo transistor

	HAL_RTCEx_DeactivateWakeUpTimer(&hrtc);
	__HAL_PWR_CLEAR_FLAG(PWR_FLAG_WU);

	// Reseta as interrupções de Wakeup
	HAL_PWR_EnableWakeUpPin(PWR_WAKEUP_PIN1);
	HAL_RTCEx_SetWakeUpTimer_IT(&hrtc, TEMPO_TURNO_SEGUNDOS - 1, RTC_WAKEUPCLOCK_CK_SPRE_16BITS);

	// Entra em StandBy
	HAL_PWR_EnterSTANDBYMode();

  /* USER CODE END 2 */

  /* Infinite loop */
  /* USER CODE BEGIN WHILE */
  while (1)
  {
    /* USER CODE END WHILE */

    /* USER CODE BEGIN 3 */
  }
  /* USER CODE END 3 */
}

/**
  * @brief System Clock Configuration
  * @retval None
  */
void SystemClock_Config(void)
{
  RCC_OscInitTypeDef RCC_OscInitStruct = {0};
  RCC_ClkInitTypeDef RCC_ClkInitStruct = {0};

  /** Configure the main internal regulator output voltage
  */
  __HAL_RCC_PWR_CLK_ENABLE();
  __HAL_PWR_VOLTAGESCALING_CONFIG(PWR_REGULATOR_VOLTAGE_SCALE3);

  /** Initializes the RCC Oscillators according to the specified parameters
  * in the RCC_OscInitTypeDef structure.
  */
  RCC_OscInitStruct.OscillatorType = RCC_OSCILLATORTYPE_HSI|RCC_OSCILLATORTYPE_LSE;
  RCC_OscInitStruct.LSEState = RCC_LSE_ON;
  RCC_OscInitStruct.HSIState = RCC_HSI_ON;
  RCC_OscInitStruct.HSICalibrationValue = RCC_HSICALIBRATION_DEFAULT;
  RCC_OscInitStruct.PLL.PLLState = RCC_PLL_ON;
  RCC_OscInitStruct.PLL.PLLSource = RCC_PLLSOURCE_HSI;
  RCC_OscInitStruct.PLL.PLLM = 16;
  RCC_OscInitStruct.PLL.PLLN = 336;
  RCC_OscInitStruct.PLL.PLLP = RCC_PLLP_DIV4;
  RCC_OscInitStruct.PLL.PLLQ = 2;
  RCC_OscInitStruct.PLL.PLLR = 2;
  if (HAL_RCC_OscConfig(&RCC_OscInitStruct) != HAL_OK)
  {
    Error_Handler();
  }

  /** Initializes the CPU, AHB and APB buses clocks
  */
  RCC_ClkInitStruct.ClockType = RCC_CLOCKTYPE_HCLK|RCC_CLOCKTYPE_SYSCLK
                              |RCC_CLOCKTYPE_PCLK1|RCC_CLOCKTYPE_PCLK2;
  RCC_ClkInitStruct.SYSCLKSource = RCC_SYSCLKSOURCE_PLLCLK;
  RCC_ClkInitStruct.AHBCLKDivider = RCC_SYSCLK_DIV1;
  RCC_ClkInitStruct.APB1CLKDivider = RCC_HCLK_DIV2;
  RCC_ClkInitStruct.APB2CLKDivider = RCC_HCLK_DIV1;

  if (HAL_RCC_ClockConfig(&RCC_ClkInitStruct, FLASH_LATENCY_2) != HAL_OK)
  {
    Error_Handler();
  }
}

/**
  * @brief I2C1 Initialization Function
  * @param None
  * @retval None
  */
static void MX_I2C1_Init(void)
{

  /* USER CODE BEGIN I2C1_Init 0 */

  /* USER CODE END I2C1_Init 0 */

  /* USER CODE BEGIN I2C1_Init 1 */

  /* USER CODE END I2C1_Init 1 */
  hi2c1.Instance = I2C1;
  hi2c1.Init.ClockSpeed = 400000;
  hi2c1.Init.DutyCycle = I2C_DUTYCYCLE_2;
  hi2c1.Init.OwnAddress1 = 0;
  hi2c1.Init.AddressingMode = I2C_ADDRESSINGMODE_7BIT;
  hi2c1.Init.DualAddressMode = I2C_DUALADDRESS_DISABLE;
  hi2c1.Init.OwnAddress2 = 0;
  hi2c1.Init.GeneralCallMode = I2C_GENERALCALL_DISABLE;
  hi2c1.Init.NoStretchMode = I2C_NOSTRETCH_DISABLE;
  if (HAL_I2C_Init(&hi2c1) != HAL_OK)
  {
    Error_Handler();
  }
  /* USER CODE BEGIN I2C1_Init 2 */

  /* USER CODE END I2C1_Init 2 */

}

/**
  * @brief RTC Initialization Function
  * @param None
  * @retval None
  */
static void MX_RTC_Init(void)
{

  /* USER CODE BEGIN RTC_Init 0 */

  /* USER CODE END RTC_Init 0 */

  RTC_TimeTypeDef sTime = {0};
  RTC_DateTypeDef sDate = {0};

  /* USER CODE BEGIN RTC_Init 1 */

  /* USER CODE END RTC_Init 1 */

  /** Initialize RTC Only
  */
  hrtc.Instance = RTC;
  hrtc.Init.HourFormat = RTC_HOURFORMAT_24;
  hrtc.Init.AsynchPrediv = 127;
  hrtc.Init.SynchPrediv = 255;
  hrtc.Init.OutPut = RTC_OUTPUT_DISABLE;
  hrtc.Init.OutPutPolarity = RTC_OUTPUT_POLARITY_HIGH;
  hrtc.Init.OutPutType = RTC_OUTPUT_TYPE_OPENDRAIN;
  if (HAL_RTC_Init(&hrtc) != HAL_OK)
  {
    Error_Handler();
  }

  /* USER CODE BEGIN Check_RTC_BKUP */

  /* USER CODE END Check_RTC_BKUP */

  /** Initialize RTC and set the Time and Date
  */
  sTime.Hours = 0x0;
  sTime.Minutes = 0x0;
  sTime.Seconds = 0x0;
  sTime.DayLightSaving = RTC_DAYLIGHTSAVING_NONE;
  sTime.StoreOperation = RTC_STOREOPERATION_RESET;
  if (HAL_RTC_SetTime(&hrtc, &sTime, RTC_FORMAT_BCD) != HAL_OK)
  {
    Error_Handler();
  }
  sDate.WeekDay = RTC_WEEKDAY_MONDAY;
  sDate.Month = RTC_MONTH_JANUARY;
  sDate.Date = 0x1;
  sDate.Year = 0x0;

  if (HAL_RTC_SetDate(&hrtc, &sDate, RTC_FORMAT_BCD) != HAL_OK)
  {
    Error_Handler();
  }

  /** Enable the WakeUp
  */
  if (HAL_RTCEx_SetWakeUpTimer(&hrtc, 9, RTC_WAKEUPCLOCK_CK_SPRE_16BITS) != HAL_OK)
  {
    Error_Handler();
  }
  /* USER CODE BEGIN RTC_Init 2 */

  /* USER CODE END RTC_Init 2 */

}

/**
  * @brief TIM2 Initialization Function
  * @param None
  * @retval None
  */
static void MX_TIM2_Init(void)
{

  /* USER CODE BEGIN TIM2_Init 0 */

  /* USER CODE END TIM2_Init 0 */

  TIM_ClockConfigTypeDef sClockSourceConfig = {0};
  TIM_MasterConfigTypeDef sMasterConfig = {0};

  /* USER CODE BEGIN TIM2_Init 1 */

  /* USER CODE END TIM2_Init 1 */
  htim2.Instance = TIM2;
  htim2.Init.Prescaler = 83;
  htim2.Init.CounterMode = TIM_COUNTERMODE_UP;
  htim2.Init.Period = 4000-1;
  htim2.Init.ClockDivision = TIM_CLOCKDIVISION_DIV1;
  htim2.Init.AutoReloadPreload = TIM_AUTORELOAD_PRELOAD_DISABLE;
  if (HAL_TIM_Base_Init(&htim2) != HAL_OK)
  {
    Error_Handler();
  }
  sClockSourceConfig.ClockSource = TIM_CLOCKSOURCE_INTERNAL;
  if (HAL_TIM_ConfigClockSource(&htim2, &sClockSourceConfig) != HAL_OK)
  {
    Error_Handler();
  }
  sMasterConfig.MasterOutputTrigger = TIM_TRGO_RESET;
  sMasterConfig.MasterSlaveMode = TIM_MASTERSLAVEMODE_DISABLE;
  if (HAL_TIMEx_MasterConfigSynchronization(&htim2, &sMasterConfig) != HAL_OK)
  {
    Error_Handler();
  }
  /* USER CODE BEGIN TIM2_Init 2 */

  /* USER CODE END TIM2_Init 2 */

}

/**
  * @brief USART2 Initialization Function
  * @param None
  * @retval None
  */
static void MX_USART2_UART_Init(void)
{

  /* USER CODE BEGIN USART2_Init 0 */

  /* USER CODE END USART2_Init 0 */

  /* USER CODE BEGIN USART2_Init 1 */

  /* USER CODE END USART2_Init 1 */
  huart2.Instance = USART2;
  huart2.Init.BaudRate = 115200;
  huart2.Init.WordLength = UART_WORDLENGTH_8B;
  huart2.Init.StopBits = UART_STOPBITS_1;
  huart2.Init.Parity = UART_PARITY_NONE;
  huart2.Init.Mode = UART_MODE_TX_RX;
  huart2.Init.HwFlowCtl = UART_HWCONTROL_NONE;
  huart2.Init.OverSampling = UART_OVERSAMPLING_16;
  if (HAL_UART_Init(&huart2) != HAL_OK)
  {
    Error_Handler();
  }
  /* USER CODE BEGIN USART2_Init 2 */

  /* USER CODE END USART2_Init 2 */

}

/**
  * @brief GPIO Initialization Function
  * @param None
  * @retval None
  */
static void MX_GPIO_Init(void)
{
  GPIO_InitTypeDef GPIO_InitStruct = {0};
  /* USER CODE BEGIN MX_GPIO_Init_1 */

  /* USER CODE END MX_GPIO_Init_1 */

  /* GPIO Ports Clock Enable */
  __HAL_RCC_GPIOC_CLK_ENABLE();
  __HAL_RCC_GPIOH_CLK_ENABLE();
  __HAL_RCC_GPIOA_CLK_ENABLE();
  __HAL_RCC_GPIOB_CLK_ENABLE();

  /*Configure GPIO pin Output Level */
  HAL_GPIO_WritePin(GPIOC, LED_VERDE_Pin|BUZZER_Pin|MPU_Pin, GPIO_PIN_RESET);

  /*Configure GPIO pin Output Level */
  HAL_GPIO_WritePin(GPIOA, LED_VERMELHO_Pin|LED_AMARELO_Pin|LD2_Pin, GPIO_PIN_RESET);

  /*Configure GPIO pin : B1_Pin */
  GPIO_InitStruct.Pin = B1_Pin;
  GPIO_InitStruct.Mode = GPIO_MODE_IT_FALLING;
  GPIO_InitStruct.Pull = GPIO_NOPULL;
  HAL_GPIO_Init(B1_GPIO_Port, &GPIO_InitStruct);

  /*Configure GPIO pins : LED_VERDE_Pin BUZZER_Pin MPU_Pin */
  GPIO_InitStruct.Pin = LED_VERDE_Pin|BUZZER_Pin|MPU_Pin;
  GPIO_InitStruct.Mode = GPIO_MODE_OUTPUT_PP;
  GPIO_InitStruct.Pull = GPIO_NOPULL;
  GPIO_InitStruct.Speed = GPIO_SPEED_FREQ_LOW;
  HAL_GPIO_Init(GPIOC, &GPIO_InitStruct);

  /*Configure GPIO pins : LED_VERMELHO_Pin LED_AMARELO_Pin LD2_Pin */
  GPIO_InitStruct.Pin = LED_VERMELHO_Pin|LED_AMARELO_Pin|LD2_Pin;
  GPIO_InitStruct.Mode = GPIO_MODE_OUTPUT_PP;
  GPIO_InitStruct.Pull = GPIO_NOPULL;
  GPIO_InitStruct.Speed = GPIO_SPEED_FREQ_LOW;
  HAL_GPIO_Init(GPIOA, &GPIO_InitStruct);

  /* USER CODE BEGIN MX_GPIO_Init_2 */

  /* USER CODE END MX_GPIO_Init_2 */
}

/* USER CODE BEGIN 4 */
void HAL_TIM_PeriodElapsedCallback(TIM_HandleTypeDef *htim) {
    if (htim->Instance == TIM2) {
        data_ready = 1;
    }
}

/* USER CODE END 4 */

/**
  * @brief  This function is executed in case of error occurrence.
  * @retval None
  */
void Error_Handler(void)
{
  /* USER CODE BEGIN Error_Handler_Debug */
  /* User can add his own implementation to report the HAL error return state */
  __disable_irq();
  while (1)
  {
  }
  /* USER CODE END Error_Handler_Debug */
}
#ifdef USE_FULL_ASSERT
/**
  * @brief  Reports the name of the source file and the source line number
  *         where the assert_param error has occurred.
  * @param  file: pointer to the source file name
  * @param  line: assert_param error line source number
  * @retval None
  */
void assert_failed(uint8_t *file, uint32_t line)
{
  /* USER CODE BEGIN 6 */
  /* User can add his own implementation to report the file name and line number,
     ex: printf("Wrong parameters value: file %s on line %d\r\n", file, line) */
  /* USER CODE END 6 */
}
#endif /* USE_FULL_ASSERT */
