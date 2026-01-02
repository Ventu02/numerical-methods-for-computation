%script che confornta i metodi ssecmet e sstangmet con fzero di matlab

fun_plot(4) %considero gli intervalli in cui |g'(x)|<1 per il teorema della COnvergenza

main_stangmet(4,1.7,10e-20,1,1); %metodo di newton
disp("-------")

fun=str2func("zfunf05");
x0 = [1,2]; % initial interval
%la function fzero richiede che i valori della fuznione abbiano segno
%opposto agli estremi dell'intervallo dato in input
options = optimset('Display','iter'); % show iterations
[x fval exitflag output] = fzero(fun,x0,options)
