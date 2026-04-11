% Simulação CSMA Não Persistente
tempo = 0.1; n_est = 10; taxa_bits = 1e5; tam_quadro = 100;
t_quadro = tam_quadro/taxa_bits; dt_sim = t_quadro/tam_quadro;
t_sim = ceil(tempo/dt_sim); a = 0.05; % Altere 'a' conforme necessário
taxa_max = ceil(taxa_bits/tam_quadro/n_est);
pontos = 20; taxas = taxa_max*(1/pontos:1/pontos:1);

for taxa=1:pontos
    tm_q = taxas(taxa)*dt_sim; espera_max = 10*tam_quadro;
    % Lógica: Se meio ocupado, sorteia tx_espera e não tenta novamente até o fim do tempo.
end