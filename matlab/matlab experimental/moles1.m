function n = moles1(p,T,V)
% Determine number of moles of gas in balloon for given radius r

R = 8.3144621; % gas constant

pin = p;
n = pin.*V./(R.*T);
