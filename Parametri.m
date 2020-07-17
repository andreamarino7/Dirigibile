%% Definizione parametri dirigibile 
% https://www.easa.europa.eu/sites/default/files/dfu/EASA-TCDS-AS.001_Zeppelin_LZ_N07--100-03-23122009.pdf
clear all; close all; clc;

global m0 l d I T0 L p0 g R Cx0 Cy0 Cz

m0=8350;                %kg, 7650kg a vuoto + 10 passeggeri da 70 kg l'uno
l=75.1;                 %m
d=16.8;                 %m, diametro medio, d_int=14.2, d_ext=19.4, t=5.2
I=Inerzia_Dirigibile;%kgm^2
T0=288.15;              %K
L=6.5e-3;               %K/m
p0=1.013e5;             %Pa
g=9.81;                 %m/s^2
R=287.1;                %m^2/(s^2*K)
Cx0=0.47;               %superficie circolare
Cy0=0.82;               %superficie lunga
Cz=0.82;                %superficie lunga

% x=[10 20 63 52 10 5 8 6];