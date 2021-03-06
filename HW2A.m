close all; clc;
xspan=(-4:0.1:4);
deltax=0.1;
n=length(xspan)-2;
A=zeros(n);
for i=1:n
    if i==1
        A(i,i)=(xspan(i+1))^2 + 2/(3*(deltax^2));
        A(i,i+1)= - 2/(3*(deltax^2));
    elseif i==n
        A(i,i)=(xspan(i+1))^2 + 2/(3*(deltax^2));
        A(i,i-1)= - 2/(3*(deltax^2));
    else
        A(i,i)=(xspan(i+1))^2 + 2/(deltax^2);
        A(i,i-1)= - 1/(deltax^2);
        A(i,i+1)= - 1/(deltax^2);
    end
end
eigs(A,n-2)