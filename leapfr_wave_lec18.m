close all;clc;
%init variables
L=20;n=200;
T=4;
x2=linspace(-L/2,L/2,n+1);
x=x2(1:n);
dx=x(2)-x(1);
dt=.1;
t=0:dt:T;
%compute clf
cfl=dt/dx;
%init condition
u0=exp(-x.^2).';
u1=exp(-(x+dx).^2).';
sol(:,1)=u0;
sol(:,2)=u1;
%second order accurate x derivative matrix
e1=ones(n,1);
A=spdiags([-e1 e1],[-1 1],n,n);
A(n,1)=1; A(1,n)=-1;

%iteration scheme (euler)
for j=1:length(t)-2
    temp=(A*u1);
    u2=u0+cfl*temp;
    plot(x,u0);
    pause(0.1);
    sol(:,j+2)=u2;
    u0=u1;u1=u2;
end

%plot
waterfall(x,t,sol.');
colormap([0 0 0]);