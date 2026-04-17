% Simulação Slotted ALOHA - Variação de Carga
clear all; clc;

% Parâmetros Fixos
num_nos = 20;               
tempo_max_slots = 5000;     
prob_vetor = 0.01:0.02:1;   

% Vetores para armazenar resultados
throughput_vec = zeros(size(prob_vetor));
latencia_vec = zeros(size(prob_vetor));
entrega_vec = zeros(size(prob_vetor));

% --- Loop de Simulação ---
for p_idx = 1:length(prob_vetor)
    p = prob_vetor(p_idx);
    sucessos = 0;
    tentativas = 0;
    atraso_total = 0;
    
    for slot = 1:tempo_max_slots
        % Cada nó decide se tenta transmitir [cite: 12]
        transmitindo = rand(1, num_nos) < p;
        num_transmissoes = sum(transmitindo);
        
        if num_transmissoes > 0
            tentativas = tentativas + 1;
        end
        
        if num_transmissoes == 1
            % Sucesso: Apenas 1 nó no slot [cite: 38]
            sucessos = sucessos + 1;
        end
    end
    
    
    throughput_vec(p_idx) = sucessos / tempo_max_slots; % Taxa efetiva
    entrega_vec(p_idx) = (sucessos / tentativas) * 100; % % de entrega
    
    if sucessos > 0
        latencia_vec(p_idx) = tentativas / sucessos; 
    end
end

% Geração dos Gráficos 
figure;

subplot(2,1,1);
plot(prob_vetor * num_nos, throughput_vec, 'b-o', 'LineWidth', 1.5);
grid on;
title('Eficiência do Protocolo (Throughput)');
xlabel('Carga da Rede (G = N * p)');
ylabel('Sucessos por Slot (S)');

subplot(2,1,2);
plot(prob_vetor * num_nos, entrega_vec, 'r-s', 'LineWidth', 1.5);
grid on;
title('Taxa de Entrega de Pacotes');
xlabel('Carga da Rede (G)');
ylabel('Sucesso (%)');