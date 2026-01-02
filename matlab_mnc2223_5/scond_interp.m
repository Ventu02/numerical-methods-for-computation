% Es. e
%********************************************************************************
% Analizza il condizionamento dell'interpolazione polinomiale e calcola la
% costante di Lebesgue associata all'interpolazione (massimo della somma dei valori assoluti
% dei polinomi fondamentali di Lagrange).
% Il condizionamento misura quanto può variare il risultato se si fanno piccole perturbazioni
% sui dati iniziali. Più grande è il numero di condizione maggiore è l'errore inerente.
%******************************************************************************

clear all
close all

tipo=1; % tipo di distribuzione dei nodi: 1 = equispaziati, 2 = Chebyshev
n=50; % grado del polinomio interpolante

% estremi dell'intervallo di interpolazione
a=-2;
b=1;

% generazione dei nodi di interpolazione in base al tipo scelto
switch (tipo)
    case 1
%n+1 punti equispaziati
      x=linspace(a,b,n+1);
    case 2
%n+1 punti secondo la distribuzione di Chebyshev
      x=chebyshev(a,b,n);
end

%punti su cui valutare il condizionamento
m=51; % numero di punti tra due nodi di interpolazione
xv=linspace(a,b,m*n+1);

% Calcolo dei polinomi fondamentali di Lagrange L_i(xv)
Lin=lagrange(n,x,xv);

% Calcolo della costante di Lebesgue Λ(x) = Σ_i |L_i(x)|
CI=sum(abs(Lin'));

% -- Grafico funzione di Lebesgue --
figure(tipo);
hold on;
plot(xv,CI,'LineWidth',2);
title('Condizionamento dell''interpolazione polinomiale (costante di Lebesgue)')
xlabel('x')
ylabel('\Lambda(x) = \Sigma_i |L_i(x)|')
legend({'Costante di Lebesgue'});

% -- Calcolo e stampa del numero di condizione (costante di Lebesgue massima) --
ncond=max(CI);
fprintf('Numero di condizione: %22.15e\n',ncond);

%**************************************
% Meglio condizionato con Chebyshev.
% Considerazioni sulla convergenza:
% - con Chebyshev l'errore decresce esponenzialmente al crescere di n;
% - con nodi equispaziati si manifesta il fenomeno di Runge (dopo un certo n l'errore cresce in modo
% incontrollato, soprattutto ai bordi)
%**************************************