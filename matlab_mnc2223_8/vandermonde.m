function bs=vandermonde(g,qx)
% calcola la base canonica in un punto qx;
% se qx e' un vettore torna una matrice; in ogni riga ci sono
% i valori delle funzioni base in un punto.
% g  --> grado del polinomio
% qx --> vettore punti su cui costruire la base
% bs <-- matrice di vandermonde

m=length(qx);
n=g+1;
bs=zeros(m,n);
for k=1:m
 bs(k,1)=1;
 for i=1:g
     bs(k,i+1)=bs(k,i)*qx(k);
  end
end

