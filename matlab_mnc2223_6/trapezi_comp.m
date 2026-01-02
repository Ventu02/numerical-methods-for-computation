function I=trapezi_comp(fun,a,b,n,fp)
% Es. a
%****************************************************************************
% Approssima l'integrale definito di una funzione mediante la formula dei
% trapezi composta;
% L'integrale definito di una funzione su [a,b] viene approssimato suddividendo
% l'intervallo in n sottointervalli uguali e usando polinomi lineari a tratti.
% INPUT:
% fun --> stringa contenente il nome del file in cui e'
%         presente la funzione integranda
% a,b --> estremi di integrazione
% n   --> numero di sottointervalli
% fp  --> 0 no visualizzazione grafica
%         1 visualizzazione funzione e interpolazione a tratti
% I   <-- approssimazione dell'integrale
% Vengono effettuate n+1 valutazioni di funzione
%****************************************************************************

h=(b-a)/n; % calcolo passo h = larghezza sottointervallo
x=linspace(a,b,n+1); % creazione punti valutazione
y=feval(fun,x); % valutazione funzione nei punti generati
I=h*(0.5*(y(1)+y(n+1))+sum(y(2:n))); % approssimazione integrale con formula dei trapezi composta

% -- Grafico della funzione e dell'approssimazione a tratti --
if (fp>0)
     figure(1)
     title('Trapezi Composto');
     hold on;

    % Grafico funzione integranda
     xv=linspace(a,b,200); % punti fitti per curva esatta
     yv=feval(fun,xv); % valori funzione su punti fitti
     plot(xv,yv,'b-');

    % Grafico valutazioni trapezi composta
     y=feval(fun,x); % ricalcolo valori su nodi trapezi
     plot(x,y,'r-+'); % poligonale dei trapezi in rosso
     plot([a,b],[0,0],'k');

    % Interpolazione lineare
     for i=1:n+1 % per ogni nodo
      plot([x(i),x(i)],[0,y(i)],'r-'); % linea verticale dal nodo all'asse x in rosso
     end

     legend({'Funzione integranda','Valutazioni trapezi composta','Asse x'});
end

end

%****************************************************************************
% Osservazioni:
% La formula dei trapezi composta è precisa per polinomi di grado 1.
% L'errore di approssimazione diminuisce come O(h^2), dove h=(b-a)/n.
% All'aumentare di n (sottointervalli più piccoli), l'approssimazione migliora,
% ma oltre un certo punto l'errore numerico può aumentare.
%****************************************************************************