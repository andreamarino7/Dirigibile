function dx =sistema_nonlineare(x)
% Parametri
global m0 V g Cz Kt c z_bar x1_eq Sz u1_eq

%Ingressi
x_1=x(1); x_2=x(2); x_3=x(3); u_1=x(4);
[Te,rho,~]=tr(z_bar+x_2);
m=m0+rho*Te*V/(x1_eq+x_1);        %Presa di pressione esterna, pint=pext

%Sistema
dx(1)=-Kt*(x_1+x1_eq-Te)/c+(u_1+u1_eq)/c;                                                           %Ti_punto
dx(2)=x_3;                                                                                          %z_punto
dx(3)=(rho*V*g+rho*Te*V*dx(1)*x_3/(x1_eq+x_1)^2-m*g-0.5*Cz*Sz*rho*x_3^2)/m;                         %Z_punto_punto
dx=dx.';

