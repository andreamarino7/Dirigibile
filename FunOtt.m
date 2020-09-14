function out = FunOtt(in)
u=[0;in;0];
out=norm(diff(u),inf);
end