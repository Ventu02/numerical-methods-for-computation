function y=polfun4(x)
%
%valutazione del polinomio
%p(x)=prod(x-j) j=-1.25 -0.75 -0.25 0.25 0.75 1.25
%
%j=-1.25:0.5:1.25;
j=[5/4, 3/4, 1/4, -1/4, -3/4, -5/4];
m=length(x);
for i=1:m
  y(i)=prod(x(i)-j);
end
