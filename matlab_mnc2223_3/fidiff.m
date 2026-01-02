%Es. d
%****************************************************
%approssimazione della derivata della funzione esponenziale e^x [exp(x)]
%mediante rapporto incrementale al diminuire di h [fpfd=(f(x+h)-f(x))/h]
%al diminuire di h il rapporto tende al valore esatto della derivata cioè
%f'(x)=exp(x).
%Quando h diventa troppo piccolo l'errore non continua a diminuire ma
%inizia a crescere
%****************************************************
%calcola la derivata numerica di e^x in un punto x [default x=1]
function fidiff(x)
if nargin<1 %se non viene passato nessun argomento usa x=1
    x=1; 
end
fp = exp(x); % valore esatto della derivata (e^x)

n=15; %numero iterazioni
h = logspace(-(n-1),0,n)'; % vettore colonna dei passi (h da 10^-(n-1) a 10^0)

%Ciclo e stampa di:
% - fp = derivata esatta
% - fpfd = derivata numerica con rapporto incrementale
% - AErr = errore assoluto |fpfd − fp|
% - RErr = errore relativo |fpfd − fp| / |fp|

fprintf(' h            fp           fpfd     AErr      RErr\n');
for k=n:-1:1
  fpfd = (exp(x+h(k)) - exp(x))/h(k);
  AErr(k) = abs(fpfd - fp);
  RErr(k) = abs((fpfd - fp)/fp);
  fprintf('%8.1e %12.5f %12.5f %9.2e %9.2e\n',h(k),fp,fpfd,AErr(k),RErr(k));
end

%grafico del Relative Error in scala logaritmica
% loglog(h,RErr,'o-','LineWidth',1.5); 
% xlabel('Stepsize h'); 
% ylabel('Relative error');

%****************************************************
%A 10^-8 avviene cancellazione numerica, prima errore analitico dallo
%sviluppo di Taylor
%****************************************************