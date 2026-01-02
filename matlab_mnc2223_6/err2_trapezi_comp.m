function err2_trapezi_comp(funz,a,b,m)
% Es. a
%*******************************************************
% Calcola integrale con formula dei trapezi composta per passi h dimezzati
% e stampa il rapporto tra errori successivi per stimare l'ordine di convergenza
% INPUT
%  funz --> stringa contenente il nome del file in cui e'
%          presente la funzione integranda
% a,b  --> estremi di integrazione
% m    --> numero di iterazioni del ciclo
%*******************************************************

tol=1.0e-12; % tolleranza per quad
I=quad(funz,a,b,tol); % calcolo del valore esatto dell'integrale
fprintf('valore I= %22.15e\n',I); % stampa del valore esatto

% -- Stampa tabella dei risultati --
fprintf('n  h               h^2               IA                    AbsErr(i - 1)/AbsErr(i)\n');
for i=1:m % ciclo per m iterazioni
    n=2^(i-1); % numero di suddivisioni (raddoppia ogni volta)
    h=(b-a)/n; % calcolo del passo
    IA=trapezi_comp(funz,a,b,n,0); % calcolo dell'integrale approssimato con trapezi composta
    AbsErr(i)=abs(I - IA); % calcolo dell'errore assoluto

    % dal secondo ciclo in poi, stampa anche il rapporto tra errori successivi
    if (i>1)
        fprintf('%3d %14.7e %14.7e %22.15e %14.7e \n',n,h,h^2,IA,AbsErr(i-1)/AbsErr(i));
    else
        fprintf('\n'); % prima riga vuota (nessun rapporto)
    end
end