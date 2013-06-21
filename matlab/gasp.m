function p = gasp(n,r,T)
% Evaluate gas pressure in balloon

R = 8.3144621; % gas constant
p = n*R*T./(4*pi*r.^3);

