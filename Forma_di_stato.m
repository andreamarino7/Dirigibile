clear all; clc
syms x1 x2 x3 u1 u2 m0 l r V g Cz z_bar Kt c x1_eq Sz u1_eq Te_bar rho_bar Te rho

x=[x1;x2;x3];
u=[u1;u2];         
m=m0+rho*Te*V/x1;        %Presa di pressione esterna, pint=pext
%% Definizione sistema non lineare

f(1)=-Kt*(x1-Te)/c+u1/c;                                                %Ti_punto
f(2)=x3;                                                                %z_punto
f(3)=(rho*V*g+rho*Te*V*f(1)*x3/x1^2-m*g-0.5*Cz*Sz*rho*x3^2+u2)/m;       %Z_punto_punto

f=f.';

% disp('Il sistema nonlineare è')
% disp(f)

%% Soluzione equilibri
%Ponendo x_punto==0, si ottiene come soluzione di equilibrio

x2_eq=z_bar;
x3_eq=0;

x1_eq=Te_bar/(1-m0/(rho_bar*V));
u1_eq=Kt*(x1_eq-Te_bar);
u2_eq=0;

x_eq=[x1_eq x2_eq x3_eq].';
u_eq=[u1_eq u2_eq].';

%Linearizzazione sistema
A_lin=jacobian(f,x);
A_lin_eq=subs(A_lin,x,x_eq); A_lin_eq=subs(A_lin_eq,u,u_eq);
disp('La linearizzazione di A attorno ad x_eq ed u_eq, A_lin_eq, è');
disp(A_lin_eq)

B_lin=jacobian(f,u);
B_lin_eq=subs(B_lin,x,x_eq); B_lin_eq=subs(B_lin_eq,u,u_eq);
disp('La linearizzazione di B attorno ad x_eq e u_eq, B_lin_eq, è');
disp(B_lin_eq)
