%*******************************************************************
%* Fattorizza una matrice in LU con L triangolare inferiore e U    *
%* triangolare superiore usando il metodo di eliminazione di Gauss *
%* con scambio delle righe (pivoting parziale) e perno massimo.    *
%* Utilizza la function swap (vedi sotto).                         *
%* input : A matrice da fattorizzare                               *
%* output: A matrice contenente le informazioni sulla L e la U     *
%*         p vettore degli scambi di riga; p(i) contiene l'indice  *
%*           della riga con cui e' stata scambiata la i-esima riga;*
%*           p(n+1) contiene +1 o -1 a seconda che siano stati     *
%*           necessari un numero pari o dispari di scambi          *
%*         sing (0) la matrice non e' singolare, (1) e' singolare  *
%*******************************************************************
function [A,p,sing]=LUmaxpiv(A)

  [m,n]=size(A);
  sing = 0; %matrice non considerata singolare
  p(n) = 1; %vettore p tiene traccia degli scambi di riga
  k = 1; %contatore
  %pivoting parziale con perno massimo
  while ((~sing) & (k<n)) 
    [val,s] = max(abs(A(k:n,k)));
    s=s+k-1; %indice riga in cui si trova il massimo valore
    p(k) = s;
    %scambio di righe se necessario se il massimo valore non è già sulla
    %diagonale principale
    if(s ~= k)
      p(n) = -p(n);
      [A(s,k:n),A(k,k:n)]=swap(A(s,k:n),A(k,k:n));
    end
    %eliminazione di Gauss
    if(A(k,k) ~= 0.0) %pivot A(k,k) diverso da 0
      A(k+1:n,k)=-A(k+1:n,k)./A(k,k); %aggiorna i coefficienti sotto la diagonale per costruire L
      for j=k+1:n
        if(A(k,j) ~= 0.0)
          for i=k+1:n %aggiorna la matrice U sopra la diagonale
            A(i,j) = A(i,j) + A(i,k) .* A(k,j);
          end
        end
      end
    else
      sing = 1; %controllo singolarità
      return
    end
    k=k+1;
  end
  if(abs(A(n,n)) <= 1.0e-15) %se elemento in basso a destra di U è troppo piccolo la matr. è singolare
    sing = 1;
  end

%*************************************************************************
%* La procedura swap scambia tra loro il valore di due variabili/vettori.*
%*************************************************************************
function [a,b]=swap(a,b) 
  temp = a;
  a = b;
  b = temp;

