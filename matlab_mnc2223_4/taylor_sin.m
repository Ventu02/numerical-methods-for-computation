%Es.f
%*********************************************************************
% Analisi del comportamento dell'Approsimazione di Taylor della funzione sin(x)
% al variare del grado n partendo da un X0 e col grafico in [0,3*pi].
% Quello studiato è l'errore analitico, errore generato dall'approssimazione di una
% funzione non razionale con una razionale.
% input:
% n  --> grado >= 0
% x0 --> valore in [0,3pi]
%*********************************************************************
function taylor_sin(n,x0)

% -- Calcolo funzione e disegno di sin(x) --
a=0; %estremo sinistro intervallo
b=3*pi; %estremo destro intervallo
m=100; %numero di punti per discretizzazione
x=linspace(a,b,m); %vettore di punti equispaziati
ys=sin(x); % valutazione della funzione sin(x)
x0=0; %punto intorno a cui si sviluppa la serie di Taylor

% -- Grafico della funzione sin(x) --
figure(1)
title('Sviluppo di Taylor di sin(x)')
hold on
wmin=-2.5; %limite inferiore dell'asse y
wmax=2.5; %limite superiore dell'asse y
axis([a,b,wmin,wmax]); %imposta i limiti
plot(x,ys,'r-'); %GRAFICO della funzione seno in rosso

% -- Sviluppo di Taylor di sin(x) --
sinx0=sin(x0); %sin nel punto x0
cosx0=cos(x0); %cos nel punto x0
sc=[sinx0,cosx0,-sinx0,-cosx0]; %vettore che contiene tutte le derivate di sin(x0) in loop

% -- Calcolo coefficienti serie di Taylor --
c=zeros(1,n+1); %vettore dei coefficienti della serie di Taylor
c(1)=sc(1); %termine noto (grado 0)
for i=1:n
  j=mod(i,4)+1; %mod da il resto di una divisione, per cui se il grado è 8, la derivata 8ava è data da sen(x) sc(0+1)
  c(i+1)=sc(j)/factorial(i); %coefficiente normalizzato per il fattoriale del grado
end

% -- Valutazione e disegno dello sviluppo polinomiale --
xx=x-x0; %% variabile centrata in x0
c=fliplr(c); %capovolge c perché polyval usa coefficienti ordinati dal grado massimo al minimo
yp=polyval(c,xx); %valutazione polinomio nei punti x
plot(x,yp,'b-'); %GRAFICO dello sviluppo di taylor della funzione in blu
legend({'sin(x)','Sviluppo di Taylor'},'Interpreter','none');

% -- Calcolo errore analitico in intorno di x0 --
my_eps=0.5; %ampiezza dell'intorno
ex=linspace(x0-my_eps,x0+my_eps,m); %cioè l'intorno di x0 con h = my_eps
eysin=sin(ex); %valori esatti sin(x) nell'intorno
exx=ex-x0; %differenza tra punto calcolato e punto effettivo
eypol=polyval(c,exx);  %valutazione polinomio nell'intorno
plot([x0-my_eps,x0+my_eps],[sinx0,sinx0],'g-','LineWidth',1.5); %evidenzio in verde la zona dove è studiato l'errore

% -- Calcolo e grafico errore assoluto --
abserr=max(abs(eysin-eypol)); %calcolo errore assoluto massimo nell'intorno
fprintf('Errore Assoluto in un intorno di x0: %e\n',abserr);
figure(2)
hold on
title("Errore assoluto")
plot(ex,abs(eysin-eypol),'LineWidth',1.5); % grafico errore assoluto
legend({'Errore assoluto'});

% L'errore aumenta esponenzialmente allontanandosi dal punto x0