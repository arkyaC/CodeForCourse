function rhs=advDiff(t,wt2,dummy,nu,K,K2,n,KX,KY)
wt=reshape(wt2,n,n);
psit=-wt./K;

psix=real(ifft2(1i*KX.*psit));
psiy=real(ifft2(1i*KY.*psit));
wx=real(ifft2(1i*KX.*wt));
wy=real(ifft2(1i*KY.*wt));

A=fft2(wx.*psiy-wy.*psix);
rhs= -nu*K2.*wt2 + reshape(A,n^2,1);