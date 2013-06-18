function r = radius_nonrestoring(n,p,T,r0,d0,initial)
% Determine balloon radius assuming membrane pressure is negligible

R = 8.3144621; % gas constant
X = 3*n*R/(4*pi);

r = (X*T./p).^(1/3);

