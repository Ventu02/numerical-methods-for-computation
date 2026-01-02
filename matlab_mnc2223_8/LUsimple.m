%*******************************************************************
%* Fattorizza una matrice in LU con L triangolare inferiore e U    *
%* triangolare superiore usando il metodo di eliminazione di Gauss.*
%* input : A matrice quadrata da fattorizzare                      *
%* output: A matrice contenente le informazioni sulla L e la U     *
%*         sing (0) la matrice non e' singolare, (1) e' singolare  *
%*******************************************************************
function [A,sing]=LUsimple(A)

  [m,n]=size(A); % Determina dimensione matrice A
  sing = 0; % Inizializza il flag singolarità a 0 (assume che A non sia singolare)
  k = 1; % Inizializza il contatore per le iterazioni di eliminazione

  %ciclo while per l'eliminazione di Gauss
  while ((~sing) & (k<n))
    if(A(k,k) ~= 0.0) %controlla che il pivot non sia zero
      A(k+1:n,k)=-A(k+1:n,k)./A(k,k); %trasforma ogni elemento sottostante ad akk secondo la formula della matrice L
      for j=k+1:n %aggiornamento matrice U
        if(A(k,j) ~= 0.0)
          for i=k+1:n %itera sulle colonne a destra del pivot
            A(i,j) = A(i,j) + A(i,k) .* A(k,j);
          end
        end
      end
    else
      sing = 1;
      return
    end
    k=k+1; %aggiornamento indice eliminazione
  end

  %verifica finale singolarità
  if(abs(A(n,n)) <= 1.0e-15)
    sing = 1;
  end
