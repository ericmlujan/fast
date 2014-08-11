h=[0:50:30000];
[rho,a,T,p]=stdatmo(h,0,'SI',true);
r = p./(rho.*T);

figure(1);
pl=plot(h,r);
%set(pl, 'linewidth', 1.5);
title('R value with altitude');
legend('R value','location','northwest');
xlabel('Altitude AMSL (m)');
ylabel('R value');
print('figure1.png','-dpng','-S900,600');