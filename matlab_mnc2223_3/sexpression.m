%Es.c
%***************************************************
% script per analizzare la cancellazione numerica (errore nella sottrazione di
% due numeri quasi uguali con perdita di cifre significative),
% si vuole valutare l'espressione ((1+x)-1)/x
% con x numero finito e valutare l'E_ALG;
% utilizzare il programma conv_dec2bin.m per
% determinare se i valori x utilizzati hanno una 
% rappresentazione esatta in base 2 a 53 cifre
%***************************************************
%assegna un valore alla x
x=2^-52;
%soluzione errata da 2^-53 in poi in quanto si verifica che 1 + x == 1
%rendendo x nulla

%calcolo espressione (sensibile alla cancellazione)
y=((1+x)-1)/x;

%stampa dei risultati
fprintf(' x                      y\n');
fprintf('%22.15e %22.15e\n\n',x,y);
fprintf('ErrAlg = %22.15e\n',abs((y-1))/1);
if (y==1.0) %controlla se il calcolo e' esatto
  fprintf('calcolo esatto\n');
else
  fprintf('calcolo errato\n');
end
