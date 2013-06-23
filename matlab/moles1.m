function n = moles1(p,T,r)
% Determine number of moles of gas in balloon for given radius r

R = 8.3144621; % gas constant

pin = p;
V = 4/3*pi*r.^3;
n = pin.*V./(R*T);
