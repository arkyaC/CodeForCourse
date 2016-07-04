%Gauss Siedel modification done
close all;clc;
xt=0;yt=0;zt=0;
tol=10^(-4);
for i=1:20
    x=(7+yt-zt)/4;
    y=(21+4*x+zt)/8;
    z=(15-y+2*x)/5;
    if (abs(x-xt)<tol)&&(abs(y-yt)<tol)&&(abs(z-zt)<tol)
        break
    end
    xt=x;yt=y;zt=z;
end
xt
yt
zt