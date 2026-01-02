% Es. c
%********************************************************************************
%script di innesco per trapezi_adapt
% Questo script avvia l'integrazione adattiva con la formula dei trapezi.
% A differenza della formula dei trapezi composta standard, che usa sottointervalli
% di uguale ampiezza, il metodo adattivo decide dinamicamente dove raffinare
% la suddivisione, concentrandosi nelle zone dove la funzione varia più rapidamente.
% L'obiettivo è ottenere |∫f(x)dx - I| ≤ tol con il minor numero possibile
% di valutazioni di funzione. Il processo termina quando in ogni sottointervallo
% la stima dell'errore è inferiore alla tolleranza richiesta.
%********************************************************************************
function main_trapezi_adapt(fun,a,b,tol)
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
title('Integrazione adattiva con trapezi');
legend({'Funzione integranda'});

% -- Parametri per il metodo adattivo da passare a trapezi_adapt --
fa=feval(fun,a); %valori funzione fun estremo a di [a,b]
fb=feval(fun,b); %valori funzione fun estremo b di [a,b]
t_ab=trapezi_sing(a,b,fa,fb); % innesco trapezi_sing (stima trapezi su [a,b])
punti(1)=a; % primo punto valutato
nval=2; % numero di valutazioni iniziali

% -- Integrazione adattiva dei trapezi --
[val,nval,punti]=trapezi_adapt(fun,a,b,fa,fb,tol,t_ab,nval,punti);

% -- Visualizzazione punti di valutazione e risultati --
plot(punti,0,'r+','LineWidth',1.5); %punti valutati nel grafico
legend({'Funzione integranda','Punti valutati'});
fprintf('Valore integrale = %22.15e\n',val);
fprintf('AbsError = %14.7e\n',abs(val-I));
fprintf('Numero di valutazioni = %d\n',nval);
fprintf('Numero di intervalli = %d\n',length(punti)-1);