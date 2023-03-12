function[] = test1Num()
% Projekt 1, zadanie 01, test 1 numeryczny
% Vlada Gromova, 323770

fprintf("Badanie błędu w zależności od liczby iteracji:\n\n")
fprintf("Pierwsze równanie:\n")
[resAM, ~] = P1Z01_VGR_rozniczk(0,1,10,[1;1], 1,@(x) 1, @(x) 0, @(x) -1, @(x) 0);
err1 = abs(exp(1) - resAM(11));
[resAM, ~] = P1Z01_VGR_rozniczk(0,1,10,[1;1], 5,@(x) 1, @(x) 0, @(x) -1, @(x) 0);
err5 = abs(exp(1) - resAM(11));
fprintf("Błąd przy 1 iteracji - błąd przy 5 = %d\n",err1-err5);

[resAM, ~] = P1Z01_VGR_rozniczk(0,1,10,[1;1], 25,@(x) 1, @(x) 0, @(x) -1, @(x) 0);
err25 = abs(exp(1) - resAM(11));
fprintf("Błąd przy 5 iteracjach - błąd przy 25 = %d\n",err5-err25);

[resAM, ~] = P1Z01_VGR_rozniczk(0,1,10,[1;1], 125,@(x) 1, @(x) 0, @(x) -1, @(x) 0);
err125 = abs(exp(1) - resAM(11));
fprintf("Błąd przy 25 iteracjach - błąd przy 125 = %d\n\n",err25-err125);

fprintf("Drugie równanie:\n");
[resAM,~] = P1Z01_VGR_rozniczk(1,2,10,[5;3],1,@(x) x^2, ...
    @(x) -2*x,@(x) 2,@(x) 6);
err1 = abs(9 - resAM(11));

[resAM,~] = P1Z01_VGR_rozniczk(1,2,10,[5;3],5,@(x) x^2, ...
    @(x) -2*x,@(x) 2,@(x) 6);
err5 = abs(9 - resAM(11));
fprintf("Błąd przy 1 iteracji - błąd przy 5 = %d\n",err1-err5);

[resAM,~] = P1Z01_VGR_rozniczk(1,2,10,[5;3],25,@(x) x^2, ...
    @(x) -2*x,@(x) 2,@(x) 6);
err25 = abs(9 - resAM(11));
fprintf("Błąd przy 5 iteracjach - błąd przy 25 = %d\n",err5-err25);

[resAM,~] = P1Z01_VGR_rozniczk(1,2,10,[5;3],125,@(x) x^2, ...
    @(x) -2*x,@(x) 2,@(x) 6);
err125 = abs(9 - resAM(11));
fprintf("Błąd przy 25 iteracjach - błąd przy 125 = %d\n",err25-err125);