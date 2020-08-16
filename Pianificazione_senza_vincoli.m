%% Pianificazione ottima degli ingressi senza vincoli
Sistema
%% Definizione parametri
%Numero di steps
p=10;
Ttot=p*Ts;

%Stati iniziale e finale
x_0=[0 0 0].';
x_f_2=50;
x_f_3=0;
x_f_1=solve(eqn,x1); x_f_1=double(subs(x_f_1,x2,x2_eq+x_f_2))-x1_eq;
x_f=[x_f_1 x_f_2 x_f_3].';

%Mantenimento stato finale
keep_final=true;

%Matrice di raggiungibilità
for i=1:p-1
    Rp(:,i)=Ad^i*Bd;
end
%% Traiettoria ottima
up=Kt*(-u1_eq+x_f_1+x1_eq-double(subs(Te,x2,x2_eq+x_f_2)));
u=pinv(Rp)*(x_f-Ad^p*x_0-Bd*up);
u=[up;u];
%% Input per Simulink

timing=Ts*(0:size(u,1)-1).';
uSim=[timing,flipud(u)];
y_lin=lsim(sys,flipud(u),timing,x_0,'zoh');
ySim=[timing,y_lin];