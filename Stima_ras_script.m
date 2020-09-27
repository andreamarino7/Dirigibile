%% Lanciare file sistema
hFig=figure;
Rmin=0;
Rmax=10;

%A_ras = [A_lin_eq, -B*K;
%         L*C,  A_lin_eq+B*K+L*C];

A_ras=Gc1.A;
max_i=200;

for i=1:max_i
    H=(rand(size(A_ras))-0.5);
    Q=H.'*H;       
    Stima_ras_function(Q,A_ras,Rmax,Rmin,@f_tilde,hFig);
end