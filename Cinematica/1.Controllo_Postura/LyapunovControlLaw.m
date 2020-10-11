function out = LyapunovControlLaw(in)

x=in(1); y=in(2); th=in(3);

%% Coordinate polari
rho=sqrt(x^2+y^2);
phi=atan2(y,x)+pi;
alpha=phi-th;

%Normalizzazione degli angoli
while (phi>=pi)
    phi=phi-2*pi;
end
while (phi<-pi)
    phi=phi+2*pi;
end
while (alpha>=pi)
    alpha=alpha-2*pi;
end
while (alpha<-pi)
    alpha=alpha+2*pi;
end
%% Leggge di controllo
% Costanti
k1=1;
k2=5;
lambda2=15;

% Ingressi di controllo
v=k1*rho*cos(alpha);
if alpha<=1e-3
    omega=k1*cos(alpha)*(alpha+lambda2*phi)+k2*alpha;
else
    omega=k1*sin(alpha)*cos(alpha)*(alpha+lambda2*phi)/alpha+k2*alpha;
end
out=[v omega];