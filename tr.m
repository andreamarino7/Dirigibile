function [T,rho] = tr(x)
%% Calcolo Temperatura e Densità ad una data quota z
global p0 L g R T0

z=x(1);

T=T0-L*z;
p=p0*(1-L/T0*z)^(g/(R*L));
rho=p/(R*T);
end