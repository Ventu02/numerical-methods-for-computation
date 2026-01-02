% Es. c
%*********************************************************************************
% Analisi della stabilità numerica della fattorizzazione LU
%
% Una fattorizzazione LU è considerata stabile numericamente se gli elementi
% di L e U non crescono troppo rispetto agli elementi originali di A.
% Distinguiamo due tipi di stabilità:
% - Stabilità in senso forte: costanti a e b INDIPENDENTI dall'ordine n
% - Stabilità in senso debole: costanti a e b DIPENDONO dall'ordine n
%
% Risultati teorici:
% - Senza pivoting: max|u_ij| ≤ 2^(n-1) * max|a_ij|  (crescita esponenziale con n)
% - Con pivoting: max|l_ij| ≤ 1  (migliore stabilità)
%*********************************************************************************

fprintf('mat_k       nxn         max|l_ij|     max|u_ij|    2^(n-1)max|a_ij|\n');
nn=[5,10,50]; % Definizione delle dimensioni delle matrici di test
ok = 0; % Flag per segnalare instabilità numerica

% Ciclo sulle dimensioni delle matrici
for i = 1:1:3 
    n = nn(i); % Ordine della matrice
    k=2; % Tipo di matrice (da 2 a 5)
    while k<=5
        % -- Generazione della matrice A in base al tipo k --
        switch k
            case 2
               A=mat_2(n);
            case 3
               A=mat_3(n);
            case 4
               A=mat_4(n);
            case 5
               A=mat_5(n);
        end

        % -- Fattorizzazione LU con pivoting parziale --
        [L,U,P]=lu(A);

        % -- Calcolo massimi valori assoluti nelle matrici L, U e A --
        maxl=(max(abs(L),[],'all')); % max|l_ij|
        maxu=(max(abs(U),[],'all')); % max|u_ij|
        maxa = (max(abs(A),[],'all')); % max|a_ij|

        % Limite superiore teorico per max|u_ij| senza pivoting
        bound=2^(n-1)*maxa;

        % -- Verifica stabilità numerica --
        if maxl>1 || maxu>bound % Se uno dei massimi supera il limite
            ok = 1; % Instabilità rilevata
        end

        % -- Stampa dei risultati --
        % k: tipo di matrice generata
        % nxn: dimensione della matrice
        % max|l_ij|: massimo valore assoluto matrice L
        % max|u_ij|: massimo valore assoluto matrice U
        % 2^(n-1)max|a_ij| o bound: limite superiore basato sulla matrice A
        % ok: flag per verificare se c'è instabilità numerica
        fprintf('%5d     %2dx%2d   %14.5e  %14.5e  %14.5e   %d\n',k,n,n,maxl,maxu,bound,ok);
        disp("------------------------------------------------------------------")
        
        k = k+1; % Passa al tipo di matrice successivo
        ok = 0; % Resetta il flag
    end
    
end                
disp("END")