%% Pianificazione ottima degli ingressi senza vincoli
Sistema
%% Definizione parametri
%Numero di steps
p=5;
Ttot=p*Ts;

%Stati iniziale e finale
x_0=[0 0 0].';
x_f_2=50;
x_f_3=0;
[Te,rho,pr]=tr(x_f_2+z_bar);
x_f_1=pr/(R*(rho-m0/V))-x1_eq;
x_f=[x_f_1 x_f_2 x_f_3].';

%Mantenimento stato finale
keep_final=true;

%Matrice di raggiungibilità
Rp=Bd;
for i=2:p
    Rp=[Bd,Ad*Rp];
end

%% Traiettoria ottima

if(~keep_final)%Non mantenere lo stato finale
    u=pinv(Rp)*(x_f-Ad^p*x_0);
else %Mantenere lo stato finale
    up=pinv(Bd)*(x_f-Ad^(p-1)*x_0);
    %up=pinv(Bd)*(x_f-A*x_f);
    
    %Check che è un equilibrio
    if (norm(A*x_f+B*up)<1e-10)
        disp('Ok, trovato un controllo di mantenimento')
    else
        warning('Il mantenimento non funziona')
    end
    u=pinv(Ad*Rp)*(x_f-Ad^(p+1)*x_0-Bd*up);
    u=[up;u];
end

%% Input per Simulink

timing=Ts*(0:size(u,1)-1).';
uSim=[timing,flipud(u)];
y_lin=lsim(sys,flipud(u),timing,x_0,'zoh');
ySim=[timing,y_lin];