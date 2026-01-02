function main_hilb(n)
% Es. d
%*********************************************************
% Questo script calcola ed analizza il condizionamento di una matrice
% Hilbert e la stabilità della soluzione di un sistema lineare.
%
% La matrice di Hilbert H(i,j) = 1/(i+j-1) è simmetrica, definita positiva
% e notoriamente mal condizionata.
%
% Teoria:
% - Il numero di condizionamento κ(A) misura la sensibilità della soluzione
%   x di Ax = b a piccole variazioni di b.
% - Condizionamento sperimentale:
%       κ_exp = ( ||Δx|| / ||x|| ) / ( ||Δb|| / ||b|| )
%   dove Δx = x_perturbata - x_esatta e Δb è la perturbazione su b.
%*********************************************************

% Definizione vettore x
x=ones(n,1);

% Generazione della matrice di Hilbert
H=mat_hilb(n);

% Calcolo del numero di condizionamento teorico
cH=cond(H); 

% Risoluzione del sistema lineare Hx=b
b=H*x; % Calcolo vettore dei termini noti b
y=H\b; % Risoluzione del sistema

% -- Analisi del condizionamento della matrice di Hilbert --
disp('condizionamento della matrice');
for p=1:5
  true = 0; % % Flag per verificare se κ_exp supera κ(H), 0 se Kp<=K, 1 se Kp>k

  db=10^(-p)*rand(n,1); % Perturbazione di b con un vettore casuale

  dy=H\(b+db); % Risoluzione del sistema perturbato
  
  % Calcolo del condizionamento sperimentale
  % κ_exp = (||dy - x|| / ||x||) * (||b|| / ||db||)
  cond_sper=norm(dy-x,1)/norm(x,1)*norm(b,1)/norm(db,1);

  % Verifica della disuguaglianza teorica
  if cond_sper>cH
      true = 1; % la condizione κ_exp ≤ κ(H) non è rispettata
  end

  % -- Stampa dei risultati --
  % - Kp: condizionamento sperimentale
  % - K: condizionamento della matrice di Hilbert
  % - Kp<=K: valore booleano che vale 0 se la condizione è rispettata, 1 se non lo è
  fprintf('p=%2d  Kp=%15.7e    K=%15.7e  Kp<=K? = %d\n',p, cond_sper, cH, true);
end
%il risultato varia notevolmente a piccole variazioni su b

%*********************************************************
% Come previsto dalla teoria:
% - Kp ≤ cond(H) per ogni perturbazione db
% - cond(H) cresce rapidamente con n → Hilbert sempre più mal condizionata
% - Piccole perturbazioni su b possono produrre grandi variazioni in x
%*********************************************************
end