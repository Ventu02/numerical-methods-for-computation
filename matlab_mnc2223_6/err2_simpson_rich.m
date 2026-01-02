function err2_simpson_rich(funz, a, b, n)
% Es. b
%*****************************************************************************************
% Approssima l'integrale definito di una funzione mediante la formula di
% Simpson composta e calcola l'errore (estrapolazione di Richardson).
%
% L’estrapolazione di Richardson permette di ottenere un’approssimazione
% dell’integrale più precisa combinando i risultati ottenuti con due passi diversi (h e h/2).
%
% Questo elimina la potenza più bassa di h nell’errore, ottenendo un’approssimazione di ordine superiore.
% INPUT
% funz --> stringa contenente il nome del file in cui e'
%          presente la funzione integranda
% a,b  --> estremi di integrazione
% n    --> numero di sottointervalli
%******************************************************************************************

% Integrale di funz nell'intervallo [a,b] con tolleranza tol
tol = 1.0e-12;
I = quad(funz, a, b, tol); 
fprintf('Valore integrazione esatto I = %22.15e\n\n', I);

print_tbl; %intestazione tabella

% Ciclo for per incrementare il numero di sottointervalli e calcolare
% l'approssimazione
for i = 1:n

    n = 2^(i - 1); % Numero di sottointervalli (2^(i-1) per Simpson)
    h = (b - a) / n; % Ampiezza del sottointervallo

    % Eseguo la formula di Simpson composta e calcolo l'errore assoluto
    IA = simpson_comp(funz, a, b, n, 0);
    AbsErr(i) = abs(I - IA);

    if(i > 1) % i deve essere maggiore di 1 per calcolare il rapporto degli errori

        % Calcolo dell'estrapolazione di Richardson con la formula per Simpson
        IA_rich = ((16*IA) - (IA))/15;

        % Calcolo dell'errore assoluto per l'approssimazione con Richardson
        AbsErr_rich(i) = abs(I - IA_rich);
        prod = (AbsErr(i-1) / AbsErr(i)); % rapporto errori

        % Stampa dei risultati (if > 2 per il rapporto Richardson)
        if(i > 2)
            prod_rich = AbsErr_rich(i - 1) / AbsErr_rich(i); % rapporto errori con Richardson
            fprintf(['%d\t|\t%14.4e\t|\t%22.12e\t|\t%14.4e\t|\t%14.4e\t|\t' ...
                  '%22.12e\t|\t %14.4e\t|\t %14.4e\t|\n'], n, h, IA, AbsErr(i), prod, IA_rich, AbsErr_rich(i), prod_rich);
                  % n: numero di sottointervalli, h: ampiezza sottointervallo, IA: approssimazione integrale,
                  % AbsErr(i): errore assoluto, prod: rapporto errori, IA_rich: approssimazione integrale con Richardson,
                  % AbsErr_rich(i): errore assoluto con Richardson, prod_rich: rapporto errori con Richardson
        else
            fprintf(['%d\t|\t%14.4e\t|\t%22.12e\t|\t%14.4e\t|\t%14.4e\t|\t' ...
                  '%22.12e\t|\t %14.4e\t|\n'], n, h, IA, AbsErr(i), prod, IA_rich, AbsErr_rich(i));
        end 
    else
        fprintf('\n');
    end

end

end