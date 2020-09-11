%% Animazione dirigibile
close all;
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

xg=l/2;
t=0:0.01:2.5*pi;

for i=1:3:length(y_lin)
    pause(Ts)
    cla;
    z=y_lin(i)+z_bar;
    pg=[0,z];                   %Posizione baricentro
    hold on
    grid on
    title('Piano x - z');
    axis ([-20 20 z_bar*0.98 z_bar+x_f_2*1.15]);
    plot([0 l/4],[z z],'b');
    plot(l/4*cos(t),r/2*sin(t)+z,'g');
    plot(pg(1),pg(2),'kx','linewidth',1,'markersize',10);
end
    