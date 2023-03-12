a = 1;
b = 2;
N = 30;
n = 10;
c3 = @(x) 1;
c2 = @(x) 0;
c1 = @(x) 1;
f3 = @(x) 0;

g = @(x) sin(x);

i = 1;

x1 = linspace(a,b,n+1);
x2 = linspace(a,b,N*n+1);

Y0 = [ sin(a) ; cos(a) ];

Y1 = P1Z01_VGR_rozniczk(a,b,n,Y0,i,c3,c2,c1,f3);
Y2 = P1Z01_VGR_rozniczk(a,b,N*n,Y0,i,c3,c2,c1,f3);
y1 = g(x1);
y2 = g(x2);
k2 = (abs(y1'-Y1))./(abs(y2'-Y2))