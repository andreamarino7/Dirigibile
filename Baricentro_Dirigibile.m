function xg = Baricentro_Dirigibile
%% Calcolo momento di inerzia

lc=65.4;        %lunghezza cilindro
R=9.7;          %raggio ext
r=7.1;          %raggio int
m0=7650;        %m tot
mp=70;          %massa persona
dp=25;          %distanza persona
Vc=pi*(R^2-r^2)*lc;
Vs=4*pi/3*(R^3-r^3);
mc=m0*Vc/(Vc+Vs);
ms=m0-mc;
xs=3*(R^4-r^4)/(8*(R^3-r^3));
xg=(mc*lc/2+ms*(lc+xs))/m0;
end