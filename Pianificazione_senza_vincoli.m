%% Pianificazione senza vincoli
Sistema;
%% Definizione parametri
%Numero di steps
p=2000;
Ttot=p*Ts;

%Stati iniziale e finale
x_0=[0 0 0].';
x_f_2=50;
x_f_3=0;
x_f_1=Te/(1-m0/(rho*V)); x_f_1=double(subs(x_f_1,x2,x2_eq+x_f_2))-x1_eq;
x_f=[x_f_1 x_f_2 x_f_3].';

%Matrice di raggiungibilità
for i=1:p
    Rp_down(:,i)=Ad^(i-1)*Bd;
end
Rp=[zeros(size(Bd)) Rp_down(:,1:end-1);Rp_down];
%% Traiettoria ottima
% up=pinv(B)*(-A*x_f); %up=-u1_eq+Kt*(x_f_1+x1_eq-double(subs(Te,x2,x2_eq+x_f_2)))
u=pinv(Rp)*([x_f;x_f]);
up=u(1);
% u=[up;u];
%% Input per Simulink
timing=Ts*(0:size(u,1)-1).';
uSim=[timing,flipud(u)];
y_lin=lsim(sys,flipud(u),timing,x_0,'zoh');
ySim=[timing,y_lin];