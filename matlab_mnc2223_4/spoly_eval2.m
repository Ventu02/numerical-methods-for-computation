%Es.e
%*********************************************************************
%Ha lo scopo di valutare un polinomio in un determinato intervallo e di analizzare 
%l’errore numerico introducendo piccole perturbazioni nei coefficienti e nei valori discreti di input
% d : vettore dei coefficienti (da quello di potenza massima a quella
%     minima)
% viene prodotto il grafico della funzione polinomiale nell'intervallo
%*********************************************************************
clc
clear all
close all

gc=1;
switch gc
    case 1 % coefficienti numeri finiti, discretizzazione no
       d=[100,-1];
       d=fliplr(d);  a=100;  b=101; %flipr per invertire il vettore dei coeff.
    case 2 % a_0 non finito, a_1 e discretizzazione si
       d=[99.9,-1];
       d=fliplr(d);  a=100;  b=101;
    case 3 % a_1 non finito, a_0 e discretizzazione si 
       d=[100,-1.001];
       d=fliplr(d);  a=100;  b=101;
    case 4 % a_0, a_1 e discretizzazione sono numeri finiti
       d=[100,-1];
       d=fliplr(d);  a=100;  b=101;
end

% conversione in single dei coefficienti
sc=single(d);
n=length(d);

%generazione punti valutazione
if gc==1 %per il caso 1 scelgo pochi punti per vedere meglio il grafico
    m=51;
    x=linspace(a,b,m); %punti equispaziati
else 
    h=2^-7; %passo di discretizzazione (h=1/128)
    x=a:h:b;
    m=length(x);
end

%conversione in single dei punti di valutazione
sx=single(x);
y=poly_eval(d,x); %valutazione polinomio con Horner
sy=poly_eval(double(sc),double(sx)); %riporto in double i valori che avevo convertito single, causando delle perturbazioni

%grafico funzione polinomiale
figure(1);
hold on;
title("Grafico della funzione polinomiale su [a, b]");
plot(x,y,'r.-','LineWidth',1.5);
plot(x,zeros(1,m),'k-','LineWidth',1.5);
legend({'Polinomio','Asse x'});

%grafico relative error
figure(2); 
relerr=abs((sy-y)./y);
plot(x,relerr,'b.-');
title("Errore relativo tra single e double precision");
legend({'Errore relativo'});

%*********************************************************************
%Solo nel caso 4 l'errore relativo è 0 in quanto sono numeri finiti e
%quindi non subiscono nessuna approssimazione dei dati
%*********************************************************************