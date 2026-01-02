clear all;

figure(1);
x = linspace(-3,3,50);
y = x.^3-4*x;
subplot(221);
plot(x,y,'r-*');
axis tight;



x1 = linspace(-6,6,50);
y1 = 0.2*x1.^4 + x1.^3 - 0.4*x1.^2-3*x1 + 1;
subplot(222);
plot(x1,y1,'b-^');
axis tight;



x2 = linspace(0,2*pi,50);
y2 = 3*cos(2*x2)-2*cos(x2);
subplot(223);
plot(x2,y2,'m-o');
axis tight;



x3 = linspace(-6*pi,6*pi,50);
y3 = sin(2*x3)./x3;
subplot(224);
plot(x3,y3,'-*');
axis tight;
