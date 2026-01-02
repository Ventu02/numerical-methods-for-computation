function y=poly_eval(c,x) 
%Algoritmo di Horner per valutazione polinomio in forma canonica
%Input:
% c : vettore dei coefficienti (da quello di potenza massima
%     a quella minima)
% x : punto o vettore in cui valutare
%Output
% y : valore o vettore valutato in x
n = length(c)-1; %il grado è dato dal  numero di coefficienti -1 
m = length(x); %lunghezza dell'array contenente le x in cui valutare il polinomio
y = ones(1,m); %preallocazione dell'array di output
for i = 1:m
    %l'ordine dei coefficienti è inverso perchè è il primo coefficiente ad
    %avere grado massimo
   p = c(1); %p=c(length(c));
   for k = 2:n+1 %for k = n:1
       p = c(k) + x(i)*p;
   end
   y(1,i) = p;
end
end