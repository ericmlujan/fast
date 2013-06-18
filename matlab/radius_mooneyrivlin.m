function r = radius_mooneyrivlin(n,p,T,r0,d0,initial)
% Determine balloon radius using Mooney-Rivlin model

mu = 300000; % Pa
R = 8.3144621; % gas constant
p0 = 2*mu*d0/r0;
k = 0.1; % set k=0 for neo-Hookean
X = 3*n*R/(4*pi);

for i=1:length(p)
    % Upon rearrangement of the equations we get a 7th order polynomial.  Since
    % we are stepping from a known initial value, an approach like gradient
    % descent would be more sensible.  But who can resist just calling 'roots'?
    poly = [ (p0*k/r0) p(i) (p0*r0) 0 (-X*T(i)) 0 (-p0*k*r0^5) 0 (-p0*r0^7) ];
    rtemp = roots(poly);

    valid = (imag(rtemp) == 0) & (rtemp > 0);
    rtemp = rtemp(valid);
    [w,iw] = min(abs(rtemp-initial));
    r(i) = rtemp(iw);
    initial = rtemp(iw);
end

