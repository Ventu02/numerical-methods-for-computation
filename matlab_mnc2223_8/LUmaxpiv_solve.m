function [x]=LUmaxpiv_solve(LU,b,p)
%Input:
%LU : contieme la matrice triangolare inferiore L
%     e la matrice triangolare superiore U
%b : termine noto
%p : scambi di righe effettuati
%Output:
%x : soluzione

n=length(b);
%sostituzioni in avanti
for j=1:n-1
    k=p(j);
    [b(j),b(k)]=swap(b(j),b(k));
    for i=j+1:n
        b(i)=b(i)+LU(i,j)*b(j);
    end
end

%sostituzioni all'indietro
x=zeros(n,1);
for i=n:-1:2
  x(i)=b(i)/LU(i,i);
  for j=1:i-1
    b(j)=b(j)-LU(j,i)*x(i);
  end
end
x(1)=b(1)/LU(1,1);

%*************************************************************************
%* La procedura swap scambia tra loro il valore di due variabili/vettori *
%*************************************************************************
function [a,b]=swap(a,b) 
  temp = a;
  a = b;
  b = temp;
  
