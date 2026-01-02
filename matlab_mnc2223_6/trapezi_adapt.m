function [val,nval,punti]=trapezi_adapt(fun,a,b,fa,fb,tol,t_ab,nval,punti)
% Es. c
%*******************************************************************************
% Funzione ricorsiva che approssima l'integrale definito di una
% funzione mediante metodo adattivo basato su formula trapezi composta.
% L'idea è di suddividere ricorsivamente l'intervallo di integrazione solo dove necessario,
% concentrando il calcolo nelle zone dove la funzione varia più rapidamente.
% Se la differenza tra l'approssimazione su [a,b] e la somma delle approssimazioni
% su [a,m] e [m,b] è minore della tolleranza, si accetta il risultato con estrapolazione
% di Richardson. Altrimenti, si applica ricorsivamente lo stesso processo ai sottointervalli.
% La formula di estrapolazione usata è: I ≈ (4*(T([a,m])+T([m,b])) - T([a,b]))/3
% INPUT
% fun --> stringa contenente il nome del file in cui e'
%         presente la funzione integranda
% a,b --> estremi di integrazione
% fa,fb --> valori della fun negli estremi
% tol --> tolleranza richiesta
% t_ab --> valore trapezi singolo in [a,b]
% nval --> numero di valutazioni di funzioni effettuate fino ad ora
% punti --> punti calcolati fino ad ora
% val   <-- approssimazione dell'integrale
% nval  <-- aggiornamento numero valutazioni
% punti <-- aggiornamento punti calcolati
%*******************************************************************************

mp=length(punti); %posizione per eventuali nuovi punti
m=0.5*(a+b); %punto medio dell'intervallo
fm=feval(fun,m); % Calcola il valore della funzione nel punto medio m
nval=nval+1; % Incremento il numero di valutazioni

% -- Stime trapezi sui due sottointervalli [a,m] e [m,b]
t_am=trapezi_sing(a,m,fa,fm);
t_mb=trapezi_sing(m,b,fm,fb);
%fprintf('a,b,m %f %f %f tol= %e\n',a,b,m,tol);

% -- Verifica condizione di errore (adattività) --
% Errore stimato: |T([a,b]) - (T([a,m]) + T([m,b]))| / 3 < tol
if (abs(t_ab-t_am-t_mb)/3 < tol) % Se l'errore è minore della tolleranza, procedo con l'estrapolazione di Richardson
    val=(4*(t_am+t_mb)-t_ab)/3;
    punti(mp+1)=b; % Aggiungo il punto b ai punti di valutazione

else % Se l'errore è troppo grande si ripete ricorsivamente
    [val1,nval,punti]=trapezi_adapt(fun,a,m,fa,fm,0.5*tol,t_am,nval,punti);
    [val2,nval,punti]=trapezi_adapt(fun,m,b,fm,fb,0.5*tol,t_mb,nval,punti);
    val=val1+val2;
end
