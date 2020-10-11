function out = LyapunovControlLaw(in)
R_F=in(1:3);
R_L=in(4:6);
%Traiettoria del leader
vr=in(7);
omegar=in(8);

%% Controllo
K=10;

%Definizione errore di posizione
err(1)=(R_L(1)-R_F(1))*cos(R_F(3))+(R_L(2)-R_F(2))*sin(R_F(3));
err(2)=-(R_L(1)-R_F(1))*sin(R_F(3))+(R_L(2)-R_F(2))*cos(R_F(3));
err(3)=R_L(3)-R_F(3);

v=vr*cos(err(3))+err(1);
omega=omegar+vr*err(2)/K+sin(err(3));
out=[v omega];
end