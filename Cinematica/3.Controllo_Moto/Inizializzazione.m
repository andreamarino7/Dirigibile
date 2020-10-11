clear all
close all
clc

%% Inizializzazione uniciclo inseguitore
global R0
x0=150;
y0=400;
th0=pi/2;
R0=[x0; y0; th0]; %Partenza

global Ri
Ri=R0;

%% Inizializzazione uniciclo leader
global R0r
x0r=0;
y0r=0;
th0r=0;
R0r=[x0r; y0r; th0r]; %Partenza

global Rir
Rir=R0r;

%Traiettoria riferimento
global vr omegar
vr='60';
omegar='1';