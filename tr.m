function [T,rho,pr] = tr(x)
%% Calcolo Temperatura e Densità ad una data quota z
l=length(x);
global p0 L0 g R T0
switch l
    case 1
        z=x(1);
    case 3
        z=x(2);
    otherwise
        warning('Ingresso non definito correttamente');
end
T=T0-L0*z;
pr=p0*(1-L0/T0*z)^(g/(R*L0));
rho=pr/(R*T);
end