% balloon parameters
r0=0.9; % uninflated radius (m)
initial=1; % initial radius (m)
burst=3.4; % burst radius (m)
mb=1.6; % balloon mass (kg)
mp=0.15; % payload mass (kg)
M=1.01; % molecular mass of gas

% range of altitudes to sweep (m)
h=[0:100:30000];

[rho,a,T,p]=stdatmo(h,0,'SI',true);
rubberrho=1100; % density of rubber (kgm-3)
d0=mb/(4*pi*r0^2*rubberrho); % uninflated thickness
maxstretch=(burst/r0)*1.08; % theoretical max stretch
 % (1.08 fudge factor over burst point, need to compare to experiment)
Jm=2*maxstretch^2+maxstretch^-4-3; % Gent parameter
m=mb+mp;

% determine n corresponding to initial radius
n=moles(p(1),T(1),initial,r0,d0);
n1=moles1(p(1),T(1),initial);

r1=radius_nonrestoring(n1,p,T,r0,d0,initial);
i1=find(r1>burst,1)-1;
h1=h(i1)
p1=gasp(n1,r1,T)-p;
l1=lift(n1,M,r1,rho,m);
v1=terminalvelocity(n,M,r1,rho,m);

r2=radius_mooneyrivlin(n,p,T,r0,d0,initial);
i2=find(r2>burst,1)-1;
h2=h(i2)
p2=gasp(n,r2,T)-p;
l2=lift(n,M,r2,rho,m);
v2=terminalvelocity(n,M,r2,rho,m);

r3=radius_gent(n,p,T,r0,d0,initial,Jm);
i3=find(r3>burst,1)-1;
h3=h(i3)
p3=gasp(n,r3,T)-p;
l3=lift(n,M,r3,rho,m);
v3=terminalvelocity(n,M,r3,rho,m);

ascent_minutes=sum((h(2)-h(1))./v3(1:i3))/60

figure(1);
pl=plot(h(1:i1),r1(1:i1),h(1:i2),r2(1:i2),h(1:i3),r3(1:i3));
%set(pl, 'linewidth', 1.5);
title('Balloon radius with altitude');
legend('non-restoring model','Mooney-Rivlin model','Gent model','location','northwest');
xlabel('Altitude AMSL (m)');
ylabel('Balloon radius (m)');
%print('figure1.png','-dpng','-S900,600');

figure(2);
pl=plot(h(1:i1),p1(1:i1),h(1:i2),p2(1:i2),h(1:i3),p3(1:i3));
%set(pl, 'linewidth', 1.5);
title('Membrane pressure with altitude');
legend('non-restoring model','Mooney-Rivlin model','Gent model','location','northwest');
xlabel('Altitude AMSL (m)');
ylabel('Membrane pressure (Pa)');
%print('figure2.png','-dpng','-S900,600');

figure(3);
pl=plot(h(1:i1),l1(1:i1),h(1:i2),l2(1:i2),h(1:i3),l3(1:i3));
%set(pl, 'linewidth', 1.5);
title('Lift with altitude');
legend('non-restoring model','Mooney-Rivlin model','Gent model','location','northwest');
xlabel('Altitude AMSL (m)');
ylabel('Net lift (kg)');
%print('figure3.png','-dpng','-S900,600');

figure(4);
pl=plot(h(1:i1),v1(1:i1),h(1:i2),v2(1:i2),h(1:i3),v3(1:i3));
%set(pl, 'linewidth', 1.5);
title('Ascent velocity with altitude');
legend('non-restoring model','Mooney-Rivlin model','Gent model','location','northwest');
xlabel('Altitude AMSL (m)');
ylabel('Ascent velocity (m/s)');
%print('figure4.png','-dpng','-S900,600');
