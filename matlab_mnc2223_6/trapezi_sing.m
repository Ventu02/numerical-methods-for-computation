function I=trapezi_sing(a,b,fa,fb)
% Approssima l'integrale definito di una funzione mediante la formula dei trapezi;
% INPUT
% a,b  --> estremi di integrazione
% fa,fb --> valori della funzione integranda in a e b
% I    <-- approssimazione dell'integrale

h=b-a; %lunghezza intervallo

% Applico la formula dei trapezi: area = (b-a) * (fa + fb)/2 che diventa
% area = h * (fa + fb)/2 con h = b-a
I=0.5*h*(fa+fb); 