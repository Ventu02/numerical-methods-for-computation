function I=simpson_sing(a,b,m,fa,fb,fm)
% Approssima l'integrale definito di una funzione mediante la formula di Simpson;
% INPUT
% a,b  --> estremi di integrazione
% m    --> punto medio
% fa,fb --> valori della funzione integranda in a e b
% fm    --> valore della funzione integranda in m
% I    <-- approssimazione dell'integrale

h=0.5*(b-a); %metà della lunghezza dell'intervallo

% Applico la formula di Simpson: (b-a)/6 * [f(a) + 4*f((a+b)/2) + f(b)]
% che diventa h/3 * [f(a) + 4*f(m) + f(b)] con h=(b-a)/2
I=(fa+4*fm+fb)*h/3;