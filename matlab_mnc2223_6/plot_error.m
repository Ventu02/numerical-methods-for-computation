%script plot_error esercizio di verifica D foglio 6

fun = @(x) effe4(x); %cambiare manualmente la funzione
a = 0;
b = 1;
nn = 1:10;
%x = linspace(a,b,n+1); 

I = quad(fun,a,b);
for i = 1:length(nn)
n = nn(i);
It = trapezi_comp(fun,a,b,n,0);
Is = simpson_comp(fun,a,b,n,0);
Errt(1,n) = abs(I-It);
Errs(1,n) = abs(I-Is);
end

figure(1)
hold on;
plot(nn,Errt, "b-", LineWidth=2);
plot(nn,Errs, "g-", LineWidth=2);
legend("trapezi", "simpson");
title("errori di interpolazione")



