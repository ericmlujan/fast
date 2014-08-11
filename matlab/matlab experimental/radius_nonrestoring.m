function r = radius_nonrestoring(n,p,T)
% Determine balloon radius assuming membrane pressure is negligible

R = 8.3144621; % gas constant
r = ((3*n.*T.*R)./(pi*p.*4)).^(1/3);
