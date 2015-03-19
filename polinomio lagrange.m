clear;
clc;
clf;
syms x p
[A]=xlsread('datos.xls');
n=length(A);
X=A(:,1);
Y=A(:,2);

P=zeros(n,n);

K(1:n)=0;
for i=1:n
    L=1;
for k=1:n
    if k==i
     L=1*L;   
    else
    L=(x-X(k,1))*L;
    end
end
D=subs(L,x,X(i,1));
K(i)=1/D;

C=sym2poly(Y(i)*K(i)*L);

P(i,:)=C;
end

pol=sum(P);
Eq=poly2sym(pol);
pretty(Eq)
Xmin=X(1);
XMax=X(n);
ezplot(Eq,[Xmin,XMax])

area=eval(int(Eq,X(1),X(n)))


