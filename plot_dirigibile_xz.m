function plot_dirigibile_xz(x)

z=x(5); dz=x(6);

xg=Baricentro_Dirigibile;
pg=[0,z]/10;
coda=pg+[-xg,0]/10;
testa=pg+[65.4-xg,0]/10;

f=figure;
f.WindowState='maximized';
hold on
grid on
title('Piano x - z');
axis ([-20 20 0 1500]);

plot(testa(1),testa(2),'bo','linewidth',5);
plot([coda(1) testa(1)],[coda(2) testa(2)],'-b','linewidth',10);
plot(pg(1),pg(2),'kx','linewidth',1,'markersize',10);

end