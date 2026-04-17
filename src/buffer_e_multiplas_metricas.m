
% Simulação DES: Slotted ALOHA com Buffer e Múltiplas Métricas
clear all; clc;

%  Parâmetros de Entrada (Variações solicitadas)
num_nos = 15;               % Número de nós 
tempo_max_slots = 3000;     % Duração da simulação
capacidade_buffer = 10;     % Tamanho máximo do buffer por nó 
taxa_chegada_vec = 0.05:0.05:0.6; % Variação do Tráfego (Lambda) 


throughput_final = zeros(size(taxa_chegada_vec));
latencia_media = zeros(size(taxa_chegada_vec));
ocupacao_buffer_media = zeros(size(taxa_chegada_vec));
perda_pacotes = zeros(size(taxa_chegada_vec));

% --- Loop de Variação de Tráfego ---
for t_idx = 1:length(taxa_chegada_vec)
    lambda = taxa_chegada_vec(t_idx);
    
    % Estado interno dos nós (DES) 
    buffers = zeros(1, num_nos);
    sucessos = 0;
    total_pacotes_gerados = 0;
    total_pacotes_perdidos = 0;
    espera_total = 0;

    for slot = 1:tempo_max_slots
        % 1. Chegada de novos pacotes (Processo de Bernoulli)
        novos_pacotes = rand(1, num_nos) < lambda;
        for i = 1:num_nos
            if novos_pacotes(i)
                total_pacotes_gerados = total_pacotes_gerados + 1;
                if buffers(i) < capacidade_buffer
                    buffers(i) = buffers(i) + 1;
                else
                    total_pacotes_perdidos = total_pacotes_perdidos + 1;
                end
            end
        end

        % 2. Tentativa de Transmissão (Apenas nós com pacotes no buffer)
        nos_com_dados = find(buffers > 0);
        decisao_transmissao = rand(1, length(nos_com_dados)) < 0.3; % Prob. retransmissão
        num_transmissoes = sum(decisao_transmissao);

        % 3. Lógica do Protocolo Slotted ALOHA 
        if num_transmissoes == 1
            % Sucesso! Remove um pacote do buffer do nó que transmitiu
            no_sortudo = nos_com_dados(decisao_transmissao);
            buffers(no_sortudo) = buffers(no_sortudo) - 1;
            sucessos = sucessos + 1;
        end
        
        % Acumula ocupação para média
        ocupacao_buffer_media(t_idx) = ocupacao_buffer_media(t_idx) + mean(buffers);
    end

    % --- Cálculo das Métricas por Ponto ---
    throughput_final(t_idx) = sucessos / tempo_max_slots; 
    ocupacao_buffer_media(t_idx) = ocupacao_buffer_media(t_idx) / tempo_max_slots;
    perda_pacotes(t_idx) = (total_pacotes_perdidos / total_pacotes_gerados) * 100; 
end

% --- Geração de Gráficos (Para o Relatório e Apresentação) 
figure;
subplot(3,1,1);
plot(taxa_chegada_vec, throughput_final, 'b-o'); grid on;
title('Variação de Desempenho: Throughput'); ylabel('S (bps efetivo)'); 

subplot(3,1,2);
plot(taxa_chegada_vec, ocupacao_buffer_media, 'r-s'); grid on;
title('Ocupação Média dos Buffers'); ylabel('Quadros'); 

subplot(3,1,3);
plot(taxa_chegada_vec, perda_pacotes, 'm-^'); grid on;
title('Taxa de Perda de Pacotes (Overflow)'); ylabel('% Perda'); 
xlabel('Carga de Entrada (Lambda)');
