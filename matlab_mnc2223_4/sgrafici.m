%x = linspace(0,2*pi,50); %60 rappresenta il numero di punti tra i due numeri
                          %dati in input, più ne metto, più la figura è
                          %linare e precisa
%y = sin(2*x);
%plot(x,y,'m-*')
%hold on %serve per mettere più di un grafico sullo stesso piano
%plot(-x,-y,'r-^')
%hold on
%x=0:0.2:2.*pi;
%y=sin(x);
%yr=randn(size(x));
%plot(x,10.*y+yr,'ro')
%hold on
%plot(x,10.*y)
hold on
x = 0:pi/100:2*pi;
y = sin(x);
y2 = sin(x-.25);
y3 = sin(x-.5);
plot(x,y,x,y2,x,y3)
legend('sin(x)','sin(x-.25)','sin(x-.5)')
% time=[0:0.01:6];
% y=sin(time);
% plot(time,y);
% xlabel('time');
% ylabel('sin(time) ');
% title(' plot of sin(time) ');
% grid on; %aggiunge la griglia

axis tigth; % ridimensiona la finestra alla giusta larghezza
hold off;


% Nel plot:
% il primo carattere vuol dire di colorare in blu
% il - vuol dire collegare i due punti
% il terzo carattere indica cosa scrivere su ogni punto