%% Script per la formulazione del problema
Parametri;

global m0 l r V g Cz z_bar Kt c x1_eq Sz u1_eq

Kt=1;               %W/K
c=718;              %J/K

syms x1 x2 x3 u1 u2; % x1=T; x2=z; x3=dz; u1=v; u2=Fdz;

x=[x1;x2;x3];
u=[u1;u2];
[Te,rho,pr]=tr(x);            
m=m0+rho*Te*V/x1;        %Presa di pressione esterna, pint=pext
Sz=l*2*r+pi/2*r^2;
%% Definizione sistema non lineare

f(1)=-Kt*(x1-Te)/c+u1/c;                                                %Ti_punto
f(2)=x3;                                                                %z_punto
f(3)=(rho*V*g+rho*Te*V*f(1)*x3/x1^2-m*g-0.5*Cz*Sz*rho*x3^2+u2)/m;       %Z_punto_punto

f=f.';

% disp('Il sistema nonlineare è')
% disp(f)

%% Soluzione equilibri
%Ponendo x_punto==0, si ottiene come soluzione di equilibrio

z_bar=500;

x2_eq=z_bar;
x3_eq=0;
Te_bar=double(subs(Te,x2,x2_eq));
rho_bar=double(subs(rho,x2,x2_eq));

x1_eq=Te_bar/(1-m0/(rho_bar*V));
u1_eq=Kt*(x1_eq-Te_bar);
u2_eq=0;

x_eq=[x1_eq x2_eq x3_eq].';
u_eq=[u1_eq u2_eq].';

Vlim=-double(sqrt(2*subs(m,[x1,x2],[x1_eq,x2_eq])*g/rho_bar/Sz/Cz));

%Linearizzazione sistema
A_lin=jacobian(f,x);
A_lin_eq=subs(A_lin,x,x_eq); A_lin_eq=double(subs(A_lin_eq,u,u_eq));
disp('La linearizzazione di A attorno ad x_eq ed u_eq, A_lin_eq, è');
disp(A_lin_eq)

B_lin=jacobian(f,u);
B_lin_eq=subs(B_lin,x,x_eq); B_lin_eq=double(subs(B_lin_eq,u,u_eq));
disp('La linearizzazione di B attorno ad x_eq e u_eq, B_lin_eq, è');
disp(B_lin_eq)

%% Osservabilità e raggiungibilità

A=A_lin_eq;
B=B_lin_eq(:,1);
C=[0 1 0];
D=0;

%Definizione taglie matrici
n=size(A,1);
m=size(B,2);

sys=ss(A,B,C,D);

%Raggiungibilità
rR=rank(ctrb(A,B));
disp(['Il rango della matrice di raggiungibilità è ' num2str(rR)]);

%Osservabilità
rO=rank(obsv(A,C));
disp(['Il rango della matrice di osservabilità è ' num2str(rR)]);

% Sintesi regolatore in parallelo

% Poli di A+BK ... stabilità
p=[-1.5;-10;-12];
K=-place(A,B,p);

% Poli d A+LC ... convergenza
q=5*p;
L=-(place(A.',C.',q)).';

%Regolatore parallelo
reg=ss(A+B*K+L*C,-L,-K,0);

%% Anello chiuso e valutazione risposta al gradino
Gc1=feedback(sys,reg);
opt=stepDataOptions('StepAmplitude',dcgain(reg));
% step(Gc1,opt)

%% Discretizzazione
Ts=0.05;
sysD=c2d(sys,Ts,'zoh');
Ad=sysD.a;
Bd=sysD.b;

%Raggiungibilità
Rd=ctrb(Ad,Bd);
if rank(Rd)<n
    warning('Il sistema discretizzato non è raggiungibile')
else
    disp('Il sistema discretizzato è raggiungibile')
end