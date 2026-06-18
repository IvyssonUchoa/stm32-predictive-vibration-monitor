#include "ei_wrapper.h"
#include "edge-impulse-sdk/classifier/ei_run_classifier.h"

int executar_inferencia(float* raw_data) {
    // 1. Cria uma estrutura de sinal que o Edge Impulse entende
    signal_t signal;
    int err = numpy::signal_from_buffer(raw_data, EI_CLASSIFIER_DSP_INPUT_FRAME_SIZE, &signal);

    if (err != 0) {
        return -1; // Erro ao empacotar os dados
    }

    // 2. Roda o bloco de DSP (Spectral Analysis) e a Rede Neural
    ei_impulse_result_t result = { 0 };
    err = run_classifier(&signal, &result, false);

    if (err != EI_IMPULSE_OK) {
        return -2; // Erro na inferência
    }

    // 3. Verifica qual classe teve a maior probabilidade (Acurácia)
    int classe_vencedora = 0;
    float maior_valor = result.classification[0].value;

    for (uint16_t i = 1; i < EI_CLASSIFIER_LABEL_COUNT; i++) {
        if (result.classification[i].value > maior_valor) {
            maior_valor = result.classification[i].value;
            classe_vencedora = i;
        }
    }

    return classe_vencedora; // Retorna o índice (ex: 0=Estavel, 1=Instavel_n1)
}
