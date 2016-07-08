close all;clc;
lx=20;
ly=20;
nx=100;
ny=100;
delta=lx/nx;
N=nx*ny;
x2=linspace(-lx/2,lx/2,nx+1);
x=x2(1:nx);
y2=linspace(-ly/2,ly/2,ny+1);
y=y2(1:ny);
[X,Y]=meshgrid(x,y);
U=exp(-X.^2-Y.^2);
u=reshape(U,N,1);

%building the laplace matrix
m=nx;
e1=ones(N,1);
e0=zeros(N,1);
e2=e1;
e3=e0;
for j=1:m
    e2(m*j)=0;
    e3(1+(j-1)*m)=1;
end
e4=e3;
e5=e2;
for j=N:-1:2
    e5(j,1)=e5(j-1,1);
end
for j=N:-1:m
    e4(j,1)=e4(j-m+1,1);
end
A=spdiags([e1 e1 e3 e2 -4*e1 e5 e4 e1 e1],[-(N-m) -m -(m-1) -1 0 1 (m-1) m N-m],N,N);

tspan=[0:0.5:10];
[t,y]=ode45('heateqn',tspan,u,[],A,delta);


for i=1:length(t)
    if i==5
        pause(3);
    end
    pcolor(reshape(y(i,:),nx,ny));
    pause(.6);
%     hold on
end
