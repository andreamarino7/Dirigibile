close all;

lu=31.1;
r=11.15;

l=out.leader;
ins=out.inseguitore;
t=out.Time.data;
xl=l(:,1); yl=l(:,2); thl=l(:,3);
xi=ins(:,1); yi=ins(:,2); thi=ins(:,3);
axis equal; hold on; grid on;
t_c=linspace(0,2*pi,1000);
bufferl=[];
bufferi=[];

for i=1:length(t)-1
    cla;
    zl=[xl(i);yl(i);thl(i)];
    zi=[xi(i);yi(i);thi(i)];
    bufferl=[bufferl zl];
    bufferi=[bufferi zi];
    plot(bufferl(1,:),bufferl(2,:),'b','linewidth',5);                                        %Traiettoria leader
    plot(bufferi(1,:),bufferi(2,:),'g','linewidth',5);                                        %Traiettoria inseguitore
    pfl=[bufferl(1,end),bufferl(2,end)];                                                      %Punto attuale leader
    pfi=[bufferi(1,end),bufferi(2,end)];                                                      %Punto attuale inseguitore
    plot(lu*cos(t_c)*cos(zl(3))/2 - r*sin(t_c)*sin(zl(3))+zl(1), ...
        lu*cos(t_c)*sin(zl(3))/2 + r*sin(t_c)*cos(zl(3))+zl(2),'b');                            %Ellisse leader
    plot([pfl(1),pfl(1)+lu/2*cos(zl(3))],[pfl(2),pfl(2)+lu/2*sin(zl(3))],'b','linewidth',1);    %Linea attuale leader
    plot(lu*cos(t_c)*cos(zi(3))/2 - r*sin(t_c)*sin(zi(3))+zi(1), ...
        lu*cos(t_c)*sin(zi(3))/2 + r*sin(t_c)*cos(zi(3))+zi(2),'g');                        %Ellisse inseguitore
    plot([pfi(1),pfi(1)+lu/2*cos(zi(3))],[pfi(2),pfi(2)+lu/2*sin(zi(3))],'g','linewidth',1);    %Linea attuale leader
    pause(t(i+1)-t(i));
end