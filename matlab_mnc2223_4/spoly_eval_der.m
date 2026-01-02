%Es.c
%**********************************************************************
% Valutazione numerica di polinomi e delle loro derivate usando l'algoritmo di Horner.
% polyval implementa l'algoritmo di Horner per valutazione efficiente: O(n) operazioni
% invece di O(n²) della valutazione diretta. Riduce errori di arrotondamento.
% polyder calcola analiticamente i coefficienti della derivata.
%**********************************************************************
%primo polinomio: funzione cubica con zeri multipli
x1=linspace(-3,3); %griglia di valutazione con 100 punti equidistanti
c1 = [1, 0, -4, 0]; %coefficienti: p₁(x)=x³-4x=x(x²-4)=x(x-2)(x+2)
y1 = polyval(c1,x1); %valutazione tramite algoritmo di Horner
dc1 = polyder(c1); %derivazione simbolica: p₁'(x)=3x²-4
dy1=polyval(dc1,x1); %valutazione della derivata

%secondo polinomio: funzione quartica generale
x2=linspace(-6,6); %dominio esteso per catturare comportamento asintotico
c2= [0.2, 1, -0.4, -3, 1]; %coefficienti: p₂(x)=0.2x⁴+x³-0.4x²-3x+1
y2 = polyval(c2,x2);
dc2 = polyder(c2); %p₂'(x)=0.8x³+3x²-0.8x-3
dy2 = polyval(dc2,x2);

% grafico primo polinomio
figure(1)
hold on;
title("y = x^3 - 4x");
plot(x1,y1,"g-"); %funzione originale in verde
plot(x1,dy1, "k-"); %derivata prima (dove si annulla = punto critico) in nero
legend("y", "y'");

% grafico secondo polinomio
figure(2)
hold on;
title("y=0.2x^4 +x^3 −0.4x^2 −3x +1")
plot(x2,y2,"g-"); %funzione originale in verde
plot(x2,dy2, "k-"); %derivata prima (dove si annulla = punto critico) in nero
legend("y", "y'");