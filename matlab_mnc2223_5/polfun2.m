function y=polfun2(x)
%
%valutazione del polinomio
%p(x)=prod(x-j) j=1:20
%
j=1:20;
m=length(x);
for i=1:m
  y(i)=prod(x(i)-j);
end