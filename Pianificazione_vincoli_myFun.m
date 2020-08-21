%% Pianificazione ottima con minima variazione degli ingressi utilizzando myFun
Pianificazione_senza_vincoli;

%%Numero di step
p=1000;

%Banda di saturazione
u_min=-u1_eq;
u_max=+1000;

%Raggiungibilità
Rp=Bd;
for i=2:p
    Rp=[Bd, Ad*Rp];
end

Aeq=Ad*Rp;
beq=x_f-Ad^(p+1)*x_0-Bd*up;
lb=repmat(u_min,p,1);
ub=repmat(u_max,p,1);

%Funzione handle da minimizzare
f=@(u)(myFun(u));

%Tentativo iniziale di controllo
u0=zeros(p,1);

%Parametri di ottimizzazione
options = optimset('Algorithm','interior-point','MaxFunEval',80000);
u=fmincon(f,u0,[],[],Aeq,beq,lb,ub,[],options);
u=[up;u];

%% Input per Simulink
timing=Ts*(0:size(u,1)-1).';
uSim=[timing,flipud(u)];
y_lin=lsim(sys,flipud(u),timing,x_0,'zoh');
ySim=[timing,y_lin];