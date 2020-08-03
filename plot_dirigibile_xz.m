function plot_dirigibile_xz(x)
%% Definizione parametri e punti
global l r

z=x(2);
lc=l-r;
xg=Baricentro_Dirigibile;
pg=[0,z];            %Posizione baricentro
coda=[-xg/10,z];     %Posizione coda
testa=[(lc-xg)/10,z];  %Posizione cabina di guida

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