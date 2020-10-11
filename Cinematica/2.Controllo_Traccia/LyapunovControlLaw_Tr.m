function out = LyapunovControlLaw_Tr(in)
x=in(1); y=in(2); th=in(3);

%% Leggge di controllo
% Costanti
k=100;

% Ingressi di controllo
v=50;
if th<1e-2
    omega=-y*v-k*th;
else
    omega=-y*v*sin(th)/th-k*th;
end
out=[v omega];