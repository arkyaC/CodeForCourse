clear all; close all; clc;
tol=10^(-4);
xspan=(-4:0.1:4);
A=1;
beta=15;
dbeta=0.1;
ic=[A (sqrt(16-beta))*A];
% [t,y]=ode45('sho',xspan,ic,[],beta);
for i=1:5
    dbeta=0.1;
    for j=1:1000
        [t,y]=ode45('sho',xspan,ic,[],beta);
        if abs(y(end,1)*sqrt(16-beta)+y(end,2))<tol
            beta
            break;
        end
        if (y(end,1)*sqrt(16-beta)+y(end,2))*((-1)^(i+1))>0
            beta=beta-dbeta;
        else
            dbeta=dbeta/2;
            beta=beta+dbeta;
        end
    end
    plot(t,y(:,1)); hold on
    beta = beta-0.1;
end

%y(end,1)*sqrt(16-beta)+y(end,2)