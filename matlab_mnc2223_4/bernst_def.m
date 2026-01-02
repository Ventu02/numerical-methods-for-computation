function bs=bernst_def(g,x,a,b)
%function bs=bernst_def(g,x,a,b)
% calcola le funzioni base di Bernstein di grado g nei punti x in [a,b];
% se x e' un vettore torna una matrice; in ogni riga ci sono
% i valori delle funzioni base in un punto.
% g --> grado del polinomio
% x --> vettore di punti
% a,b --> intervallo di definizione
% bs <-- matrice delle funzioni di bernstein nei punti

n=g+1; %numero dei coefficienti
c=zeros(1,n);
c(1)=1;
for i=2:n
    for j=i:-1:2
        c(j)=c(j)+c(j-1);
    end
end
%fine del calcolo dei coefficienti binomiali

m=length(x);
bs=zeros(m,n);
for k=1:m
 t=(x(k)-a)/(b-a);
 d1=t;
 d2=1.0-t;
 for i=1:n
    bs(k,i)=c(i)*d2^(g-i+1)*d1^(i-1);
 end


for r=1:n
    figure(r)
    plot(x,bs(:,r));
end
end

