%script per esercizio di verifica del foglio 7
clear all
flag = 2; %indice della funzione
fun_plot(flag)
for j=2:1:11 %esponente di 10^-n per la tolleranza TOL
    fprintf("\ntol = 10^-%d\n",j);
    disp("metodo di Newton");
    main_stangmet(flag,0.8,10^-j,1,0);
    disp("metodo delle secanti");
    main_ssecmet(flag,0.5,1.3,10^-j,1,0);
end %gli estremi inseriti sono suggeriti per la funzione 2

%il metodo di newton fa meno iterazioni (fino a 40 essendo il massimo
%fissato) ma porta ad un risultato meno preciso