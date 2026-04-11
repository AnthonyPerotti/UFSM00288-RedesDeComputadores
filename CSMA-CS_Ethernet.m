% Algoritmo de Backoff Ethernet
if colisao_detectada
    k = k + 1; % Incrementa tentativas
    if k <= 16
        BE = min(k, 10); % Limite do expoente
        espera = floor(rand * (2^BE)) * (2 * atraso); % Tempo de slot
    else
        falha = 1; % Descarta quadro após 16 tentativas
    end
end