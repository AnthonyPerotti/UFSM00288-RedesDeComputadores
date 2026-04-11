% Simulação Slotted ALOHA - Avaliação Parcial 1 (Redes de Computadores)
clear all; close all; clc;

% Parâmetros da Simulação
num_slots = 10000;          % Duração da simulação
G_range = 0.1:0.1:2.0;      % Carga de tráfego (tentativas por slot)
S = zeros(size(G_range));   % Eficiência (Throughput)
packet_loss = zeros(size(G_range));

for i = 1:length(G_range)
    G = G_range(i);
    sucesso = 0;
    colisao = 0;
    vazio = 0;
    
    for slot = 1:num_slots
        % Número de pacotes tentando acessar o slot (Distribuição de Poisson)
        num_tentativas = poissrnd(G);
        
        if num_tentativas == 1
            sucesso = sucesso + 1;
        elseif num_tentativas > 1
            colisao = colisao + 1;
        else
            vazio = vazio + 1;
        end
    end
    
    S(i) = sucesso / num_slots;
    packet_loss(i) = (colisao * G) / (sucesso + colisao * G); % Estimativa simples
end

% Gráfico de Desempenho
figure;
plot(G_range, S, '-o', 'LineWidth', 2);
grid on;
xlabel('Carga de Tráfego (G) [pacotes/slot]');
ylabel('Vazão (S) [sucessos/slot]');
title('Desempenho Slotted ALOHA - Eventos Discretos');
legend('Vazão Obtida');