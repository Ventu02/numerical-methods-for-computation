function main_stangmet_ordconv(k,x0,tol)
% Es. d
%*****************************************************************************************
% Questo script implementa il metodo di Newton per trovare gli zeri di una funzione
% e analizza l'ordine di convergenza esaminando il comportamento dell'errore.
%
% Si dice che un metodo ha ordine di convergenza p se:
% |e_{k+1}|/|e_k|^p → δ (costante) per k→∞
%
% INPUT
% k   --> indice della funzione
% x0  --> iterato iniziale
% tol --> tolleranza richiesta
% ftrace --> 1 stampa successione iterati, 0 no
%
% Per capire il tipo di convergenza:
% - Se la colonna |ek+1|/|ek| tende a una costante < 1, la convergenza è LINEARE (ordine 1).
% - Se la colonna |ek+1|/|ek|^2 tende a una costante, la convergenza è QUADRATICA (ordine 2).
% - Se la colonna |ek+1|/|ek|^p tende a una costante per p > 1, la convergenza è SUPERLINEARE.
% - Se nessuna colonna si stabilizza o tende a 1, la convergenza è SUBLINEARE.
%*****************************************************************************************

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

% -- Grafico della funzione --
figure;
fplot(fun,[xa xb]); % Disegna la funzione nell'intervallo [xa, xb]
hold on
plot([xa,xb],[0,0],'r-'); % Asse x in rosso
fx0=feval(fun,x0); % Valore della funzione nel punto iniziale
plot(x0,0,'r+'); % Punto iniziale x0 
plot(x0,fx0,'ro'); % Valore iniziale f(x0)

% -- Applicazione metodo di Newton per trovare lo zero della funzione --
[xstar,n,xs]=stangmet(fun,funp,x0,tol,1);
plot(xstar,0,'g+'); % Disegna lo zero trovato in verde
hold on
axis([xa,xb,-4,4]);

% -- Stampa iterati calcolati --
for i=1:n
 fprintf('%d: %20.15e\n',i,xs(i));
end

% -- Stampa il risultato finale --
fprintf('zero: %20.15e\n',xstar);
fprintf('numero iterazioni effettuate: %d\n',n);

% -- Analisi ordine di convergenza --
% xk: iterato corrente
fprintf(" k          xk                    ek                 |ek+1|/|ek|              |ek+1|/|ek|^2           |ek+1|/|ek|^3\n");
for i=1:n-1
    ek = xs(i)-xstar; % Errore corrente
    ek1 = xs(i+1)-xstar; % Errore successivo
    r1 = abs(ek1)/abs(ek); % Convergenza lineare
    r2 = abs(ek1)/(abs(ek))^2; % Convergenza quadratica
    r3 = abs(ek1)/(abs(ek))^3; % Convergenza cubica
    fprintf("%2d %22.15e %22.15e %22.15e %22.15e %22.15e\n", i, xs(i), ek,r1,r2,r3);
end

%********************************************************
% Zero semplice (f'(x*) ≠ 0)  --> convergenza quadratica
% Zero multiplo (f'(x*) = 0)  --> convergenza lineare
% Convergenza cubica se:
%   - f è 3 volte derivabile vicino allo zero
%   - f'(x*) ≠ 0
%   - f''(x*) = 0
%   - f'''(x*) ≠ 0
%********************************************************