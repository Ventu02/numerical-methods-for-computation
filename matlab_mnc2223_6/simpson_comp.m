function I=simpson_comp(fun,a,b,n,fp)
%Es. a
%****************************************************************************
% Approssima l'integrale definito di una funzione mediante la formula di
% simpson composta;
% L'integrale definito di una funzione su [a,b] viene approssimato suddividendo
% l'intervallo in 2n sottointervalli uguali e usando polinomi quadratici a tratti.
% INPUT:
% fun  --> stringa contenente il nome del file in cui e'
%         presente la funzione integranda
% a,b  --> estremi di integrazione
% n    --> numero di coppie di sottointervalli
% fp   --> 0 no visualizzazione grafica
%         1 visualizzazione funzione e approssimazione a tratti
% I    <-- approssimazione dell'integrale
% Vengono effettuate 2n+1 valutazioni di funzione
%****************************************************************************

k=2*n; % numero di sottointervalli (deve essere pari per Simpson)
h=(b-a)/k; % calcolo passo h = larghezza sottointervallo
x=linspace(a,b,k+1); % creazione punti valutazione
y=feval(fun,x); % valutazione funzione punti generati
I=h/3*(y(1)+y(k+1)+2*sum(y(3:2:k))+4*sum(y(2:2:k))); % approssimazione integrale con formula di Simpson composta

% -- Grafico della funzione e dell'approssimazione a tratti --
if (fp>0)
     m=21; % numero di punti per ogni sottointervallo per grafico
     figure(2)
     title('Simpson Composto');
     hold on;

    % Grafico funzione integranda
     xv=linspace(a,b,m*n); % punti fitti per curva esatta
     yv=feval(fun,xv); % valori funzione su punti fitti
     plot(xv,yv,'b-');

    % Grafico valutazioni simpson composto
     y=feval(fun,x); % ricalcolo valori su nodi simpson
     plot([a,b],[0,0],'k'); % asse x
     for i=1:2:k+1
      plot([x(i),x(i)],[0,y(i)],'r-'); % linee verticali dai nodi all'asse x in rosso
     end

    % Interpolazione quadratica a tratti usando lagrval2
     t=linspace(0,1,m); % punti per sottointervallo
     in=1; % indice iniziale
     for i=1:n % per ogni coppia di sottointervalli
        jn=in+m-1; % indice finale segmento
        k2=2*(i-1)+1; % indice nodo iniziale segmento

        xp=x(k2:k2+2); % ascisse nodi segmento
        yp=y(k2:k2+2); % ordinate nodi segmento

        xx(in:jn)=xp(1)+t.*(xp(3)-xp(1)); % punti interpolanti
        yy(in:jn)=lagrval2(yp,xp,xx(in:jn)); % valori interpolati (quadratici)
        in=jn; % aggiornamento indice iniziale per tratto successivo
     end
     plot(x,y,'r+',xx,yy,'g'); % nodi in rosso, interpolante in verde
     legend({'Funzione integranda','Asse x','Valutazioni','Interpolazione quadratica'});
end

end

%****************************************************************************
% Osservazioni:
% La formula di Simpson composta è precisa per polinomi di grado 3.
% L'errore di approssimazione diminuisce come O(h^4), dove h=(b-a)/(2n).
% All'aumentare di n (sottointervalli più piccoli), l'approssimazione migliora 
% fino a limiti numerici.
%****************************************************************************