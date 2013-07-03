function p = mooneyrivlin(r,r0,d0)
% Evaluate membrane pressure using Mooney-Rivlin model

mu = 300000; % Pa
k = 0.1; % set k=0 for neo-Hookean
lambda = r/r0;
p = (2*mu*d0/r0)*(lambda.^-1-lambda.^-7).*(1+k*lambda.^2);

