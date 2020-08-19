%% Pianificazione ottima degli ingressi con vincoli sugli ingressi
Pianificazione_senza_vincoli;
% %% Utilizzo lsqlin
% %Numero di step
% p=1000;
% 
% %Inizializzazione della variabile di riuscita di lsqlin
% exitflag=0;
% 
% %Banda di saturazione
% u_min=-10;
% u_max=+200;
% 
% %Variabili di appoggio
% C_lsq=eye(p);
% d_lsq=zeros(p,1);
% 
% while exitflag~=1
%     %Matrice di raggiungibilità
%     for i=1:p
%     Rp_down(:,i)=Ad^(i-1)*Bd;
%     end
%     Rp=[zeros(size(Bd)) Rp_down(:,1:end-1);Rp_down];
%     
%     Aeq=Rp;
%     beq=[x_f;x_f]-[Ad^(p)*x_0;Ad^(p+1)*x_0];    
%     lb=repmat(u_min,p,1);
%     ub=repmat(u_max,p,1);
%     %Soluzione con lsqlin
%     [u,~,~,exitflag]=lsqlin(C_lsq,d_lsq,[],[],Aeq,beq,lb,ub);
%     
%     %Aggiornamento parametri di appoggio
%     p=p+1;
%     C_lsq=eye(p);
%     d_lsq=zeros(p,1);
% end
% u=[up;u];

%% Metodo 2 - Incrementando il numero di passi
%Matrice di raggiungibilità
Rp=Bd;
for i=2:p
    Rp=[Bd,Ad*Rp];
end

%% Aumentare il numero di step
%Valori saturazione
u_lb=0; %lower bound
u_ub=+100; %upper bound

while not(and(min(u)>=u_lb,max(u)<=u_ub))
    p=p+1;
    Rp=[Bd Ad*Rp];    
    u=pinv(Ad*Rp)*(x_f-Ad^(p+1)*x_0-Bd*up);
end

u=[up;u];
disp(['Trovato un tempo minimo di ' num2str(p*Ts)]);
%% Input per Simulink
timing=Ts*(0:size(u,1)-1).';
uSim=[timing,flipud(u)];
y_lin=lsim(sys,flipud(u),timing,x_0,'zoh');
ySim=[timing,y_lin];