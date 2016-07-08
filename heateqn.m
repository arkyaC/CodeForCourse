function rhs=heateqn(tspan,u,dummy,A,delta)
rhs=1/(delta^2)*A*u;