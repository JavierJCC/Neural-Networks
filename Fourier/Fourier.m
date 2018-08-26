syms n t;
% Set d to the series, using symsum()
%f = sin(n/2*t)*(sin(((n+2)*pi)/(2))*4/(pi^2*n^2)+(-1)^n*2/(n*pi));
%f = (4/(n^2)*(pi^2)) * (1-cos(n*pi/2)) * cos(n*pi/2)t ;
d=(1/4)+ symsum((4/((pi^2)*(n^2)))*(1-cos(n*pi/2))*cos((n*pi*t)/2) ,n,10,1010);
% Prep an x-axis
t=linspace(-10,10,1000);
% Evaluate the values accordingly
data=eval(d);
% And plot it
plot(t,data);
title('Grafica de series de fourier');
