%script per il punto 2 dell'es C foglio 6
%tabella che riporta il numero di valutazioni necessarie per ogni
%tolleranza

f = @(x) effe5(x); %cambiare manualmente la funzione desiderata
a=0;
b=1;
m = 0.5*(a-b);
fa= f(a);
fb = f(b);
fm = f(m);

%con il metodo dei trapezi
disp("metodo dei trapezi");
t_ab=trapezi_sing(a,b,fa,fb);
nval=0; %inizialmente le valutazioni sono a 0;
punti = [a]; %il primo punto valutato è a
fprintf("p  numero di valutazioni\n");
for p=2:2:10
    tol = 10^-p;
    [val,nval,punti]=trapezi_adapt(f,a,b,fa,fb,tol,t_ab,nval,punti);
    fprintf("%2d  %d\n", p, nval);
end


%con il metodo di simpson
disp("metodo di simpson");
s_ab=simpson_sing(a,b,m,fa,fb,fm);
nval=0; %inizialmente le valutazioni sono a 0;
punti = [a]; %il primo punto valutato è a
fprintf("p  numero di valutazioni\n");
for p=2:2:10
    tol = 10^-p;
    [val,nval,punti]=simpson_adapt(f,a,b,m,fa,fb,fm,tol,s_ab,nval,punti);
    fprintf("%2d  %d\n", p, nval);
end
