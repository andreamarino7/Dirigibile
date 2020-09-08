function out = f_tilde(in)

global u1_eq
x1=in(1); x2=in(2); x3=in(3);
x=[x1 x2 x3]';

A=[-0.0014   -0.0000         0;
         0         0    1.0000;
    0.0149   -0.0002    0.0000];
B=[0.0014;
         0;
         0];
f=sistema_nonlineare([x; u1_eq]);

out=f-A*x-B*u1_eq;
out=[out;0;0;0];
end