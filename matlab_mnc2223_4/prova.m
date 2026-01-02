x = 10:16;
c = [1 -39 +504 -2158];
y = poly_eval(c,x);
y1 = polyval(c,x);
figure(1)
plot(x,y,"r");
title("poly-eval")
grid on;

figure(2)
plot(x,y1,"b");
title("polyval");
grid on;

y = poly_eval(c,x)
y1 = polyval(c,x)