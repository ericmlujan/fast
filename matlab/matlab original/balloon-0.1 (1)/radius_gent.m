function r = radius_gent(n,p,T,r0,d0,initial,Jm)
% Determine balloon radius using Gent model

mu = 300000; % Pa
R = 8.3144621; % gas constant
p0 = 2*mu*d0/r0;
X = 3*n*R/(4*pi);

for i=1:length(p)
    % Upon rearrangement of the equations we get a 9th order polynomial.  Since
    % we are stepping from a known initial value, an approach like gradient
    % descent would be more sensible.  But who can resist just calling 'roots'?
    poly = [ (2*p(i)/r0^2) 0 (-p(i)*(Jm+3)) (-2*X*T(i)/r0^2-p0*Jm*r0) 0 (X*T(i)*(Jm+3)) (p(i)*r0^4) 0 0 (p0*Jm*r0^7-X*T(i)*r0^4) ];
    rtemp = roots(poly);

    valid = (imag(rtemp) == 0) & (rtemp > 0);
    rtemp = rtemp(valid);
    [w,iw] = min(abs(rtemp-initial));
    r(i) = rtemp(iw);
    initial = rtemp(iw);
end

