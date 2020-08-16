%% Definizione parametri dirigibile Airlander 10
% http://gefaflug.com/six-seat-airship-gd-6/
clear all; close all; clc;

global m0 l r V  T0 L0 p0  g R Cx0 Cy0 Cz %I

m0=2000;                    %kg (1488kg a vuoto + 1 pilota + 450 kg di carico) da data sheet
l=48.6;                     %m                                                  da data sheet
r=7.44;                     %m                                                  da data sheet
V=5e3;                      %m^3                                                da data sheet
% I=Inerzia_Dirigibile;     %kgm^2
T0=288.15;                  %K                                                  da ISA
L0=6.5e-3;                  %K/m                                                da ISA
p0=1.013e5;                 %Pa                                                 da ISA
g=9.81;                     %m/s^2
R=287.1;                    %m^2/(s^2*K)
Cx0=0.47;                   %superficie circolare
Cy0=0.82;                   %superficie lunga
Cz=0.82;                    %superficie lunga

%x=[10 20 63 52 10 5 8 6];