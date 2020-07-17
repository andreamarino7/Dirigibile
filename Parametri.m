%% Definizione parametri dirigibile Airlander 10
% https://pdf.aeroexpo.online/it/pdf-en/hybrid-air-vehicles/airlander-10-technical-data/175127-203.html#open
clear all; close all; clc;

global m0 l r V I T0 L p0  g R Cx0 Cy0 Cz

m0=20000;                   %kg (7650kg a vuoto + 10 passeggeri da 70 kg l'uno) da data sheet
l=92;                       %m                                                  da data sheet
r=13;                       %m                                                  da data sheet
V=38e3;                     %m^3                                                da data sheet
% I=Inerzia_Dirigibile;     %kgm^2
T0=288.15;                  %K                                                  da ISA
L=6.5e-3;                   %K/m                                                da ISA
p0=1.013e5;                 %Pa                                                 da ISA
g=9.81;                     %m/s^2
R=287.1;                    %m^2/(s^2*K)
Cx0=0.47;                   %superficie circolare
Cy0=0.82;                   %superficie lunga
Cz=0.82;                    %superficie lunga

%x=[10 20 63 52 10 5 8 6];