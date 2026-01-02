%script serr_polint.m
%es 5/G

%definisco l'intervallo
a=-1;
b=1;
f = @(x) fun5(x);
%f=fun5.m
%n = 1:2:70; %gradi dispari da 1 a 70
x=linspace(a,b);
figure(1)
hold on;
np = 2:2:70;
nd = 1:2:70;
for i =1:2:70
    n = nd(i)
    ex = linspace(a,b,n);
    ey = f(ex);
    ep=lagrval2(ey,ex,ex);
    eErr(i)= abs(ey-ep);
end
plot(ex,eErr, "r-");

figure(2)
hold on;
for i =1:2:70
    n = nd(i);
    cx = chebyshev(a,b,n);
    cy = f(cx);
    cp=lagrval2(cy,cx,cx);
    cErr(i)= abs(cy.-cp);
end
    plot(nd,cErr, "b-");
