close all;clc;
L=20;
n=128;
x2=linspace(-L/2,L/2,n+1);
x=x2(1:n);

y=sech(x);
yt=fft(y);
yd1exact=-sech(x).*tanh(x);
k=(2*pi/L)*[0:(n/2-1) (-n/2):-1];
yd1t=1i*(k.*yt);
yd1=ifft(yd1t);

plot(x,y,'k',x,yd1exact,'m',x,yd1,'go');