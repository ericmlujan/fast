function [v, Re, Cd] = terminalvelocity(n,M,r,rho,m,nu)
% Evaluate terminal velocity of balloon

l = abs(lift(n,M,r,rho,m));
Cd = 0.41;
v(1) = sqrt(2.*l(1)./(Cd*pi*rho(1)*r(1)^2.));
[x,y]=size(l);
Re = zeros(1, y);

for i= 2:y
    Re(i) = (v(i-1)*(r(i)*2.))./nu(i);
    
    % CONNER 2010
    %if Re(i) > 10^6
    %    Cd(i)=0.1;
    %elseif Re(i) < 10^5
    %    Cd(i)=0.5;
    %else
        Cd(i) = 0.72 - (2.57 * 10^-6 * Re(i)) + (4.71 * 10^-12 * Re(i)^2) - (4.04 * 10^-18 * Re(i)^3) + (1.31 * 10^-24 * Re(i)^4);
    %end

    %Morrison AN INTRODUCTION TO FLUID MECHANICS
    %Cd(i) = (24/Re(i))+((2.6*(Re(i)/5.0))/(1+(Re(i)/5.0)^1.52))+((0.411*(Re(i)/263000)^-7.94)/(1+(Re(i)/263000)^-8.00))+((Re(i)^0.8)/461000);
    v(i) = sqrt(2*l(i)*9.8/(Cd(i)*pi*rho(i)*r(i)^2));
end

