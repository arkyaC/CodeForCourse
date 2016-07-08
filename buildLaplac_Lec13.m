close all; clc;
m=5;
n=m*m;

e1=ones(n,1);
e0=zeros(n,1);

e2=e1;
e3=e0;
for j=1:m
    e2(m*j)=0;
    e3(1+(j-1)*m)=1;
end
e4=e3;
e5=e2;
for j=n:-1:2
    e5(j,1)=e5(j-1,1);
end
for j=n:-1:m
    e4(j,1)=e4(j-m+1,1);
end

A=spdiags([e1 e1 e3 e2 -4*e1 e5 e4 e1 e1],[-(n-m) -m -(m-1) -1 0 1 (m-1) m n-m],n,n);

det(A)
condest(A)
spy(A);