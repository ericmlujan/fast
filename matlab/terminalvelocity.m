function v = terminalvelocity(n,M,r,rho,m)
% Evaluate terminal velocity of balloon

l = lift(n,M,r,rho,m);
Cd = 0.47; %sphere
g = 9.8;
v = real(sqrt(2*g*l./(Cd*pi*rho.*r.^2)));

