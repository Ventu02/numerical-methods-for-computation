function fun_plot(k)
% Es.c
%******************************************
% Rappresenta graficamente l'analisi del punto fisso
% per le funzione test zfunfk; se sono presenti
% le funzioni zfunpk e zfunppk rappresenta
% anche le funzioni g(x) e g'(x)
%
% Il metodo del punto fisso riscrive l'equazione f(x)=0 come x=g(x).
% Per il metodo di Newton, g(x) = x - f(x)/f'(x).
% La convergenza è garantita se |g'(x)| < 1 nell'intorno della soluzione.
%
% Questo script visualizza f(x), x, g(x) e g'(x) per aiutare a:
% 1. Identificare le regioni dove |g'(x)| < 1, dove il metodo convergerà
% 2. Scegliere un punto iniziale x0 appropriato per il metodo di Newton
% 3. Analizzare il comportamento della convergenza
%
% Particolare attenzione va posta ai casi dove f'(x*)=0 (radice multipla o punto
% di tangenza all'asse x), dove il metodo di Newton ha convergenza lineare o cubica.
%******************************************
close all

% Scelta della funzione test
if(k<=9)
  funstr=['zfunf0',num2str(k,'%d')];
  funpstr=['zfunp0',num2str(k,'%d')];
  funppstr=['zfunpp0',num2str(k,'%d')];
else
  funstr=['zfunf',num2str(k,'%d')];
  funpstr=['zfunp',num2str(k,'%d')];
  funppstr=['zfunpp',num2str(k,'%d')];
end

% Funzione test
fun=str2func(funstr);
info=functions(fun);

% Derivata prima funzione test
funp=str2func(funpstr);
infop=functions(funp);

% Derivata seconda funzione test
funpp=str2func(funppstr);
infopp=functions(funpp);

% Funzione y=x
fx=str2func('funx');

if(length(info.file)~=0)
% Intervallo di definizione della funzione test
 ab=fun(); % Estrae l'intervallo [xa,xb]
 xa=ab(1); % Estremo sinistro
 xb=ab(2); % Estremo destro

 n=400; % Numero di punti nel grafico
 x=linspace(xa,xb,n); % Vettore di ascisse

 % Se esistono anche f'(x) e f''(x), calcola g(x) e g'(x)
 if(length(infop.file)~=0 & length(infopp.file)~=0)
   for i=1:n
     f(i)=feval(fx,x(i)); %funzione y=x
     y(i)=feval(fun,x(i)); %funzione f(x)
     yp(i)=feval(funp,x(i)); %derivata prima f'(x)
     ypp(i)=feval(funpp,x(i)); %derivata seconda f''(x)
     g(i)=x(i)-y(i)/yp(i); %g(x) per il metodo di Newton
     gp(i)=y(i)*ypp(i)/yp(i)^2; %g'(x) per il metodo di Newton
   end

   % -- Visualizzazione grafica --
   figure(1);
   title('plot di f(x), x, g(x) e g''(x)');
   hold on
   plot(x,y,'b-','LineWidth',1.5); %grafico della funzione in blu
   plot(x,f,'k-','LineWidth',1.5); %grafico di y=x in nero
   plot(x,g,'r-','LineWidth',1.5); %g(x): funzione di iterazione del metodo di Newton in rosso
   plot(x,gp,'g-','LineWidth',1.5); %g'(x) in verde

   axis([xa,xb,-3.5,3.5]); % limiti degli assi
   plot([xa,xb],[-1,-1],'c--','LineWidth',1.5); %soglia -1
   plot([xa,xb],[0,0],'k--','LineWidth',1.5); %asse x
   plot([xa,xb],[1,1],'m--','LineWidth',1.5); %soglia +1
   legend({'f(x)','y=x','g(x) [Newt.]','g''(x)','-1','0','+1'});
 
  else
  % Se mancano le derivate, mostra solo f(x)
   for i=1:n
    y(i)=feval(fun,x(i)); %funzione f(x)
   end
   figure(1);
   title('plot di f(x)');
   hold on
   plot(x,y,'b-','LineWidth',1.5); %grafico della funzione in blu
   plot([xa,xb],[0,0],'k--','LineWidth',1.5); %asse x
   legend({'f(x)','0'});
 end

else
 % Stampa errore se non esiste nessuna funzione test
 fprintf('Errore: la funzione test %s non esiste\n',funstr);
end

end