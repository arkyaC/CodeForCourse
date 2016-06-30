function rhs=l6_2_rhs(x,y,beta)
rhs=[y(2); (beta-100)*y(1)-y(1)^3];