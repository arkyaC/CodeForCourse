clear all; close all; clc;

init=bvpinit(linspace(1,3,10),[0 0]);
sol=bvp4c(@bvp_rhs,@bvp_bc,init);
x=linspace(1,3,100);
discreteSol=deval(sol,x);

plot(x,discreteSol(1,:));