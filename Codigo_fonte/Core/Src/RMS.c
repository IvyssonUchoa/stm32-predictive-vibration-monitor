#include "RMS.h"
#include <math.h>


int calcular_RMS(int *buffer_x, int *buffer_y, int *buffer_z, int tamanho_buffer)
{
    long soma_x = 0;
    long soma_y = 0;
    long soma_z = 0;

    for (int i = 0; i < tamanho_buffer; i++) {
	  soma_x += buffer_x[i];
	  soma_y += buffer_y[i];
	  soma_z += buffer_z[i];
    }

    int media_x = soma_x / tamanho_buffer;
    int media_y = soma_y / tamanho_buffer;
    int media_z = soma_z / tamanho_buffer;

    // Calcular a soma dos quadrados das diferenças
	long long soma_quadrados_x = 0;
	long long soma_quadrados_y = 0;
	long long soma_quadrados_z = 0;

	for (int i = 0; i < tamanho_buffer; i++) {
	  long diferenca_x = buffer_x[i] - media_x;
	  long diferenca_y = buffer_y[i] - media_y;
	  long diferenca_z = buffer_z[i] - media_z;

	  soma_quadrados_z += (diferenca_z * diferenca_z);
	  soma_quadrados_y += (diferenca_y * diferenca_y);
	  soma_quadrados_x += (diferenca_x * diferenca_x);
	}

	// Dividir pelo tamanho total e extrair a raiz
	float variancia_x = (float)soma_quadrados_x / tamanho_buffer;
	float variancia_y = (float)soma_quadrados_y / tamanho_buffer;
	float variancia_z = (float)soma_quadrados_z / tamanho_buffer;

	int rms_x = (int)sqrt(variancia_x);
	int rms_y = (int)sqrt(variancia_y);
	int rms_z = (int)sqrt(variancia_z);

	// calculo do RMS total
	long long soma_quadrados_total = ((long long)rms_x * rms_x) + ((long long)rms_y * rms_y) + ((long long)rms_z * rms_z);
	int rms_total = (int)sqrt((float)soma_quadrados_total);

	return rms_total;
}
