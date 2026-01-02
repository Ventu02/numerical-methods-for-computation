% Es. a
%****************************************************************************
%Risolve un sistema lineare Ax=b con metodo diretto
%A --> matrice quadrata
%b --> vettore di termini noti
%
% Questo script risolve un sistema lineare Ax=b usando due approcci:
% 1. Operatore left division (\) di MATLAB
% 2. Fattorizzazione LU con sostituzione in avanti e all'indietro
%
% La fattorizzazione LU scompone A = LU dove:
% - L è una matrice triangolare inferiore con diagonale unitaria
% - U è una matrice triangolare superiore
% - P è una matrice di permutazione per il pivoting parziale
%
% Il pivoting parziale (scambio di righe con elemento massimo sulla diagonale)
% è essenziale per controllare l'errore di arrotondamento durante l'eliminazione
% gaussiana, evitando divisioni per elementi troppo piccoli.
% La risoluzione procede poi in due fasi:
% 1. Ly = Pb (sostituzione in avanti)
% 2. Ux = y (sostituzione all'indietro)
%****************************************************************************

% Genera una matrice test 3*3 non singolare (determinante diverso da 0)
A=mat_2(3);
[n,m] = size(A);

if (n==m) % Se A è quadrata (stesso numero di righe e colonne)
    
    %si definisce un vettore xx soluzione
    xx=ones(n,1); % vettore colonna [1,1,1]

    %si determina il vettore dei termini noti
    %determino b affichè A\x = b,  con x =[1,1,1] cioè bi,1= sum(Ai,j)
    %b = ones(n,1);
    %for(i=1:n)
        %b(i,1)= sum(A(i,:));
    %end

    % b = A*xx per avere soluzione nota (Ax = b con x noto)
    b = A*xx; % Calcolo dei termini noti coerenti con xx

    A % Stampa matrice A
    b % Stampa vettore b
  
    % -- Metodo 1: si risolve il sistema lineare utilizzando l'operatore left division --
    xld=A\b;
    xld; % Stampa della soluzione

    % -- Metodo 2: si fattorizza con pivoting parziale la matrice A usando la function Matlab lu() --
    % Calcola L, U, P tali che P*A = L*U dove P è una matrice di permutazione
    [L, U, P] = lu(A);

    % -- Risoluzione in due passi: Ly = P*b (sostituzione in avanti) e Ux = y (sostituzione all'indietro) --
    y=lsolve(L,P*b);
    x=usolve(U,y);

    x; % Stampa della soluzione ottenuta con LU
end