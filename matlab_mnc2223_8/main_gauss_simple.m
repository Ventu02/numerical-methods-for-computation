% Es. b
%*************************************************************************************
% Risoluzione di un sistema lineare usando la fattorizzazione di Gauss (o LU)
% Questo script implementa l'eliminazione gaussiana senza pivoting (scambio di righe).
% La matrice A viene decomposta come A = LU dove:
% - L è una matrice triangolare inferiore
% - U è una matrice triangolare superiore
% 
% L'assenza di pivoting rende il metodo più efficiente ma meno stabile numericamente.
%*************************************************************************************

% Genera una matrice test 3*3 non singolare (determinante diverso da 0)
A=mat_2(3);
[n,m] = size(A);

if (n == m) % Se A è quadrata (stesso numero di righe e colonne)
    %si definisce un vettore x soluzione unitaria nx1
    x=ones(n,1); % vettore colonna [1,1,1]

    % Calcola i termini noti coerenti con x
    b=A*x;

    disp(A) % Stampa della matrice A
    disp(b) % Stampa del vettore b

    % Fattorizzazione LU senza pivoting
    [LU,sing]=LUsimple(A);
       
    if (sing ~= 1) % Se la matrice non è singolare (=/= 1 non è singolare e quindi fattorizzabile)
      LU; % Stampa della matrice LU combinata

      % Risoluzione del sistema lineare con sostituzione in avanti e all'indietro senza permutazioni
      xx=LUsimple_solve(LU,b);
      xx; % Stampa della soluzione
    else
      disp('matrice non fattorizzabile');
    end

end
