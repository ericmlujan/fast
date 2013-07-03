function n = moles(p,T,r,r0,d0,V)
% Determine number of moles of gas in balloon for given radius r

R = 8.3144621; % gas constant

pin = p+mooneyrivlin(r,r0,d0);
n = pin.*V./(R.*T);