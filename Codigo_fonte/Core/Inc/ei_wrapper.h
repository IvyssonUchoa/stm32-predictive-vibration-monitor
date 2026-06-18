#ifndef EI_WRAPPER_H
#define EI_WRAPPER_H

#ifdef __cplusplus
extern "C" {
#endif

// Retorna o ID da classe identificada (0, 1, 2, 3...)
int executar_inferencia(float* raw_data);

#ifdef __cplusplus
}
#endif

#endif
