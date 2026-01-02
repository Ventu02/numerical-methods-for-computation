%main_stab_lufact script da completare
%esercizio di verifica scheda 8

%si chiama funzione che definisce una matrice test
%la funzione richiesta dalla traccia è mat_es_7
A=mat_es_7();

%si determina la sua dimensione n
[n,m]=size(A);

%stampa della matrice A
disp(A);

%si definisce il vettore dei termini noti
b=[1 ; 2];

%si fattorizza la matrice A
[LU1,p,sing]=LUmaxpiv(A);

%si risolvono i sistemi piu' semplici usando la function LUmaxpiv_solve
x1=LUmaxpiv_solve(LU1,b,p);

%si stampa la soluzione x1
disp("soluzione trovata con metodo di Gauss con perno massimo");
disp(x1);

%si fattorizzi la matrice A usando la function LUsimple
[LU2,sing] = LUsimple(A);

%si risolva il sistema lineare usando la function LUsimple_solve
x2=LUsimple_solve(LU2,b);

%si stampa la soluzione x2
disp("soluzione trovata con metodo di Gauss semplice");
disp(x2);

%le due soluzioni differiscono poichè 10^-20 viene arrotondato in
%aritmetica finita e c'è dispersione di dati

%utilizzando A=mat_es_5() le due soluzioni coincidono
