function main_fzero(k,x0,tol,ftrace,img)
% Es. e
%**************************************************************************
% Confronto tra implementazione personalizzata del metodo di Newton
% e la funzione built-in fzero di MATLAB per trovare zeri di funzioni.
%
% Il metodo di Newton (implementato in stangmet) trova la radice di una funzione
% usando la formula iterativa: x_{k+1} = x_k - f(x_k)/f'(x_k)
% La funzione fzero di MATLAB usa una combinazione di algoritmi (bisezione, 
% interpolazione e metodo delle secanti) per trovare gli zeri in modo
% robusto (anche in presenza di derivate nulle ad esempio).
%
% INPUT
% k      --> indice della funzione da testare (1-18)
% x0     --> iterato iniziale
% tol    --> tolleranza richiesta
% ftrace --> 1 stampa successione iterati, 0 no
% img    --> 1 mostra i grafici, 0 no
%**************************************************************************

% Scelta della funzione e della sua derivata
if(k<=9)
  funstr=['zfunf0',num2str(k,'%d')];
  funpstr=['zfunp0',num2str(k,'%d')];
else
  funstr=['zfunf',num2str(k,'%d')];
  funpstr=['zfunp',num2str(k,'%d')];
end
fun=str2func(funstr); %f(x)
funp=str2func(funpstr); %f'(x)

% Intervallo di definizione delle funzioni
ab=fun();
xa=ab(1);
xb=ab(2);

% Applico il metodo di Newton per trovare lo zero della funzione
[xstar,n,xs]=stangmet(fun,funp,x0,tol,ftrace);

% -- Grafico della funzione e degli zeri trovati --
if(img==1)
    figure;
    fplot(fun,[xa xb]); % Disegna la funzione nell'intervallo [xa, xb]
    hold on
    plot([xa,xb],[0,0],'r-'); % Asse x in rosso
    fx0=feval(fun,x0); % Valore della funzione nel punto iniziale
    plot(x0,0,'r+'); % Punto iniziale x0
    plot(x0,fx0,'ro'); % Valore iniziale f(x0)
    plot(xstar,0,'g+'); % Zero trovato
    axis([xa,xb,-4,4]);
    title('Confronto Newton e fzero: ricerca dello zero');
    legend({'Funzione','Asse x','x_0','f(x_0)','Zero trovato'});
end

% -- Stampa opzionale degli iterati --
if (ftrace>0)
 for i=1:n
  fprintf('%d: %20.15e\n',i,xs(i));
 end
end

% -- Stampa risultato finale --
fprintf('zero: %20.15e\n',xstar);
fprintf('numero iterazioni effettuate: %d\n',n);

% -- Chiama fzero per confrontare i risultati --
disp("------------------------");
[x fval exitflag output] = fzero(fun,x0,options);

end