clear;
clc;
clf;
syms x;
% minimos cuadrados para funcion cuadratica
[A]=xlsread('datos.xls');
X=A(:,1);
Y=A(:,2);

a=length(X);
% variables de/da=0
sumyxcuad=0;        %sumatoria yx^2
sumxfour=0;    %sumatoria x^4

sumxcuad=0;         %sumatoria x^2
sumxtri=0;         %sumatoria x^3

%variables para de/db=0
sumxy=0;
sumx=0;

%variables para de/dc=0
sumy=0;


for i=1:a
sumyxcuad=sumyxcuad+Y(i)*X(i)*X(i);
sumxy=sumxy+X(i)*Y(i);
sumxfour=sumxfour+(X(i))^4;
sumxtri=sumxtri+(X(i))^3;
sumxcuad=sumxcuad+(X(i))^2;
sumx=sumx+X(i);
sumy=sumy+Y(i);


end

C=[sumyxcuad; sumxy; sumy];
matrix=[sumxfour sumxtri sumxcuad; sumxtri sumxcuad sumx; sumxcuad sumx a];
B=inv(matrix);
D=B*C;

x=[X(1):0.1:X(a)];
P=poly2sym(D)

F=D(1).*x.^2+D(2).*x+D(3);


fprintf('el coeficiente a es:');
disp(D(1));
fprintf('el coeficiente b es:');
disp(D(2));
fprintf('el coeficiente c es:');
disp(D(3));
% terminar 8.1i y hacer 8.2i pagina 


plot(x,F)
hold on
scatter(X,Y)
