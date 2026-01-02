function main_bisez(k,tol)
% Es. a
%***********************************************************
% Il metodo di bisezione si basa sul teorema degli zeri, che garantisce che se una
% funzione continua f(x) cambia segno in un intervallo [a,b] (cioè f(a)×f(b)<0),
% allora esiste almeno uno zero di f nell'intervallo. L'algoritmo procede dimezzando
% sistematicamente l'intervallo, scegliendo il sottointervallo dove la funzione
% cambia segno. Il processo termina quando l'ampiezza dell'intervallo è minore
% della tolleranza richiesta.
% INPUT
% k      --> indice della funzione 1<=k<=18
% tol    --> tolleranza richiesta
% richiede in input l'intervallo di innesco dopo aver visualizzato
% il grafico della funzione nell'intervallo di definizione
%***********************************************************
close all

% -- Selezione della funzione --
if(k<=9)
  funstr=['zfunf0',num2str(k,'%d')];
else
  funstr=['zfunf',num2str(k,'%d')];
end
fun=str2func(funstr);

% -- Intervallo di definizione della funzione --
ab=fun(); %restituisce [xa,xb]
xa=ab(1);
xb=ab(2);

% -- Grafico della funzione --
fplot(fun,[xa xb]);
hold on
plot([xa,xb],[0,0],'r-');
title('Metodo di Bisezione: ricerca dello zero della funzione')
legend({'Funzione','Asse x'});

% -- Intervallo di innesco (uguale all'intervallo di definizione) --
%inserimento manuale dell'intervallo [a,b]
%intab=input('dai intervallo di innesco: ');
%a=intab(1);
%b=intab(2);
%if (a < xa)
a=xa;
%end
%if (b > xb)
b=xb;
%end


plot([a,b],[0,0],'g-','LineWidth',1.5);
legend({'Funzione','Asse x','Intervallo iniziale'});
fprintf('[a,b]: %20.15e %20.15e\n',a,b);

% -- Applicazione metodo bisezione --
[xstar]=bisez(fun,a,b,tol);

% -- Visualizzazione risultati --
plot(xstar,0,'g+');
legend({'Funzione','Asse x','Intervallo iniziale','Zero trovato'});
fprintf('zero: %20.15e\n',xstar);
end

%***************************************************
% In media per tolleranza di 10^-15 servono 50 iterazioni perché
% risolvendo l'errore massimo garantito: (b-a)/2^N <= tol
% si ottiene:
% N >= log2((b-a)*tol) = log2((b-a)*10^-15) ≃ 50
%***************************************************