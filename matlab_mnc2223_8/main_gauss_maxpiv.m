% Es. b
%*************************************************************************************
% risolve un sistema lineare utilizzando una fattorizzazione LU con pivoting
% massimo (durante il processo di Gauss viene eseguito un pivoting per scambiare righe)
% Questo script implementa l'eliminazione gaussiana con pivoting massimo.
% Durante ogni passo della fattorizzazione, viene selezionato come pivot
% l'elemento di modulo massimo nella sottomatrice restante.
% 
% La matrice A viene decomposta come PA = LU dove:
% - P è una matrice di permutazione (scambio di righe)
% - L è una matrice triangolare inferiore
% - U è una matrice triangolare superiore
%
% Il pivoting massimo migliora notevolmente la stabilità numerica
% controllando la crescita degli errori di arrotondamento.
%*************************************************************************************

% Genera una matrice test 3*3 non singolare (determinante diverso da 0)
A=mat_2(3);
[n,m] = size(A);

if (n == m) % Se A è quadrata (stesso numero di righe e colonne)
    %si definisce un vettore x soluzione unitaria nx1
    x=ones(n,1); % vettore colonna [1,1,1]

    % Calcola i termini noti coerenti con x
    b=A*x;

    disp(A); % Stampa della matrice A
    disp(b); % Stampa del vettore b

    % Fattorizzazione LU con pivoting massimo
    [LU,p,sing]=LUmaxpiv(A);
       
    if (sing ~= 1) % Se la matrice non è singolare (=/= 1 non è singolare e quindi fattorizzabile)
      LU; % Stampa della matrice LU combinata

      % Risoluzione del sistema lineare con sostituzione in avanti e all'indietro e permutazioni p
      xx=LUmaxpiv_solve(LU,b,p); 
      xx; % Stampa della soluzione
    else
      disp('matrice non fattorizzabile');
    end

end