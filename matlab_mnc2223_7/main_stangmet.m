function main_stangmet(k,x0,tol,ftrace,img)
% Es. b
%*****************************************************************************
% questa funzione chiama stangmet per il metodo di Newton
% o delle tangenti e visualizza graficamente la funzione 
% di cui si cercano gli zeri
%
% Supponiamo f(x) ∈ C²(a,b) (continua con derivata continua).
% Il metodo genera la successione iterativa:
% x_{k+1} = x_k - f(x_k)/f'(x_k) con k≥0 e f'(x_k)≠0
%
% VANTAGGI di Newton: Richiede un solo punto iniziale ed è più performante
% rispetto al metodo delle secanti.
% SVANTAGGI: Richiede il calcolo di f'(x), può fallire se f'(x) è zero o vicino a zero
%
% INPUT
% k   --> indice della funzione
% x0  --> iterato iniziale
% tol --> tolleranza richiesta
% ftrace --> 1 stampa successione iterati, 0 no
% img --> 1 mostra i grafici, 0 no
%*****************************************************************************

% Selezione della funzione f(x) e della sua derivata f'(x)
if(k<=9)
  funstr=['zfunf0',num2str(k,'%d')];
  funpstr=['zfunp0',num2str(k,'%d')];
else
  funstr=['zfunf',num2str(k,'%d')];
  funpstr=['zfunp',num2str(k,'%d')];
end
fun=str2func(funstr); %funzione f(x)
funp=str2func(funpstr); %funzione f'(x)

% Intervallo di definizione delle funzioni
ab=fun();
xa=ab(1);
xb=ab(2);

% -- Chiamata al metodo di Newton --
[xstar,n,xs]=stangmet(fun,funp,x0,tol,ftrace);

% -- Visualizzazione grafica della funzione e delle iterazioni --
if(img==1)
    figure;
    fplot(fun,[xa xb]); %funzione f(x)
    hold on
    plot([xa,xb],[0,0],'r-'); %asse x in rosso

    fx0=feval(fun,x0); % calcolo f(x0)
    plot(x0,0,'r+'); %iterato iniziale 
    plot(x0,fx0,'ro'); % Punto (x0, f(x0))
    plot(xstar,0,'g+'); %zero trovato x*

    axis([xa,xb,-4,4]);
    title('Metodo di Newton (tangenti): ricerca dello zero della funzione');
    legend({'Funzione','Asse x','Iterato iniziale','f(x_0)','Zero trovato'});
end

% -- Stampa della successione iterata --
if (ftrace>0)
 for i=1:n
  fprintf('%d: %20.15e\n',i,xs(i));
 end
end

% -- Stampa risultato finale --
fprintf('zero: %20.15e\n',xstar);
fprintf('numero iterazioni effettuate: %d\n',n);

end

%*****************************************************************
% Dei buoni iterati si trovano nell'intervallo di convergenza attorno
% allo zero x* della funzione f(x).
%*****************************************************************