function p = gent(r,r0,d0,Jm)
% Evaluate membrane pressure using Gent model

mu = 300000; % Pa
lambda = r/r0;
p = (2*mu*d0/r0)*(lambda.^-1-lambda.^-7).*(Jm./(Jm-(2*lambda.^2+lambda.^-4-3)));
for i=1:length(p)
   if p(i) < 0
       p(i) = NaN;
   end
end
