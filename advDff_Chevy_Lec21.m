close all;clc;clear all;
tspan=0:1:20;
nu=0.001;
L=20;
n=64;

x2=linspace(-L/2,L/2,n+1);x=x2(1:n);
y=x;
[X,Y]=meshgrid(x,y);


kx=(2*pi/L)*[0:n/2-1 -n/2:-1];kx(1)=10^(-6);ky=kx;
[KX,KY]=meshgrid(kx,ky);
K=KX.^2+KY.^2;
K2=reshape(K,n^2,1);

w=exp(-0.25*(X-2).^2-2*Y.^2) - exp(-0.25*(X+2).^2-2*Y.^2);
pcolor(X,Y,w); shading interp;drawnow;pause(.5);
wt=real(fft2(w));
wt2=reshape(wt,n^2,1);

[t,wt2sol]=ode45('advDiff',tspan,wt2,[],nu,K,K2,n,KX,KY);

for j=1:length(t)
    wsol=real(ifft2(reshape(wt2sol(j,:),n,n)));
    pcolor(X,Y,wsol), shading interp
    drawnow;
    pause(.2)
end