% Es.c
%*******************************************************************************************
% Interpolazione polinomiale di grado n di una funzione test in forma di
% Lagrange;
% n      : grado del polinomio interpolante
% tipo   : tipo di distribuzione dei punti 1=equispaziati 2=chebyshev
% Viene prodotto il grafico della funzione test, del polinomio interpolante
% e dei punti di interpolazione
% Si interpola una funzione continua su [a,b] scegliendo n+1 punti di interpolazione,
% che possono essere equispaziati (tipo=1) o di Chebyshev (tipo=2).
% La funzione di Runge mostra che con punti equispaziati, aumentando n,
% l'interpolante può divergere (fenomeno di Runge), con grandi errori agli estremi.
% Usando i nodi di Chebyshev, l'errore di interpolazione diminuisce e la convergenza migliora.
%*******************************************************************************************

clear all
close all

% definizione funzione test ed estremi intervallo [a,b]
f =@(x) runge(x);
a=-5;
b=5;

% setting del grado del polinomio e dei punti di interpolazione
n=20; %grado del polinomio interpolante
tipo=2; %1=equispaziati 2=chebyshev
if (tipo==1)
    %n+1 punti equispaziati
    x=linspace(a,b,n+1);
else
    %n+1 punti secondo la distribuzione di Chebyshev
    x=chebyshev(a,b,n);
end

% valutazione della funzione test nei punti di interpolazione (n+1 osservazioni campionate dalla funzione test)
y=f(x);

% punti su cui valutare l'interpolante polinomiale (modo 1)
m=20; % numero di punti tra due nodi di interpolazione
xv=linspace(a,b,m*n+1); % m*n + 1 punti totali su [a,b]

% %punti su cui valutare l'interpolante polinomiale (modo 2)
% in=0;
% for i=1:n
%    xv(in+1:in+m)=linspace(x(i),x(i+1),m);
%    in=in+m-1;
% end

%Metodo di interpolazione: forma di Lagrange (i coeff. sono i dati y)
%valutazione nella II forma di Lagrange (vedi la function lagrval2)
yv=lagrval2(y,x,xv);

%valutazione funzione test nei punti di rappresentazione grafica
yf=f(xv);

% -- Grafico funzione test, interpolante e punti --
figure(1);
hold on;
title('Interpolazione polinomiale in forma di Lagrange su funzione test');
plot(xv,yf,'r-','LineWidth',2); % grafico funzione test in rosso

plot(xv,yv,'g-','LineWidth',2); % grafico funzione polinomiale interpolante in verde

plot(x,y,'ro'); %disegno punti di interpolazione
legend("funzione test", "funzione interpolante", "punti di interpolazione");

% -- Grafico errore di interpolazione assoluto calcolato come |f(x) - p(x)| su [a,b]. --
yerr=abs(yf-yv);
figure(2);
title("errore di interpolazione assoluto");
hold on
plot(xv,yerr,'g-','LineWidth',2);
legend({'Errore assoluto'});

% -- Grafico errore di interpolazione in scala logaritmica --
figure(3);
semilogy(xv,yerr,'g-','LineWidth',2);
title("errore di interpolazione assoluto su scala logaritmica")
legend({'Errore assoluto (scala log)'});

% -- Calcola e stampa max. dell'errore analitico in [a,b] --
error=max(yerr);
fprintf('Errore interpolazione massimo: %22.15e',error);

%*************************************************
%interpolazione di dati vs interpolazione funzione
%perchè l'oscillazione? condizionamento
%*************************************************