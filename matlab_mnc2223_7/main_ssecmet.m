function main_ssecmet(k,x0,x1,tol,ftrace,img)
% Es. b
%*****************************************************************************
% questa funzione chiama ssecmet per il metodo delle secanti
% e visualizza graficamente la funzione di cui si cercano gli zeri
%
% Il metodo è un'alternativa al metodo di Newton quando non è possibile
% o conveniente calcolare la derivata f'(x). La formula di iterazione è:
% x_{k+1} = x_k - f(x_k)*(x_k-x_{k-1})/(f(x_k)-f(x_{k-1}))
%
% VANTAGGI delle secanti: Non richiede il calcolo di f'(x), meno costoso di Newton
% SVANTAGGI: Richiede due punti iniziali x0 e x1, meno stabile di Newton
%
% INPUT
% k     --> indice della funzione
% x0,x1 --> iterati iniziali
% tol   --> tolleranza richiesta
% ftrace --> 1 stampa successione iterati, 0 no
% img --> 1 mostra i grafici, 0 no
%*****************************************************************************

% Selezione della funzione f(x)
if(k<=9)
  funstr=['zfunf0',num2str(k,'%d')];
else
  funstr=['zfunf',num2str(k,'%d')];
end
fun=str2func(funstr); %funzione f(x)

% Intervallo di definizione delle funzioni
ab=fun();
xa=ab(1);
xb=ab(2);

% -- Chiamata al metodo delle secanti --
[xstar,n,xs]=ssecmet(fun,x0,x1,tol,ftrace);

% -- Visualizzazione grafica della funzione e delle iterazioni --
if img==1
id=figure;
fplot(fun,[xa xb]); %funzione f(x)
hold on
plot([xa,xb],[0,0],'r-'); %asse x in rosso

fx0=feval(fun,x0); % calcolo f(x0)
plot(x0,0,'r+'); %punto iniziale x0
plot(x0,fx0,'ro'); % Punto (x0, f(x0))

fx1=feval(fun,x1); % calcolo f(x1)
plot(x1,0,'b+'); % Punto iniziale x1
plot(x1,fx1,'bo'); % Punto (x1, f(x1))

%[xstar,n,xs]=ssecmet(fun,x0,x1,tol,ftrace);
plot(xstar,0,'g+'); % Zero trovato
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


%*****************************************************************
% Dei buoni iterati si trovano nell'intervallo di convergenza attorno
% allo zero x* della funzione f(x).
%*****************************************************************