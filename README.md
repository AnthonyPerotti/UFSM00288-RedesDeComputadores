# Simulação de Eventos Discretos - Protocolo Slotted ALOHA

Este repositório contém o projeto desenvolvido para a **Avaliação Parcial 1** da disciplina de **Redes de Computadores** na **Universidade Federal de Santa Maria (UFSM)**.

## 👥 Integrantes
* **Anthony Perotti Souza**
* **Lenon Gabriel Paranhos**

## 📖 Descrição do Projeto
O objetivo deste trabalho é a simulação por eventos discretos (DES - *Discrete Event Simulation*) de um protocolo de acesso ao meio, especificamente o **Slotted ALOHA**. A simulação foca na obtenção de métricas de desempenho em função da carga de tráfego injetada na rede.

### Principais Características:
* **Paradigma:** Simulação por Eventos Discretos.
* **Ferramenta:** MATLAB / Octave.
* **Protocolo:** Slotted ALOHA.
* **Métrica Analisada:** Vazão Efetiva (Throughput) em sucessos por slot.

## ⚙️ Funcionamento da Simulação
Diferente de simulações guiadas por tempo fixo, este modelo evolui pela geração e consumo de eventos cronológicos. 
1. O tempo é discretizado em slots unitários.
2. A cada slot, o número de pacotes tentando acesso segue uma distribuição de Poisson (carga $G$).
3. O sistema contabiliza sucessos (exatamente 1 pacote) e colisões (mais de 1 pacote).
4. O relógio avança em passos baseados na ocorrência desses eventos.

## 📊 Resultados
A simulação demonstrou o comportamento característico do protocolo, onde a eficiência máxima atinge o pico teórico de aproximadamente **36.8%** quando a carga de tráfego **G = 1.0**.

## 📂 Estrutura do Repositório
* `/src`: Contém o código-fonte `.m` utilizado no MATLAB.
* `/docs`: Relatório técnico gerado via Overleaf e apresentação em formato Beamer (PDF).

## 🎓 Referências
* Professor Carlos Henrique Barriquello (UFSM).
* Repositório base da disciplina: [ufsm-barriquello/ufsm0288_redes_computadores](https://github.com/ufsm-barriquello/ufsm0288_redes_computadores).
