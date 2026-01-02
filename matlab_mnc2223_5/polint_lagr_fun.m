function polint_lagr_fun(ifun, n, tipo)
% Es. d
%********************************************************************************
% Analisi dell'interpolazione polinomiale di Lagrange per una funzione test scelta tra un
% possibile di 5 funzioni.
% Vengono prodotti tre grafici: funzione/interpolante, errore assoluto e errore in scala logaritmica.
%******************************************************************************

%ifun è l'indice della funzione

%di base, se l'indice specificato non è 1:5 specifico un'altra fun
f=@(x) polfun1(x); %funzione predefinita
a=-1; %intervallo di default
b=3.5; %intervallo di default
if ifun==1
    f =@(x) fun1(x);
    a=-pi; %estremo superiore intervallo
    b=pi; %estremo inferiore
end
if  ifun==2
    f =@(x) fun2(x);
    a=-2;
    b=2;
end
if ifun==3
    f =@(x) fun3(x);
    a=-2;
    b=1;
end
if ifun==4
    f =@(x) fun4(x);
    a=-1;
    b=1;
end
if ifun==5
    f =@(x) fun5(x);
    a=-1;
    b=1;
end

% Scelta distribuzione dei punti di interpolazione:
% tipo:1---> punti equispaziati
% tipo:2---> punti di Chebyshev

if(tipo==1)%n+1 punti equispaziati
x=linspace(a,b,n+1);
else %n+1 punti secondo la distribuzione di Chebyshev
x=chebyshev(a,b,n);
end

%n+1 osservazioni campionate dalla funzione test 
y=f(x);

%punti su cui valutare l'interpolazione polinomiale modo 1
m=20;
xv=linspace(a,b,m*n+1);

%valutazione nella II forma di Lagrange (vedi la function lagrval2)
yv=lagrval2(y,x,xv);

%valutazione funzione test nei punti di rappresentazione grafica
yf=f(xv);

% -- Visualizzazione grafica --
figure(1)
hold on;
plot(xv,yf,'r-','LineWidth',2); % funzione test in rosso
plot(xv,yv,'g-','LineWidth',2); % funzione interpolante in verde
plot(x,y,'ro'); % nodi di interpolazione
legend("funzione test", "funzione interpolante", "nodi di interpolazione")
title('Interpolazione polinomiale di Lagrange: funzione e polinomio interpolante')

% -- Grafico errore assoluto --
figure(2)
yerr=abs(yf-yv);
hold on
plot(xv,yerr,'g-','LineWidth',2);
legend({'Errore assoluto'});
title('Errore assoluto di interpolazione |f(x)-p(x)|')

% -- Grafico errore di interpolazione in scala logaritmica --
figure(3);
semilogy(xv,yerr,'g-','LineWidth',2);
legend({'Errore assoluto (scala log)'});
title('Errore assoluto di interpolazione (scala logaritmica)')

% Calcola e stampa max. dell'errore analitico in [a,b]
error=max(yerr);
fprintf('Errore interpolazione massimo: %22.15e\n',error);

%**************************************
% Considerazioni sulla convergenza:
% - con Chebyshev l'errore decresce esponenzialmente al crescere di n;
% - con nodi equispaziati si manifesta il fenomeno di Runge (dopo un certo n l'errore cresce in modo
% incontrollato, soprattutto ai bordi);
% - con n pari l'errore massimo è minore di quello con n dispari perché il massimo non cade sui nodi,
% mentre con n dispari il massimo cade su un nodo e l'errore è maggiore.
%**************************************