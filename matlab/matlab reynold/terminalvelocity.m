function [v, Re, Cd] = terminalvelocity(n,M,r,rho,m,nu)
% Evaluate terminal velocity of balloon

l = abs(lift(n,M,r,rho,m));
Cd = 0.3;
g = 9.8;
v(1) = sqrt(2*g*l(1)/(Cd*pi*rho(1)*r(1)^2));
[x,y]=size(l);
Re = zeros(1, y);

for i= 2:y
    Re(i) = v(i-1)*(r(i)*2)/nu(i);
    %if Re(i) > 10^6
    %    Cd(i)=0.1;
    %elseif Re(i) < 10^5
    %    Cd(i)=0.5;
    %else
        Cd(i) = 0.72 - (2.57 * 10^-6 * Re(i)) + (4.71 * 10^-12 * Re(i)^2) - (4.04 * 10^-18 * Re(i)^3) + (1.31 * 10^-24 * Re(i)^4);
    %end

    v(i) = sqrt(2*g*l(i)/(Cd(i)*pi*rho(i)*r(i)^2));
end

