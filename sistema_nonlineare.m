function dx =sistema_nonlineare(x)
% Parametri
global m0 l r V g Cz Kt c z_bar x1_eq
Kt=1;               %W/K
c=718;              %J/K

%Ingressi
x1=x(1); x2=x(2); x3=x(3); u1=x(4);
[Te,rho,~]=tr(z_bar+x2);
m=m0+rho*Te*V/(x1_eq+x1);        %Presa di pressione esterna, pint=pext
Sz=l*2*r+pi/2*r^2;

%Sistema
dx(1)=-Kt*(x1_eq+x1-Te)/c+(u1_eq+u1)/c;                                                          %Ti_punto
dx(2)=x3;                                                                                        %z_punto
dx(3)=(rho*V*g+rho*Te*V*dx(1)*(x3_eq+x3)/(x1_eq+x1)^2-m*g-0.5*Cz*Sz*rho*(x3_eq+x3)^2)/m;         %Z_punto_punto