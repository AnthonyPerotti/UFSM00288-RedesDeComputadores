% Lógica de Reserva de Canal (MACA)
% Dentro do loop de tempo k:
nav = max(0, nav - 1); % Decrementa o Network Allocation Vector
if (tx_fila(j) > 0) && (nav(j) == 0) && (meio_livre)
    nav(vizinhos) = tam_q + atraso; % Reserva o canal (RTS/CTS simbólico)
    tx_ativo(j) = 1;
end