%% Limitazioni sullo stato (in particolare sulla variazione di temperatura interna massima)
%Parametri di appoggio
Tmax=150;
Tmin=-150;
umax=max(u);
umin=min(u);
T_max=1.5;
T_min=-1.5;

while any([Tmax>T_max,Tmin<T_min,umax>u_ub,umin<u_lb])
    Rp=Bd;
    for i=2:p
        Rp=[Bd,Ad*Rp];
    end
    u=pinv(Ad*Rp)*(x_f-Bd*up);
    u=[up;u];
    timing=Ts*(0:size(u,1)-1).';
    uSim=[timing,flipud(u)];
    y_lin=lsim(sys,flipud(u),timing,x_0,'zoh');
    ySim=[timing,y_lin];
    simOut=sim('Simulazione_sistema_nl','SaveOutput','on','OutputSaveName','Tsim');
    Tsim = simOut.get('Tsim');
    Tmax=max(Tsim);
    %disp(Tmax);
    Tmin=min(Tsim);
    umax=max(u);
    umin=min(u);
    p=ceil(p*1.1);
    %disp(p);
end
disp(['Trovato un tempo minimo di ' num2str(p*Ts)]);