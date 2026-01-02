x = linspace(-2,2,50);
y1 = cosh(x);
y2 = 0.5*exp(x);

plot(x,y1,'r-^');
hold on;
plot(x,y2,'m-*');
hold off;
grid on;

title(' esercizio di prova');
legend('cosh(x)', '0.5*exp(x)');
xlabel('ascisse');
ylabel('ordinate');