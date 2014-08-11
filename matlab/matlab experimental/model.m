Q=csvread('fast27.csv');
for i = 1:length(Q)
    Q(i,1) = (Q(i,1) * 86400); %converts the date format to seconds
end
for i=1:length(Q)-1
    Z(1,i) = Q(i,2); %Z - altitudes to run the model for
    N(i,1) = Q(i,2); %N - same thing
    N(i,2)=(Q(i+1,2)-Q(i,2))/(Q(i+1,1)-Q(i,1)); % deriving the ascent velocity
end
temp1 = N(1:length(N),1); % used for curve fit
temp2 = N(1:length(N),2); % used for curve fit

% balloon parameters
burst=2.9; % burst radius (m)
mb=1.631; % balloon mass (kg)
mp=0.197; % payload mass (kg)
M=1.00794; % molecular mass of gas (g)

% range of altitudes to sweep (m)
h=Z;
M=1.00794; % molecular mass of gas (g)

[rho,a,T,p,nu]=stdatmo(h,0,'SI',true);
rubberrho=1100; % density of rubber (kgm-3)

%Volume Calculations
STPV=1.96915;
LaunchV=(T(1)*101300*STPV)/(293.2*p(1)); %volume of gas at launch (m^3)
initial=((3*LaunchV)/(4*pi))^(1/3);
r0=initial;

d0=mb/(4*pi*r0^2*rubberrho); % uninflated thickness
m=mb+mp; %gravity


% determine n corresponding to initial radius
n=moles(p(1),T(1),initial,r0,d0,LaunchV);
n1=moles1(p(1),T(1),LaunchV);


r1=radius_nonrestoring(n1,p,T);
i1=find(r1>burst,1)-1;
h1=h(i1);
p1=gasp(n1,r1,T)-p;
l1=lift(n1,M,r1,rho,m);
v1=terminalvelocity(n,M,r1,rho,m);

r2=radius_mooneyrivlin(n,p,T,r0,d0,initial);
i2=find(r2>burst,1)-1;
h2=h(i2);
p2=gasp(n,r2,T)-p;
l2=lift(n,M,r2,rho,m);
v2=terminalvelocity(n,M,r2,rho,m);
[v4, Re, CdR]=terminalvelocityrey(n,M,r2,rho,m,nu);

%Fit for FAST12 and drag coefficient calculation
%{
for i = 1:length(Q)-1
    v3(i,1) = Q(i,2);
    v3(i,2) = -1.281 * 10^-13 * Q(i,2)^3 +  2.547 * 10^-09 * Q(i,2)^2 + 8.152 * 10^-5 * Q(i,2) + 0.7987 ;
    v3a(1,i) = v3(i,2);
    Cd(1,i) = (2. * l2(1,i) * 9.8)/(rho(1,i) * v3(i,2)^2. * pi * r2(1,i)^2.);
end
%}

%Fit for FAST27 and drag coefficient calculation
for i = 1:length(Q)-1
    v3(i,1) = Q(i,2);
    v3(i,2) = -2.425 * 10^-13 * Q(i,2)^3 +  1.444 * 10^-08 * Q(i,2)^2 - 0.0001933 * Q(i,2) + 3.472;
    v3a(1,i) = v3(i,2);
    Cd(1,i) = (2. * l2(1,i) * 9.8)/(rho(1,i) * v3(i,2)^2. * pi * r2(1,i)^2.);
end


%figure(1);
%pl=plot(h(1:i1),r1(1:i1),h(1:i2),r2(1:i2));
%set(pl, 'linewidth', 1.5);
%title('Balloon radius with altitude');
%legend('non-restoring model','Mooney-Rivlin model','location','northwest');
%xlabel('Altitude AMSL (m)');
%ylabel('Balloon radius (m)');
%print('figure1.png','-dpng','-S900,600');

%figure(2);
%pl=plot(h(1:i1),p1(1:i1),h(1:i2),p2(1:i2));
%set(pl, 'linewidth', 1.5);
%title('Membrane pressure with altitude');
%legend('non-restoring model','Mooney-Rivlin model','location','northwest');
%xlabel('Altitude AMSL (m)');
%ylabel('Membrane pressure (Pa)');
%print('figure2.png','-dpng','-S900,600');

%figure(3);
%pl=plot(h(1:i1),l1(1:i1),h(1:i2),l2(1:i2));
%set(pl, 'linewidth', 1.5);
%title('Lift with altitude');
%legend('non-restoring model','Mooney-Rivlin model','location','northwest');
%xlabel('Altitude AMSL (m)');
%ylabel('Net lift (kg)');
%print('figure3.png','-dpng','-S900,600');

figure(2);
pl=plot(h(1:i1),v1(1:i1),h(1:i2),v2(1:i2),h(1:i2),v3(1:i2,2),h(1:i2),N(1:i2,2),h(1:i2),v4(1,1:i2));
%set(pl, 'linewidth', 1.5);
title('Ascent velocity vs Altitude');
legend('non-restoring model','Mooney-Rivlin model','Actual Fit','Actual','Reynolds','location','northwest');
xlabel('Altitude AMSL (m)');
ylabel('Ascent velocity (m/s)');
axis([h(1) h(i2) 0 5])
%print('figure4.png','-dpng','-S900,600');

figure(3);
pl=plot(h(1:i1),Cd(1:i1),h(1:i1),CdR(1:i1));
%set(pl, 'linewidth', 1.5);
title('Drag Coefficient vs Altitude');
legend('Measured','Reynolds','location','northwest');
xlabel('Altitude AMSL (m)');
ylabel('Drag Coefficient');
%axis([0 35000 0 4.5])
%print('figure4.png','-dpng','-S900,600');

figure(4);
pl=plot(v3(1:i2,2),Cd(1:i2),v2(1:i2),Cd(1:i2));
%set(pl, 'linewidth', 1.5);
title('Drag Coefficient vs Ascent Velocity');
legend('Actual AV','modeled AV','Actual','location','northwest');
xlabel('Ascent velocity (m/s)');
ylabel('Drag Coefficient');
%axis([0 35000 0 4.5])
%print('figure4.png','-dpng','-S900,600');

figure(5);
pl=plot(v3(1:i2,2),Cd(1:i2),v2(1:i2),Cd(1:i2));
%set(pl, 'linewidth', 1.5);
title('Drag Coefficient vs Ascent Velocity');
legend('Actual AV','modeled AV','Actual','location','northwest');
xlabel('Ascent velocity (m/s)');
ylabel('Drag Coefficient');
%axis([0 35000 0 4.5])
%print('figure4.png','-dpng','-S900,600');