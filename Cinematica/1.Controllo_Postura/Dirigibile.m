function out = Dirigibile(in)

v=in(1); omega=in(2); x=in(3); y=in(4); th=in(5);

dot_x=v*cos(th);
dot_y=v*sin(th);
dot_th=omega;

out=[dot_x; dot_y; dot_th];
end