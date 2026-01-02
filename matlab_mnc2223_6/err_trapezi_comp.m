function err_trapezi_comp(funz,a,b,n)
% Es.a
%******************************************************
% Funzione che approssima l'integrale definito di una
% funzione mediante la formula dei trapezi composta (O(h^2)) e
% calcola l'errore assoluto rispetto al valore ottenuto con quad.
% INPUT:
% funz --> stringa contenente il nome del file in cui e'
%          presente la funzione integranda
% a,b  --> estremi di integrazione
% n    --> numero di sottointervalli
%******************************************************

  tol=1.0e-12; % tolleranza per quad

  x = linspace(a,b,n+1); % nodi di integrazione

  funz = feval(funz,x); % valutazione della funzione nei nodi

  I=quad(funz,a,b,tol); % valore "esatto" dell'integrale

  fprintf('valore I= %22.15e\n',I); % stampa valore "esatto"
  
  h=(b-a)/n; % passo di integrazione
  IA=trapezi_comp(funz,a,b,n,0); % formula dei trapezi composta
  AbsErr=abs(I-IA); % errore assoluto

  % -- Stampa risultati --
  fprintf('n  h  IA  AbsErr\n');
  fprintf('%d %14.7e %22.15e %14.7e \n',n,h,IA,AbsErr);

