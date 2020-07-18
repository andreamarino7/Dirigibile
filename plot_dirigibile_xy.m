function plot_dirigibile_xy(x1)
%% Definizione parametri e punti
global l r

x=x1(1); y=x1(2); phi=x1(3);
lc=l-r;
xg=Baricentro_Dirigibile;
pg=[x,y];            %Posizione baricentro
coda=pg-[xg*cos(phi),xg*sin(phi)];     %Posizione coda
testa=coda+lc*[cos(phi),sin(phi)];  %Posizione cabina di guida

%% Plot del dirigibile nel piano xz
f=figure;
f.WindowState='maximized';
hold on
grid on
title('Piano x - y');
xlabel('x');
ylabel('y');
axis ([-100 100 -100 100]);

plot(testa(1),testa(2),'yo','linewidth',5);
plot([coda(1) testa(1)],[coda(2) testa(2)],'-g','linewidth',10);
plot(pg(1),pg(2),'kx','linewidth',1,'markersize',10);
end