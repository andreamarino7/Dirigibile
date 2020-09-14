%% Pianificazione ottima con minima variazione degli ingressi utilizzando myFun
Pianificazione_vincoli_ingresso;

% Aggiunta tempo
p=p+100;

%vRaggiungibilità
Rp=Bd;
for i=2:p
	Rp=[Bd, Ad*Rp];
end
u=pinv(Ad*Rp)*(x_f-Bd*up);
Aeq=Ad*Rp;
beq=x_f-Bd*up;
lb=repmat(u_min,p,1);
ub=repmat(u_max,p,1);

%Tentativo iniziale di controllo
u0=zeros(size(u));

%Funzione handle da minimizzare
fun=@(u)(FunOtt(u));

%Parametri di ottimizzazione
options = optimset('Algorithm','interior-point','MaxFunEval',1e6);
u=fmincon(fun,u0,[],[],Aeq,beq,lb,ub,[],options);
u=[up;u];

%% Input per Simulink
timing=Ts*(0:size(u,1)-1).';
uSim=[timing,flipud(u)];
y_lin=lsim(sys,flipud(u),timing,x_0,'zoh');
ySim=[timing,y_lin];