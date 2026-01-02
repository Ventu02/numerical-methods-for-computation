function [y,y1]=poly_eval_der(a,x)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%function [y,y1]=poly_eval_der(c,x)
%Algoritmo di Ruffini per valutazione polinomio in forma canonica e sua
%derivata prima
%Input:
% a : vettore dei coefficienti (da quello di potenza massima a quella
%     minima)
% x : punto o vettore in cui valutare
%Output
% y  : valore o vettore valutato in x del polinomio
% y1 : valore o vettore valutato in x della derivata prima

%Algoritmo di Ruffini per valore e derivata prima di un polinomio
n=length(a)-1; %il grado è dato dal numero dei coefficienti -1
m=length(x);
%Ciclo sui punti di valutazione
y = ones(1,m);
y1 = ones(1,m);
for k = 1:m
    p1 = 0;
    p = a(1);
    for i = 2:n+1
        p1 = p + x(k)*p1; %valutazione della derivata in xk, ogni monomio viene sommato a se stesso n-1 volte
        p = a(1,i) + x(k)*p; %valutazione del polinomio in xk
    end
    y(1,k) = p;
    y1(1,k) = p1;
end


end
