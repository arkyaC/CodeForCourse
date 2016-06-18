clear all; close all; clc;
tol=10^(-4);
xspan = [-1 1];
A=1;
ic=[0 A];
beta=99;
for i=1:5
    dbeta=1;
    for j=1:1000
        [t,y]=ode45('f_rhs',xspan,ic,[],beta); 
        if abs(y(end,1))<tol
            break;
        end
        if y(end,1)*((-1)^(i+1))>0
            beta=beta-dbeta;
        else
            dbeta=dbeta/2;
            beta=beta+dbeta;
        end
    end
    beta
    beta=beta-2;
    norm=trapz(t,y(:,1).*y(:,1));
    plot (t,y(:,1)/sqrt(norm));
    hold on
end

