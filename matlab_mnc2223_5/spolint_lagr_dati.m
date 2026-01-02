% Es. b
%******************************************************************************
% Interpolazione polinomiale nella forma di Lagrange su un dataset, 
% viene prodotto il grafico del data set e del polinomio interpolante
% In questo script i dati sono letti da un file e si usa la base di Lagrange, che porta a
% una matrice identità (ogni polinomio base vale 1 in un nodo e 0 negli altri).
% La valutazione del polinomio interpolante avviene tramite la funzione lagrval2,
% che implementa la formula di Lagrange.
%******************************************************************************

clear all
close all
A=load('dataset1.dat');
[n,m]=size(A);

x=A(1:n,1)'; %ascisse punti dati
y=A(1:n,2)'; %ordinate punti dati

%definire gli estremi dell'intervallo di interpolazione
a = min(x);
b = max(x);

% punti su cui valutare l'interpolante polinomiale per il grafico
xv = linspace(a,b,100);

% valutazione polinomio interpolante mediante Lagrange (vedi function lagrval2.m)
yv = lagrval2(y,x,xv);

% grafico dati (x,y) e valori polinomio interpolante (xv,yv)
figure(1)
plot(x,y,'ko','LineWidth',1.5); %punti dati da interpolare
hold on;
plot(xv,yv,'r--','LineWidth',2); %polinomio interpolante in forma di Lagrange
title('Interpolazione polinomiale in forma di Lagrange');
legend({'Dati','Polinomio interpolante'});