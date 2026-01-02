function [alg1, alg2, alg3, alg4, alg5] = fcompound(n,x)
%n: numero di pagamenti
%x: tasso d'interesse
fx=single(x);
fz=1+fx/n;
w=1;
for i=1:n %metodo per ottentere Alg1
  w=w*fz; %si moltiplica per se stesso n volte portandolo alla potenza di n
end
v=log(fz);
u=fx/n;
t=log1p(u);

alg1=w;
alg2=realpow(fz,n);
alg3=exp(n*v);
alg4=exp(n*t);
u=fx/n;
if (1+u == 1)
  t=u;
else
  t=u*(log(1+u)/((1+u)-1));
end
alg5=exp(n*t);
end



