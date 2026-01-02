function [val,nval,punti]=simpson_adapt(fun,a,b,m,fa,fb,fm,tol,s_ab,nval,punti)
% Es. c
%*******************************************************************************
% Funzione ricorsiva che approssima l'integrale definito di una
% funzione mediante metodo adattivo basato su formula di Simpson composta.
% L'idea è di suddividere ricorsivamente l'intervallo di integrazione solo dove necessario,
% concentrando il calcolo nelle zone dove la funzione è meno regolare.
% Se la differenza tra l'approssimazione su [a,b] e la somma delle approssimazioni
% su [a,m] e [m,b] è minore della tolleranza, si accetta il risultato con estrapolazione
% di Richardson. Altrimenti, si applica ricorsivamente lo stesso processo ai sottointervalli.
% La formula di estrapolazione usata è: I ≈ (16*(S([a,m])+S([m,b])) - S([a,b]))/15
% INPUT
% fun --> stringa contenente il nome del file in cui e'
%         presente la funzione integranda
% a,b --> estremi di integrazione
% fa,fb,fm --> valori della fun negli estremi e al centro
% tol --> tolleranza richiesta
% s_ab --> valore simpson singolo in [a,b]
% nval --> numero di valutazioni di funzioni effettuate fino ad ora
% punti --> punti calcolati fino ad ora
% val   <-- approssimazione dell'integrale
% nval  <-- aggiornamento numero valutazioni
% punti <-- aggiornamento punti calcolati
%*******************************************************************************

mp=length(punti); %posizione per eventuali nuovi punti
m1=0.5*(a+m); %punto medio [a,m]
fm1=feval(fun,m1); % Calcolo il valore della funzione in m1
m2=0.5*(m+b); %punto medio [m,b]
fm2=feval(fun,m2); % Calcolo il valore della funzione in m2
nval=nval+2; % Incremento il numero di valutazioni di 2

%-- Stime simpson sui due sottointervalli [a,m] e [m,b] --
s_am=simpson_sing(a,m,m1,fa,fm,fm1);
s_mb=simpson_sing(m,b,m2,fm,fb,fm2);
%fprintf('a,b,m %f %f %f tol= %e\n',a,b,m,tol);

% -- Verifica condizione di errore (adattività) --
% Errore stimato: |S([a,b]) - (S([a,m]) + S([m,b]))| / 15 < tol
if (abs(s_ab-s_am-s_mb)/15 < tol) % Se l'errore è minore della tolleranza, procedo con l'estrapolazione di Richardson
    val=(16*(s_am+s_mb)-s_ab)/15; 
    punti(mp+1)=m1; % Aggiungo il punto m1 ai punti di valutazione
    punti(mp+2)=b; % Aggiungo il punto b ai punti di valutazione

else % Se l'errore è troppo grande si ripete ricorsivamente
    [val1,nval,punti]=simpson_adapt(fun,a,m,m1,fa,fm,fm1,0.5*tol,s_am,nval,punti);
    [val2,nval,punti]=simpson_adapt(fun,m,b,m2,fm,fb,fm2,0.5*tol,s_mb,nval,punti);
    val=val1+val2;
end
