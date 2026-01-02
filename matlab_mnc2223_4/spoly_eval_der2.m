%esercizio I foglio 4

%primo polinomio
x1=linspace(-3,3);
c1 = [1, 0, -4, 0];
[y1,dy1] = poly_eval_der(c1,x1);

%secondo polinomio
x2=linspace(-6,6);
c2= [0.2, 1, -0.4, -3, 1];
[y2,dy2] = poly_eval_der(c2,x2);

figure(1)
hold on;
title("y = x^3 - 4x");
plot(x1,y1,"g-");
plot(x1,dy1, "k-");
legend("y", "y'");

figure(2)
hold on;
title("y=0.2x^4 +x^3 −0.4x^2 −3x +1")
plot(x2,y2,"g-");
plot(x2,dy2, "k-");
legend("y", "y'");
