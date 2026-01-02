%Es.d
%*********************************************************************
% Confronto tra valutazione polinomiale in precisione single e double.
% Analisi della propagazione degli errori di arrotondamento nell'algoritmo di Horner.
% I coefficienti e i punti di valutazione vengono convertiti in single precision
% per osservare la perdita di accuratezza rispetto alla precisione doppia.
%*********************************************************************
clc
clear all
close all

dc=[1, -39, 504, -2158]; %polinomio P(x)=x³-39x²+504x-2158
da=10; %estremo inferiore del dominio di valutazione
db=16; %estremo superiore del dominio

% -- Conversione in single precision --
sa=single(da); %estremo inferiore in single precision
sb=single(db); %estremo superiore in single precision
sc=single(dc); %coefficienti in single precision
n=length(dc); %numero coefficienti (grado del polinomio + 1)

% -- Discretizzazione del dominio di valutazione --
h=2^-5; %passo di discretizzazione (1/32)
dx=da:h:db; %griglia di punti di valutazione
m=length(dx); %numero di punti nella griglia
sx=single(dx); %griglia convertita in single precision

% -- Valutazione tramite algoritmo di Horner in entrambe le precisioni --
dy=poly_eval(dc,dx); %valutazione in double precision
sy=poly_eval(sc,sx); %valutazione in single precision

% -- Visualizzazione del comportamento del polinomio --
figure(1);
hold on;
title("Valutazione comportamento polinomio in single e double precision")
plot(dx,dy,'r.-','LineWidth',1.5); %andamento del polinomio
% plot(dx,sy,'b.-','LineWidth',1.5); %andamento del polinomio single
plot(dx,zeros(1,m),'k-','LineWidth',1.5); %asse delle ascisse
legend({'Polinomio (double precision)','Polinomio (single precision)','Asse x'});

% -- Analisi dell'errore di precisione --
figure(2);
hold on;
title("Errore relativo tra single e double precision")
relerr=abs((sy-dy)./dy); %errore relativo tra single e double
plot(dx,relerr,'b.-');
legend({'Errore relativo'});

%*********************************************************************
%Errore relativo più alto dove il polinomio si avvicina a 0
%*********************************************************************