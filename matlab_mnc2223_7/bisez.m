function [xstar]=bisez(fun,a,b,tol)
% Es.a
%***********************************************************
% questa function determina uno zero di una funzione con 
% il metodo di bisezione
% fun    --> nome della funzione
% a,b    --> intervallo di innesco della funzione
% tol    --> tolleranza richiesta
% xstar  <-- approssimazione dello zero
%***********************************************************

count = 1;

  if ((a<0) & (b>0) & (feval(fun,0)==0)) % Caso particolare: zero in x= 0
    xstar=0; % restituisce lo zero
  else

   fa=feval(fun,a); %valutazione della funzione in a
   fb=feval(fun,b); %valutazione della funzione in b
   fprintf("n              intervallo\n");

    % Ciclo iterativo del metodo di bisezione
    while (abs(b-a)>(tol+eps.*min([abs(a),abs(b)]))) %se la larghezza dell'intervallo è > della tolleranza richiesta
     xm=a+(b-a)./2; %calcolo punto medio
     fxm=feval(fun,xm); %aggiornamento intervallo

     if (sign(fa)==sign(fxm)) %se f(a) e f(Xm) hanno lo stesso segno significa che lo zero
         %si trova nell'intervallo [Xm,b], quindi si aggiorna a=Xm
       a=xm;
       fa=fxm;
     else %lo zero è nell'intervallo [a,Xm] quindi b=Xm
       b=xm;
       fb=fxm;
     end

    fprintf("%d         %22.15e - %22.15e\n", count, a, b);
    count = count+1;
    end
    xstar=a+(b-a)./2; %approssimazione finale dello zero
  end

