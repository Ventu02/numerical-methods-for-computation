clear all;
%crea figure diverse senza sovrapporle nella stessa schermata
figure(1);
x = linspace(-3,3,50);
y = x.^3-4*x;
figure1 = plot(x,y,'r-*');
hold off;

figure(2);
x1 = linspace(-6,6,50);
y1 = 0.2*x1.^4 + x1.^3 - 0.4*x1.^2-3*x1 + 1;
figure2 = plot(x1,y1,'b-^');
hold off;

figure(3);
x2 = linspace(0,2*pi,50);
y2 = 3*cos(2*x2)-2*cos(x2);
figure3 = plot(x2,y2,'m-o');
hold off;

figure(4);
x3 = linspace(-6*pi,6*pi,50);
y3 = sin(2*x3)./x3;
figure4 = plot(x3,y3,'-*');
hold off;