function main_interp()
% Es. e
%*************************************************************************
% Analisi del condizionamento di matrici di interpolazione polinomiale
% Questo script confronta il numero di condizionamento di diverse rappresentazioni matriciali
% utilizzate nell'interpolazione polinomiale:
% 1) Forma canonica (matrice di Vandermonde)
%    - Polinomio espresso come somma di potenze x^k
% 2) Forma di Newton
%    - Polinomio espresso usando le differenze divise
% 3) Forma di Bernstein
%    - Polinomio espresso usando i polinomi di Bernstein
%
% Il numero di condizionamento κ(A) misura la sensibilità dei coefficienti
% del polinomio rispetto a piccole perturbazioni nei dati di interpolazione.
% Un valore basso indica un problema ben condizionato.
%
% La distribuzione dei punti di interpolazione influenza fortemente il condizionamento:
% - Punti equispaziati: portano a matrici mal condizionate, specialmente per gradi elevati
% - Punti di Chebyshev: migliorano notevolmente il condizionamento
%
% input:
% n    : grado del polinomio interpolante
%*************************************************************************

% Intervallo di interpolazione
a=-5;
b=5;

% Ciclo sui gradi del polinomio (5, 10, 15, 20)
for n=5:5:20
    fprintf('Grado: %d\n',n)

    % Scelta sulla distribuzione dei punti di interpolazione
    tipo=2;
    switch tipo
        case 1
            % punti equispaziati
            x=linspace(a,b,n+1);
        case 2
            % punti di Chebyshev
            x=chebyshev(a,b,n);
    end

    % -- Metodo 1: Forma canonica (matrice di Vandermonde) --
    bv=vandermonde(n,x);
    fprintf('cond matrice vandermonde: %e\n',cond(bv))
    % fprintf('cond matrice vandermonde: %e\n',rcond(bv)) darebbe il reciproco del condizionamento

    % -- Metodo 2: Forma di Newton --
    bn=newton(n,x,x);
    fprintf('cond matrice newton: %e\n',cond(bn))
    % fprintf('cond matrice newton: %e\n',rcond(bn))

    % -- Metodo 3: Forma di Bernstein --   
    bb=bernst(n,x,a,b);
    fprintf('cond matrice bernstein: %e\n',cond(bb))
    % fprintf('cond matrice bernstein: %e\n',rcond(bb))
end

%*************************************************************************
% Osservazioni finali
% Vandermonde:
% - Punti equispaziati: condizionamento cresce esponenzialmente con n
% - Punti di Chebyshev: sempre esponenziale ma con tassi di crescita più bassi
% Newton:
% - Punti equispaziati: esponenziale simile a Vandermonde ma leggermente migliore
% - Punti di Chebyshev: riduzione significativa del condizionamento per n piccoli, per n maggiori l'effetto diminuisce
% Bernstein:
% - Punti equispaziati: meglio condizionata rispetto a Vandermonde/Newton
% - Punti di Chebyshev: ancor meglio condizionata ma con effetto meno marcato rispetto alle altre
%*************************************************************************

end