function sapprox_unif(g,k)
% Calcola e visualizza un polinomio di Bernstein che approssima una funzione data,
% l’obbiettivo è minimizzare l’errore uniforme su un intervallo [a,b]
% All'aumentare del grado g, il polinomio approssima sempre meglio la
% funzione originale, e di conseguenza l'errore assoluto
% diminuisce. Lo script visualizza la funzione, la sua approssimazione
% e il grafico dell'errore assoluto.
% input: g --> grado del polinomio
%        k --> indice funzione
% output: grafico della funzione polinomiale approssimante
%         e della funzione fun e grafico della funzione errore

k=1;
g=20;
n=501; %501 punti equispaziati

% Per ogni funzione si ha:
% a,b --> estremi intervallo
% x --> vettore di n punti equispaziati in [a,b]
% xi --> vettore di g+1 punti equispaziati in [a,b]
% c --> vettore dei g+1 coefficienti di Bernstein (valori della funzione nei punti xi)
% y --> vettore dei valori della funzione nei punti x

switch (k)
    case 1 %y=cosh(x)
        a=-2; b=2;
        x=linspace(a,b,n);
        xi=linspace(a,b,g+1); %n+1 punti per coeff. Bernstein
        c=cosh(xi);
        y=cosh(x);
    case 2 %y=0.5e^x
        a=-2; b=2;
        x=linspace(a,b,n);
        xi=linspace(a,b,g+1);
        c=0.5*exp(xi);
        y=0.5*exp(x);
    case 3 %x^3-4x
        a=-3; b=3;
        d=[1 0 -4 0]; % Coeff. polinomio
        x=linspace(a,b,n);
        xi=linspace(a,b,g+1); 
        c=polyval(d,xi); %valori funzione nei punti xi
        y=polyval(d,x); %valori funzione esatta
    case 4 %0.2x^4+x^3-0.4x^2-3x+1
        a=-6; b=6;
        d=[0.2 1 -0.4 -3 1];
        x=linspace(a,b,n);
        xi=linspace(a,b,g+1);
        c=polyval(d,xi);
        y=polyval(d,x);
    case 5 %3cos(2x)-2cos(x)
        a=0; b=2*pi;
        x=linspace(a,b,n);
        xi=linspace(a,b,g+1);
        c=3*cos(2.*xi)-2*cos(xi);
        y=3*cos(2.*x)-2*cos(x);
    case 6 %sin(2x)/x
        a=-6*pi; b=6*pi;
        x=linspace(a,b,n);
        xi=linspace(a,b,g+1);
        c=sin(2.*xi)./xi;
        y=sin(2.*x)./x;
    case 7 %rad.quadr(1-x)
        a=0; b=1;
        x=linspace(a,b,n);
        xi=linspace(a,b,g+1);
        c=sqrt(1-xi);
        y=sqrt(1-x);
end


% -- Algoritmo formula ricorrente base Bernstein in [a,b] --
bs=bernst(g,x,a,b); %matrice valori base di Bernstein su [a,b]
y1=(bs*c')'; %combinazione lineare delle basi con i coeff. c

% -- Visualizzazione grafica --
figure(1)
hold on;
plot([a,b]',[0,0]','k'); %asse x
plot(x,y,'g-'); %funzione originale in verde
plot(x,y1,'r-'); %polinomio approssimante di Bernstein in rosso
plot(linspace(a,b,g+1),c,'b+-'); %coefficienti di Bernstein in blu
title('Approssimazione uniforme con polinomio di Bernstein');
legend({'asse x', 'funzione', 'polinomio approssimante', 'coefficienti di Bernstein'});

% -- Calcolo e grafico errore assoluto --
figure(2)
hold on;
title('Errore assoluto');
err=abs(y-y1); %errore assoluto punto per punto
plot(x,err,'g-');
legend({'Errore assoluto'});
fprintf('Max.Err. %e\n',max(err));

%****************************************************************
% All'aumentare di n si nota che il polinomio di Bernstein segue meglio la
% funzione originale e l'errore algoritmo diminuisce progressivamente
%****************************************************************