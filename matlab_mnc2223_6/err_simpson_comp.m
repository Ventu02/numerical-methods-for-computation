function err_simpson_comp(funz,a,b,n)
% Es. a
%******************************************************
% Funzione che approssima l'integrale definito di una
% funzione mediante la formula di simpson composta e
% calcola l'errore.
% funz --> stringa contenente il nome del file in cui e'
%          presente la funzione integranda
% a,b  --> estremi di integrazione
% n    --> numero di sottointervalli
% Viene prodotta una stampa
%******************************************************

  tol=1.0e-12; % tolleranza per quad

  I=quad(funz,a,b,tol); % valore "esatto" dell'integrale

  fprintf('valore I= %22.15e\n',I); % stampa valore "esatto"
  
  h=(b-a)/n; % passo di integrazione
  IA=simpson_comp(funz,a,b,n,0); % approssimazione con simpson composta
  AbsErr=abs(I-IA); % errore assoluto

  % -- Stampa risultati --
  fprintf('n  h  IA  AbsErr\n');
  fprintf('%d %14.7e %22.15e %14.7e \n',n,h,IA,AbsErr);