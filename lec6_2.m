clear all; close all; clc;

beta=99;
init=bvpinit(linspace(-1,1,50),@l6_2_init,beta);
sol=bvp4c(@l6_2_rhs,@l6_2_bc,init);
x=linspace(-1,1,100);
discreteSol=deval(sol,x);

plot(x,discreteSol(1,:));