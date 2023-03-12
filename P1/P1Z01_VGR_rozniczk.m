function[resAM,resEul] = P1Z01_VGR_rozniczk(a,b,n,y_x0,num_it,varargin)
% Projekt 1, zadanie 01
% Vlada Gromova, 323770
%
% Obliczanie przybliżonych wartości rozwiązań liniowego równania
% różniczkowego rzędu m w węzłach x0,x1,...,xn z przedziału [a,b].
% Liniowe równanie różniczkowe rzędu m dane jest wzorem:
% a_m(x)*y^{m} + ... + a_0(x)*y = b(x)
% Wejście:
%   a        - początek przedziału
%   b        - koniec przedziału
%   n        - liczba kroków
%   y_x0     - wektor rozmiaru m warunków początkowych w punkcie x0 = a
%   num_it   - liczba iteracji dla metody iteracji prostej
%   varargin - współczynniki (funkcje) a_m(x),...,a_0(x),b(x)
% Wyjście:
%   resAM    - wektor przybliżonych wartości rozwiązań w punktach x0,...,xn
%              obliczone za pomocą metody Adamsa-Moultona 2-go rzędu (2)
%   resEul   - wektor przybliżonych wartości rozwiązań w punktach x0,...,xn
%              obliczonych za pomocą zmodyfikowanej metody Eulera (1)

m = size(y_x0,1); % rząd równania 
h = (b-a)/n; % długość kroku
resEul = zeros(1,n+1)';
resAM = zeros(1,n+1)';
resEul(1) = y_x0(1);
resAM(1) = y_x0(1);
Y_pocz = y_x0; % [y y' y" ... y^{m-1}]'
F = zeros(1,m)';
for k = 0:n-1
    % Y(k+1) = Y(k)+h*F(x(k)+h/2,y(k)+(h/2)*F(k)) - (1)
    Y_k = Y_pocz;
    F(1:m-1) = Y_k(2:m); % inicjalizacja F(x,Y) = Y' bez ostatniego wiersza
    F(m) = varargin{m+2}(a+k*h); 
    for i=2:(m+1) % F[m] = (b(x)-a_0(x)*y-...-a_(m-1)(x)*y^{m-1})/a_m(x)
        F(m) = F(m) - (varargin{i}(a+k*h))*Y_k(m-i+2); 
    end
    F(m) = (F(m))/(varargin{1}(a+k*h)); % obliczanie y^{m}(x0+k*h)
    tmp = Y_k + (h/2).*F; % obliczanie drugiego paramtru F we wzorze (1)
    F_tmp = zeros(1,m)';
    F_tmp(1:m-1) = tmp(2:m);
    F_tmp(m) = varargin{m+2}(a+k*h+h/2);
    for i=2:(m+1)
        F_tmp(m) = F_tmp(m) - (varargin{i}(a+k*h+h/2))*tmp(m-i+2);
    end
    F_tmp(m) = (F_tmp(m))/(varargin{1}(a+k*h+h/2)); % obliczanie F w (1)
    Y_pocz = Y_k + h*F_tmp; % obliczanie Y(k+1) zgdonie ze wzorem (1)
    resEul(k+2) = Y_pocz(1);

    % Y(k+1) = Y(k)+(h/2)*(F(x(k+1),Y(k+1)))+(h/2)*F(x(k),Y(k)) - (2)
    F_moul = zeros(1,m)';
    Y_moul = Y_pocz; % pierwsze przyblienie obliczone metodą Eulera
    for it = 1:num_it 
        F_moul(1:m-1) = Y_moul(2:m);
        F_moul(m) = varargin{m+2}(a+k*h+h);
        for i=2:(m+1) % obliczanie F(x(k+1),Y(k+1)) dla wzoru (2)
            F_moul(m) = F_moul(m)-(varargin{i}(a+k*h+h))*Y_moul(m-i+2);
        end
        F_moul(m) = (F_moul(m))/(varargin{1}(a+k*h+h));
        Y_moul = Y_k+(1/2).*h.*F_moul+(1/2).*h.*F; % zgodnie ze wzorem (2)
    end
    resAM(k+2) = Y_moul(1);
end