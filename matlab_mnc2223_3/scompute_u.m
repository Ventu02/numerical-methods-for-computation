%Es.a
%**************************************************
% In questo esercizio si calcola l'unità di arrotondamento U tramite la 
% definizione operativa "U è il più grande numero finito positivo tale che
% fl(1+U) = 1"
% U = 0.5 * 2^(1-t) [definizione teorica]
% Quando (1 + U) == 1 allora il valore di U rappresenta U [definizione operativa]
%**************************************************

%cambiare il flag
flag=0; %0=single 1=double

if (flag==0)
%******************************************
% calcolo dell'unita' di arrotondamento via
% caratterizzazione o def. operativa per
% BASIC single precision F(2,24,-126,127)
%******************************************
    %stampa di u
    u =2^(-24); %1/2beta^(1-t)
    fprintf('u = 2^(-24) = %20.16e \n',u);

    %calcolo operativo di U
    u=single(1); %parte da 1
    t=0; %contatore esponente
    while(1+u > 1)
        u=u/2; %2 alla -t
        t=t+1; %t = esponente
    end
    %esponente aumenta e u diminuisce 
    
    %stampa del valore trovato
    if (u+1) == 1
        fprintf('Largest Finite and Positive Number u such that u+1==1\n');
        fprintf('%20.16e\n',u);
        fprintf('Exponent -%d\n',t);
    end
end

if (flag==1)
%******************************************
% calcolo dell'unita' di arrotondamento via
% caratterizzazione o def. operativa per 
% BASIC double precision F(2,53,-1022,1023)
%******************************************
    %stampa di u
    u = 2^(-53);
    fprintf('u = 2^(-53) = %20.16e \n',u);  	

    %Calcolo operativo di U
    u=1; %parte da 1
    t=0; %contatore esponente
    while(1+u > 1)
        u=u/2; %2 alla -t
        t=t+1; %t = esponente
    end

    %stampa del valore trovato
    if (u+1) == 1 
        fprintf('Largest Finite and Positive Number u such that u+1==1\n');
        fprintf('%20.16e\n',u);
        fprintf('Exponent -%d\n',t);
    end
end