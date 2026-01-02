function base_plot(g,a,b)
%Es.g
%*********************************************************************
% Questo script visualizza le funzioni che compongono tre diverse basi
% polinomiali di grado g su un intervallo [a,b] con:
% 1. Base canonica (Vandermonde)
% 2. Polinomio in base di Bernstein
% 3. Base con centro
%
% viene prodotto il grafico di funzioni base polinomiali
% di grado g nell'intervallo [a,b];
% input: g grado della base polinomiale
%        a,b estremi intervallo di definizione
% output: grafico della base polinomiale
%
% Il grafico viene realizzato su una discretizzazione 
% di m punti dell'intervallo [a,b]
%*********************************************************************

close all
m=201; %201 punti equispaziati per discretizzazione
g=1; %grado della base polinomiale
a=-1; %estremo sinistro intervallo
b=1; %estremo destro intervallo
x=linspace(a,b,m); %vettore di m punti equispaziati in [a,b]

% -- Calcolo basi polinomiali --
%powers.m: genera matrice valori per ogni potenza di x (o x-c) [base canonica]
y=powers(g,x);

%bernst.m: genera valori polinomi di Bernstein su [a,b] [base di Bernstein]
y1=bernst(g,x,a,b);

% -- Base con centro --
tipo = 3; %1: centro=a, 2: centro=b, 3: centro medio
switch tipo
    case 1
        c = a;
    case 2
        c = b;
    otherwise 
        c = (a+b)/2;
end
y3=powers(g,x-c); %base canonica traslata di c

% -- Visualizzazione base selezionata
switch tipo
    % base canonica: {1, x, x^2, ..., x^g}, ogni curva rappresenta una potenza diversa di x
    case 1
       image(1)
       plot(x,y)
       title('Base canonica')
    % base di Bernstein: {B_0^g(x), B_1^g(x), ..., B_g^g(x)}, ogni curva rappresenta un polinomio di Bernstein
    case 2
        image(2)
        plot(x,y1)
        title('Base Bernstein')
    % base con centro: {1, (x-c), (x-c)^2, ..., (x-c)^g}, ogni curva rappresenta una potenza diversa di (x-c)
    case 3 
        image(3)
        plot(x,y3)
        title('Base con centro')
end

%powers.m prende in input il grado e un vettore di punti e mi restituisce 
%un vettore di valori associati ad essi, poi vengono visualizzati i grafici 
%di tutti quei valori. (quindi maggiore è il grado che inserisco nella
%funzione, maggiori saranno i grafici visualizzati)