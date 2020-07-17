function xg = Baricentro_Dirigibile
%% Calcolo baricentro

global m0 l r

lc=l-r;             %lunghezza cilindro
Vc=pi*r^2*lc;
Vs=4*pi/3*r^3;
mc=m0*Vc/(Vc+Vs);
ms=m0-mc;
xs=3*r/8;           %questo è il baricentro di una semisfera, va bene perchè è tutto pieno di aria
xg=(mc*lc/2+ms*(lc+xs))/m0;
end