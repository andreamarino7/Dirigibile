%% Lanciare i file precedenti
%% Limitazioni sullo stato (in particolare sulla velocità massima
%Numero di step
p=1000;

%Matrice di raggiungibilità
Rp=Bd;
for i=2:p
    Rp=[Bd,Ad*Rp];
end

Aeq=Rp;
beq=[x_f;x_f]-[Ad^(p)*x_0;Ad^(p+1)*x_0];

%% Calcolo delle matrici Hp e Op
%Nuova matrice delle uscite
Cv=[1 0 0];

%Matrici all'inizio
Hp_row=Cv*Rp; %Riga
Hp=Hp_row;
Op=Cv*Ad;

%Dimensioni
my=size(Cv,1);
mu=size(Bd,2);

%Calcolo matrici
for i=2:p
    Op=[Op*Ad;Cv*Ad];
    Hp_row=[zeros(my,mu) Hp_row(:,1:end-mu)];
    Hp=[Hp;Hp_row];
end

%% Ottimizzazione
%Limiti nel controllo
lb=repmat(u_min,p,1);
ub=repmat(u_max,p,1);

%Limiti nella temperatura
v_lb=-ones(p,1);
v_ub=+ones(p,1);

%Funzione da ottimizzare
f=@(u)(myFun(u));

%Vincoli delle disequazioniy
Aineq=[Hp;-Hp];
bineq=[v_ub-Op*x_0; v_lb-Op*x_0];

%Condizioni iniziali
u0=zeros(p,1);

%Ottimizzazione
options = optimset('Algorithm','interior-point','MaxFunEval',80000);
u=fmincon(f,u0,Aineq,bineq,Aeq,beq,lb,ub,[],options);
u=[up;u];

%% Input per Simulink

timing=Ts*(0:size(u,1)-1).';
uSim=[timing,flipud(u)];
y_lin=lsim(sys,flipud(u),timing,x_0,'zoh');
ySim=[timing,y_lin];