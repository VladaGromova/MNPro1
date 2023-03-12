function[] = test4()
% Projekt 1, zadanie 01, test 4
% Vlada Gromova, 323770

text = "Sprawdzanie niestabilności metody Eulera.\n" + ...
    "Rozwiązanie numeryczne może być bardzo duże w przypadku równań," + ...
    " w których dokładne rozwiązanie nie.\n\n";
fprintf(text);

fprintf("Jeśli metoda Eulera zostanie zastosowana do równania " + ...
    "liniowego y' = k*y, to rozwiązanie numeryczne jest niestabilne," + ...
    " jeśli |h*k+1| > 1.\n");
fprintf("Rozważmy równanie: y' = -2.3*y (k = -2.3),  y(0) = 1. " + ...
    "Rozwiązanie: y(x) = exp(-2.3x)\n\n");

fprintf("h = 1. |k*h + 1| = 1.3 > 1. \n");
[~,resEul] = P1Z01_VGR_rozniczk(0,7,7,1,25,@(x) 1,@(x) 2.3,@(x) 0);
fprintf("Numeryczne rozwiązanie: %d \n",resEul(8));
fprintf("Dokładne rozwiązanie: %d \n",exp(-2.3*7));
fprintf("Błąd: %d \n\n",abs(exp(-2.3*7) - resEul(8)));

[~,resEul] = P1Z01_VGR_rozniczk(0,7,10,1,25,@(x) 1,@(x) 2.3,@(x) 0);
fprintf("h = 0.7. |k*h+1| = 0.61 < 1.\n");
fprintf("Numeryczne rozwiązanie: %d \n",resEul(11));
fprintf("Dokładne rozwiązanie: %d \n",exp(-2.3*7));
fprintf("Błąd: %d \n\n",abs(exp(-2.3*7) - resEul(11)));