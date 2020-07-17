function I = Inerzia_Dirigibile
%% Calcolo momento di inerzia

global m0 l r R

lc=l-R;             %lunghezza cilindro
mp=70;              %massa persona
dp=25;              %distanza persona
Vc=pi*(R^2-r^2)*lc;
Vs=4*pi/3*(R^3-r^3);
mc=m0*Vc/(Vc+Vs);
ms=m0-mc;
xs=3*(R^4-r^4)/(8*(R^3-r^3));
xg=(mc*lc/2+ms*(lc+xs))/m0;
Ic=mc*(R^2+r^2)/4;
Is=ms*(R^5-r^5)/(R^3-r^3)/5-ms*xs^2;
Ip=mp*dp^2;
I=Ic+mc*(xg-lc/2)^2+Is+ms*(lc+xs-xg)^2+10*Ip;
end