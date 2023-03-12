function[] = test1()
% Projekt 1, zadanie 01, test 1
% Vlada Gromova, 323770

text = "Sprawdzenie rozmiaru zwracanych wektorów. \nFunkcja powinna " + ...
    "zwracać 2 pionowe wektory długości n+1, gdzie n - trzeci" + ...
    " parametr wejściowy odpowiadający liczbie kroków (węzłów).\n\n";
fprintf(text);

n = 150;
[resAM,resEul] = P1Z01_VGR_rozniczk(1,5,n,1,5, @(x) x, @(x) -1, @(x) 0);
fprintf("WEJŚCIE: n = %d\n",n);
am = sprintf('%d ',size(resAM));
eul = sprintf('%d ',size(resEul));
fprintf('WYJŚCIE: size(resAM) = %s \n\t\t size(resEul) = %s \n\n',am,eul);

n = 1000;
[resAM,resEul] = P1Z01_VGR_rozniczk(0,2,n,[1;1],50, @(x) 1, @(x) 0, ...
    @(x) -1, @(x) 0);
fprintf("WEJŚCIE: n = %d\n",n);
am = sprintf('%d ',size(resAM));
eul = sprintf('%d ',size(resEul));
fprintf('WYJŚCIE: size(resAM) = %s \n\t\t size(resEul) = %s \n\n',am,eul);

n = 1;
[resAM, resEul] = P1Z01_VGR_rozniczk(1,5,n,1,5,@(x) x,@(x) -1,@(x) 0);
fprintf("WEJŚCIE: n = %d\n",n);
am = sprintf('%d ',size(resAM));
eul = sprintf('%d ',size(resEul));
fprintf('WYJŚCIE: size(resAM) = %s \n\t\t size(resEul) = %s \n\n',am,eul);

n = 5555;
[resAM,resEul] = P1Z01_VGR_rozniczk(1,3,n,3,5,@(x) 1,@(x) 3*x^2, ...
    @(x) 6*x^2);
fprintf("WEJŚCIE: n = %d\n",n);
am = sprintf('%d ',size(resAM));
eul = sprintf('%d ',size(resEul));
fprintf('WYJŚCIE: size(resAM) = %s \n\t\t size(resEul) = %s \n\n',am,eul);
