%Es.b
%*************************************************
%Esempio per sperimentare i numeri finiti 
%'gradual underflow' dello standard ANSI/IEEE (quando l'esponente di un
% numero diventa più piccolo del minimo consentito dal formato, p < λ)
%gestisce sia il caso BASIC single che BASIC double
%flag=0 per BASIC single
%flag=1 per BASIC double
%*************************************************

%cambiare il flag
flag=0;

%caso single
%F(2,24,-126,127) [base, bit di precisione, esponente minimo, esponente massimo]
if (flag==0)
  n=0; %contatore iterazioni
  x=single(1.0); %parte da 1
  while (x+1>1) %X+1>1 definizione operativa di u
    x=x/2; %riduzione esponenziale di x
    n=n+1; %numero di iterazioni
    fprintf('(2 raised to the power -%d) =  %22.15e \n',n,x);
  end
end

%caso double
%F(2,53,-1022,1023) [base, bit di precisione, esponente minimo, esponente massimo]
if (flag==1)
  n=0; %contatore iterazioni
  x=1.0; %parte da 1
  while (x+1>1) %prima era x > 0
    x=x/2; %riduzione esponenziale di x
    n=n+1; %numero di iterazioni
    fprintf('(2 raised to the power -%d) =  %22.15e \n',n,x);
  end
end

%*************************************************
%Se cambio i cicli while in x>0 ho gradual underflow (inclusione dei numeri denormalizzati)
%rispetto a x+1>1 che mi da il risultato senza gradual underflow
%*************************************************