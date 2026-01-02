% Es. a
%**************************************************************************
% Interpolazione polinomiale nella forma di Newton su un dataset (determinare un polinomio p(x)
% di grado n che passa per n+1 punti distinti (xi, yi)),
% viene prodotto il grafico del data set e del polinomio interpolante
% La base di Newton porta ad una matrice triangolare superiore più semplice da risolvere (sistema Nc = y)
%**************************************************************************

clear all
close all
A=load('dataset3.dat'); %caricamento del dataset da file
[n,m]=size(A); %numero di righe e colonne del dataset
qx=A(1:n,1)'; %ascisse punti dati (vettore riga)
qy=A(1:n,2)'; %ordinate punti dati (vettore riga)

g = n-1; % definizione del grado del polinomio


% definizione degli estremi dell'intervallo di interpolazione
a = min(qx);
b = max(qx);

%Metodo di interpolazione: forma di Newton
%calcolo della matrice N del sistema lineare (vedi function newton.m)
N = newton(g,qx(1:g),qx);

%I coeff. del polinomio sono la soluzione del sistema lineare risolto
%con il metodo delle sostituzioni in avanti (vedi function lsolve.m);
c=lsolve(N,qy);

%punti su cui valutare l'interpolante polinomiale per il grafico
x = linspace(a,b,100);

%valutazione polinomio interpolante mediante Horner (vedi function newtval.m)
y = newtval(c,qx,x);

%grafico dati (qx,qy) e valori polinomio interpolante (x,y)
figure(1)
plot(qx,qy,'ko','LineWidth',1.5); %dati da interpolare
hold on;
plot(x,y,'r--','LineWidth',2); %polinomio interpolante in forma di Newton
title('Interpolazione polinomiale in forma di Newton');
legend({'Dati','Polinomio interpolante'});
