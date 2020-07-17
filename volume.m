function [Ve,Vi]=volume

global l r R

Ve=pi*R^2*l+2*pi/3*R^3;
Vi=pi*r^2*l+2*pi/3*r^3;

end