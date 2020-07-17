%% Sistema per la pianificazione del moto ascensionale
Parametri;

global m0 l r V g Cz z_bar p0 R

syms x1 x2 x3 u1 u2; % x1=z; x2=dz; x3=T; u1=dTi; u2=Fdz;

x=[x1;x2;x3];
u=[u1;u2];
[Te,p,rho]=tpr(x);
m=m0+p0*V/(R*x3);
Sz=l*2*r+pi/2*r^2;

%% Definizione sistema non lineare

f(1)=x2;
f(2)=(rho*V*g+rho*Te*V*u1*x2/x3^2-m*g-0.5*Cz*Sz*rho*x2^2+u2)/m;

f=f.';

disp('Il sistema nonlineare è')
disp(f)

%% Soluzione equilibri
%Ponendo x_punto==0, si ottiene come soluzione di equilibrio

z_bar=500;

x1_eq=z_bar;
x2_eq=0;

eqn= rho*V==m;
T_bar=solve(eqn,x3);
T_bar=double(subs(T_bar,x1,x1_eq))