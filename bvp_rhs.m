function rhs=bvp_rhs(x,y)
rhs=[y(2); 5-3*y(2)-6*y(1)];