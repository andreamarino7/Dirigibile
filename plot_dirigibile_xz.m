function plot_dirigibile_xz(x)
%% Definizione parametri
global l r

z=x(1);
lc=l-r;
xg=Baricentro_Dirigibile;
pg=[0,z]/10;            %Posizione baricentro
coda=pg+[-xg,0]/10;     %Posizione coda
testa=pg+[lc-xg,0]/10;  %Posizione cabina di guida

%% Plot del dirigibile nel piano xz

f=figure;
f.WindowState='maximized';
hold on
grid on
title('Piano x - z');
xlabel('x');
ylabel('z');
axis ([-20 20 0 1500]);

plot(testa(1),testa(2),'yo','linewidth',5);
plot([coda(1) testa(1)],[coda(2) testa(2)],'-g','linewidth',10);
plot(pg(1),pg(2),'kx','linewidth',1,'markersize',10);

end