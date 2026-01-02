function err2_trapezi_comp(funz,a,b,m)
% funz --> stringa contenente il nome del file in cui e'
%          presente la funzione integranda
% a,b  --> estremi di integrazione
% m    --> numero di iterazioni del ciclo
% Viene prodotta la stampa di AbsErr

tol=1.0e-12;
I=quad(funz,a,b,tol);
fprintf('valore I= %22.15e\n',I);

fprintf('n  h                IA                    AbsErr(i - 1)/AbsErr(i)\n');
for i=1:m
    n=2^(i-1);
    h=(b-a)/n;
    IA=trapezi_comp(funz,a,b,n,0);
    AbsErr(i)=abs(I - IA);
    if (i>1)
        fprintf('%d %14.7e %22.15e %14.7e \n',n,h,IA,AbsErr(i-1)/AbsErr(i));
    else
        fprintf('\n');
    end
end