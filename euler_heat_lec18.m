clear all;close all;clc;
%init variables
L=20;n=200;
T=4;
x2=linspace(-L/2,L/2,n+1);
x=x2(1:n);
dx=x(2)-x(1);
dt=.05;
t=0:dt:T;
%compute clf
cfl=dt/dx;
%init condition
u0=exp(-x.^2).';
sol(:,1)=u0;
%second order accurate x derivative matrix
e1=ones(n,1);
A=spdiags([e1 -2*e1 e1],[-1 0 1],n,n);
A(n,1)=1; A(1,n)=1;

%iteration scheme (euler)
for j=1:length(t)-1
    temp=(A*u0);
    u0=u0+(cfl)*temp;
    plot(x,u0);hold on
    pause(0.1);
    sol(:,j+1)=u0;
end

%plot
waterfall(x,t,sol.');
colormap([0 0 0]);