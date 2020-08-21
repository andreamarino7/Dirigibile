%% Animazione dirigibile
global l r
%% Temperatura
f=figure;
f.WindowState='maximized';
h(1)=subplot(2,2,1);
T=out.T;
T_reg=out.T_reg;
time=0:Ts:Ts*(length(T)-1);
hold on
plot(time,T,'-r');
plot(time,T_reg,'-b');
title('Variazione di temperatura')
grid on
legend('Senza regolatore','Con regolatore')
axis([0 time(end) 1.1*min([min(T),min(T_reg)]) 1.1*max([max(T), max(T_reg)])]);

%% Controllo
h(2)=subplot(2,2,3);
u_plot=flipud(u);
for i=length(u):length(time)
    u_plot(i)=u_plot(end);
end
plot(time,u_plot);
title('u')
grid on
axis([0 time(end) 1.1*min(u) 1.1*max(u)])

%% Plot salita
h(3)=subplot(2,2,[2 4]);
% WindowState='maximized';

for i=length(y_lin):length(time)
    y_lin(i)=y_lin(end);
end

xg=Baricentro_Dirigibile;

for i=1:length(y_lin)
    cla;
    z=y_lin(i)+z_bar;
    pg=[0,z];               %Posizione baricentro
    coda=[-xg/10,z];        %Posizione coda
    testa=[(l-r-xg)/10,z];  %Posizione cabina di guida
    hold on
    grid on
    title('Piano x - z');
    axis ([-20 20 z_bar z_bar+x_f_2+5]);
    plot(testa(1),testa(2),'yo','linewidth',5);
    plot([coda(1) testa(1)],[coda(2) testa(2)],'-g','linewidth',10);
    plot(pg(1),pg(2),'kx','linewidth',1,'markersize',10);
    pause(Ts)
end
    