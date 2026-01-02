%Es.e
%*******************************************************
%studio del condizionamento del problema y=fun(x) con fun(x)=sin(x) ossia
%come varia l'output in funzione di piccole variazioni sull'input x
%
% L'errore inerente è dovuto alla rappresentazione approssimata dei numeri in precisione finita.
% Il numero di condizionamento K(x) = |x/tan(x)| quantifica quanto una piccola perturbazione
% in x influisce sul valore di sin(x). In particolare:
% - K(x) grande: il problema è mal condizionato (piccole variazioni causano grandi cambiamenti)
% - K(x) piccolo: il problema è ben condizionato (piccole variazioni causano piccoli cambiamenti)
%
% Punti chiave nel condizionamento di sin(x):
% - In x=0: K(0)=0, il problema è perfettamente condizionato
% - In x=π/2: K(π/2)=∞, il problema è estremamente mal condizionato
% - In x=π: K(π)=π/0=∞, il problema è estremamente mal condizionato
%*******************************************************

clear all;

%valori usati per perturbare x
eps1=2^-12;
eps2=2^-24;


%vettore di valori di test per x in double precision e conversione in single
xD = [pi, pi+eps1,pi+eps2, pi/2,pi/2+eps1,pi/2+eps2, 0, eps1,eps2];
s = ["pi", "pi+eps1","pi+eps2", "pi/2","pi/2+eps1","pi/2+eps2", "0", "eps1","eps2"];
xS = single(xD);

%calcolo funzione e condizionamento
fxS = fun(xS); %valori di sin(x) in single
fxD = fun(xD); %valori di sin(x) in double
cond = abs(xD./tan(xD)); %num. condizionamento K(x) = |x / tan(x)|
relerr = abs((fxD - fxS)./fxD); %relative error tra double e single

%stampa dei risultati
fprintf ('  x            xD                    f(xS)           f(xD)                   Erel       -log10(Erel)     Cond     log10(cond)\n') ;
for i=1:length(xD)
  fprintf ('%9s  %22.15e  %14.7e  %22.15e ', s(i), xD(i), fxS(i), fxD(i)) ; %stampa x in double, f(x) in single e double
  fprintf ('%e   %3.0f        %e    %3.0f\n',relerr(i),-log10(relerr(i)),cond(i),log10(cond(i)));
  % %stampa errore relativo, cifre corrette stimate(-log10(relerr)), condizionamento e log10(condizionamento)
end

%function secondaria
function y=fun(x)
y=sin(x);
end