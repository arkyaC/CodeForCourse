close all;clc;
L=20;
n=128;
x2=linspace(-L/2,L/2,n+1);
x=x2(1:n);

y=exp(-x.^2);
yt=fftshift(abs(fft(y)));

plot(x,yt)