close all;

l=31.1;
r=11.15;

q=out.q;
t=out.tout;
x=q(:,1); y=q(:,2); th=q(:,3);
axis equal; hold on; grid on;
t_c=linspace(0,2*pi,1000);
buffer=[];

for i=1:length(t)-1
    cla;
    z=[x(i);y(i);th(i)];
    buffer=[buffer z];
    plot(buffer(1,:),buffer(2,:),'g','linewidth',2);                                                    %Traccia
    pf=[buffer(1,end),buffer(2,end)];
    plot(l*cos(t_c)*cos(z(3))/2 - r*sin(t_c)*sin(z(3))+z(1), ...
        l*cos(t_c)*sin(z(3))/2 + r*sin(t_c)*cos(z(3))+z(2),'g');
    plot(z(1),z(2),'kx','linewidth',1,'markersize',2);
    plot([pf(1),pf(1)+l/2*cos(z(3))],[pf(2),pf(2)+l/2*sin(z(3))],'g','linewidth',1);    %Linea attuale leader
    pause(t(i+1)-t(i));
end