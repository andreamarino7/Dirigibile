clear all
close all
clc

%% Inizializzazione

global R0
x0=-150;
y0=-500;
th0=pi/4;
R0=[x0; y0; th0]; %Partenza

global Ri
Ri=R0;

global Rf
xf=0;
yf=0;
thf=0;
Rf=[xf; yf; thf];