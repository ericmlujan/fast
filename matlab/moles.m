function n = moles(p,T,r,r0,d0,Jm)
% Determine number of moles of gas in balloon for given radius r

R = 8.3144621; % gas constant

pin = p+gent(r,r0,d0,Jm);
V = 4/3*pi*r.^3;
n = pin.*V./(R*T);
