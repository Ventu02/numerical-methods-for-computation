function bs=bernst(g,x,a,b)
% calcola le funzioni base def in. [a,b] in un punto;
% se x e' un vettore torna una matrice; in ogni riga ci sono
% i valori delle funzioni base in un punto.
% g --> grado del polinomio
% x --> vettore di punti
% a,b --> estremi intervallo di definizione
% bs <-- matrice delle funzioni di bernstein nei punti

m=length(x);
n=g+1;
bma=b-a;
bs=zeros(m,n);
for k=1:m
 l=n;
 bs(k,l)=1.0;
 d1=(x(k)-a)/bma;
 d2=(b-x(k))/bma;
 for i=1:g
   temp=0.0;
   for j=l:n
     bs(k,j-1)=d2.*bs(k,j)+temp;
     temp=d1.*bs(k,j);
   end
   bs(k,n)=temp;
   l=l-1;
  end
end

