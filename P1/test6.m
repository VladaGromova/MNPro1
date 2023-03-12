function[] = test6()
% Badanie błędu w zależności od liczby iteracji
format shortEng
[resAM, resEul] = P1Z01_VGR_rozniczk(0,1,10,[1;1], 1,@(x) 1, @(x) 0, @(x) -1, @(x) 0);
n1 = abs(exp(1) - resAM(11))
%abs(exp(1) - resEul(11))

[resAM, resEul] = P1Z01_VGR_rozniczk(0,1,10,[1;1], 5,@(x) 1, @(x) 0, @(x) -1, @(x) 0);
n5 = abs(exp(1) - resAM(11))
%abs(exp(1) - resEul(11))
abs(n5-n1)

[resAM, resEul] = P1Z01_VGR_rozniczk(0,1,10,[1;1], 25,@(x) 1, @(x) 0, @(x) -1, @(x) 0);
n25 = abs(exp(1) - resAM(11))

abs(n25-n5)