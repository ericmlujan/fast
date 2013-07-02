% balloon parameters
burst=2.9; % burst radius (m)
mb=1.6; % balloon mass (kg)
mp=0.15; % payload mass (kg)
M=2.0158; % molecular mass of gas (g)

% range of altitudes to sweep (m)
h=[100:50:30000];

[rho,a,T,p]=stdatmo(h,0,'SI',true);
rubberrho=1100; % density of rubber (kgm-3)

%Volume Calculationsbn 
LaunchV=1.7266; %volume of gas at launch (m^3)
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

figure(1);
pl=plot(h(1:i1),r1(1:i1),h(1:i2),r2(1:i2));
%set(pl, 'linewidth', 1.5);
title('Balloon radius with altitude');
legend('non-restoring model','Mooney-Rivlin model','location','northwest');
xlabel('Altitude AMSL (m)');
ylabel('Balloon radius (m)');
%print('figure1.png','-dpng','-S900,600');

figure(2);
pl=plot(h(1:i1),p1(1:i1),h(1:i2),p2(1:i2));
%set(pl, 'linewidth', 1.5);
title('Membrane pressure with altitude');
legend('non-restoring model','Mooney-Rivlin model','location','northwest');
xlabel('Altitude AMSL (m)');
ylabel('Membrane pressure (Pa)');
%print('figure2.png','-dpng','-S900,600');

figure(3);
pl=plot(h(1:i1),l1(1:i1),h(1:i2),l2(1:i2));
%set(pl, 'linewidth', 1.5);
title('Lift with altitude');
legend('non-restoring model','Mooney-Rivlin model','location','northwest');
xlabel('Altitude AMSL (m)');
ylabel('Net lift (kg)');
%print('figure3.png','-dpng','-S900,600');

figure(4);
pl=plot(h(1:i1),v1(1:i1),h(1:i2),v2(1:i2));
%set(pl, 'linewidth', 1.5);
title('Ascent velocity with altitude');
legend('non-restoring model','Mooney-Rivlin model','location','northwest');
xlabel('Altitude AMSL (m)');
ylabel('Ascent velocity (m/s)');
%print('figure4.png','-dpng','-S900,600');