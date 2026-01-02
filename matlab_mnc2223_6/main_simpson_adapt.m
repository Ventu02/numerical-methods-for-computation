% Es. c
%********************************************************************************
%script di innesco per simpson_adapt
% Questo script avvia l'integrazione adattiva con la formula di Simpson.
% A differenza della formula di Simpson composta standard, che usa sottointervalli
% di uguale ampiezza, il metodo adattivo decide dinamicamente dove raffinare
% la suddivisione, concentrandosi nelle zone dove la funzione varia più rapidamente.
% L'obiettivo è ottenere |∫f(x)dx - I| ≤ tol con il minor numero possibile
% di valutazioni di funzione. Il processo termina quando in ogni sottointervallo
% la stima dell'errore è inferiore alla tolleranza richiesta.
%********************************************************************************
function main_simpson_adapt(fun,a,b,tol)
close all

% -- Calcolo integrale esatto con quad --
tol1=1.0e-12;
I=quad(fun,a,b,tol1);
fprintf('valore I= %14.7e\n',I);

% -- Grafico funzione integranda --
m=100; % numero di punti per il grafico
x=linspace(a,b,m); % vettore di punti equispaziati
y=feval(fun,x); % valutazione della funzione nei punti
figure(1)
hold on
plot(x,y,'LineWidth',1.5);
title('Integrazione adattiva con Simpson');
legend({'Funzione integranda'});

% -- Parametri per il metodo adattivo da passare a simpson_adapt --
m=0.5*(a+b); %punto medio intervallo
fa=feval(fun,a); %valori funzione fun estremo a di [a,b]
fb=feval(fun,b); %valori funzione fun estremo b di [a,b]
fm=feval(fun,m); %valori funzione fun punto medio

s_ab=simpson_sing(a,b,m,fa,fb,fm); %innesco simpson_sing (stima simpson su [a,b])
punti(1)=a; % primo punto valutato
nval=3; % numero di valutazioni iniziali

% -- Integrazione adattiva di Simpson --
[val,nval,punti]=simpson_adapt(fun,a,b,m,fa,fb,fm,tol,s_ab,nval,punti);

% -- Visualizzazione punti di valutazione e risultati --
plot(punti,0,'k+','LineWidth',1.5); %punti valutati nel grafico
legend({'Funzione integranda','Punti valutati'});
fprintf('Valore integrale = %22.15e\n',val);
fprintf('AbsError = %14.7e\n',abs(val-I));
fprintf('Numero valutazioni = %d\n',nval);
fprintf('Numero di intervalli = %d\n',length(punti)-1);