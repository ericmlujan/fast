function l = lift(n,M,r,rho,m)
% Evaluate balloon lift

V = 4/3*pi*r.^3;
l = (rho.*V)-(n*M/1000)-m;

