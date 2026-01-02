function y=decast(c,x,a,b)
% calcola il valore di un polinomio nella base di Bernstein
% def. dai coefficienti c nei punti x mediante l'algoritmo 
% sui coeff.
% c --> coefficienti del polinomio
% x --> vettore dei punti
% y <-- valore del polinomio punti
n=length(c);
g=n-1;
m=length(x);
bma=b-a;
for k=1:m
 w=c;
 d1=(x(k)-a)/bma;
 d2=(b-x(k))/bma;
 for j=1:g
  for i=1:g-j+1
   w(i)=d1.*w(i+1)+d2.*w(i);
  end
 end
 y(k)=w(1);
end

