% Es. f
%****************************************************************
% Confronto metodi di interpolazione polinomiale Lagrange e Newton
% Si determina l’interpolante sia in forma di Lagrange che di Newton su una funzione polinomiale test.
% Scegliendo una funzione polinomiale, l’errore totale è dovuto solo all’errore algoritmico (non analitico).
% In generale, la forma di Newton è più stabile numericamente, ma può essere più costosa.
% La forma di Lagrange è più efficiente perché i coefficienti sono direttamente i valori nei nodi.
% Nei grafici si confrontano i due metodi: l’errore di Lagrange (verde) è spesso maggiore di Newton (blu).
% La scelta della distribuzione dei punti (equispaziati o Chebyshev) influenza il condizionamento.
%****************************************************************

% utilizzo una funzione polinomiale test
clear all
close all

% estremi intervallo di interpolazione
a=-1;
b=3.5;

n=50; %numero di punti di interpolazione
tipo=2; %tipo di distribuzione punti (1=equispaziati, altro=Chebyshev)
switch(tipo)
    case 1
        x=linspace(a,b,n+1);
    otherwise
        x=chebyshev(a,b,n);
end

% valutazione della funzione test solo sui punti di interpolazione stabiliti
y=polfun1(x);

% definizione dei punti per valutare interpolanti e errori
m = 20; % numero di punti per sottointervallo
xv=linspace(a,b, m*n+1);

% -- Costruzione matrice di Newton --
N = newton(n,x(1:n),x); %creazione della matrice di Newton
nc = lsolve(N,y); %Risoluzione per ottenere i coefficienti
ny=newtval(nc,x,xv); %Calcolo valori dell'interpolante su xv

% -- Valutazione polinomiale con forma di Lagrange (Non necessario perché lagrval2 fa tutto) --
%L = lagrange(n,x,xv);
%lc=lsolve(L,y);
ly=lagrval2(y,x,xv);

% -- Valutazione della funzione test sui punti xv --
yv=polfun1(xv);

% -- Calcolo errori assoluti --
Nerr = abs(yv-ny); %Newton
Lerr = abs(yv-ly); %Lagrange

% -- Grafico funzione test e interpolanti --
figure(1)
title("interpolazione polinomiale tramite forma di Newton e Lagrange")
hold on;
plot(xv,polfun1(xv),"g-"); % funzione test in verde
plot(xv,ny,"r-",LineWidth=2); % interpolazione Newton in rosso
plot(xv,ly,"b-",LineWidth=1.5); % interpolazione Lagrange in blu
plot(x,y,"ro"); % punti di interpolazione
legend("test", "Newton", "Lagrange");

% -- Grafico errori assoluti --
figure(2)
title("errori assoluti con interpolazione di Newton e di Lagrange");
hold on;
plot(xv,Nerr,"r-"); % errore Newton in rosso
plot(xv,Lerr,"b-"); % errore Lagrange in blu
legend("Newton", "Lagrange");

% -- Stampa errori assoluti --
errorN = max(Nerr);
errorL = max(Lerr);
fprintf("n = %d\n", n);
fprintf("Massimo errore assoluto con Newton = %22.15e\n", errorN);
fprintf("Massimo errore assoluto con Lagrange = %22.15e\n", errorL);

%********************************************************************
% Osservazioni:
% - L'errore analitico è nullo (grado polinomio test <= grado interpolante)
% - Con nodi equispaziati: Newton mantiene errore moderato, Lagrange può avere picchi elevati.
% - Con nodi di Chebyshev: Lagrange migliora grazie alla riduzione della costante di Lebesgue.
%********************************************************************