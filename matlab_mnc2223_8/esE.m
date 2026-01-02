for n = 5:5:20
    fprintf("\nn = %d\n", n);
    disp("Punti equispaziati");
    main_interp(n,1);
    disp("Punti di Chebyshev");
    main_interp(n,2);
end

%il condizionamento con punti di cheb rispetto ai punti equisp è molto minore per la matrice di
%vand (in maniera alternata),
% per la matrice di newton è inizialmente minore e poi via via maggiore;
% per la matrice di bern è via via maggiore