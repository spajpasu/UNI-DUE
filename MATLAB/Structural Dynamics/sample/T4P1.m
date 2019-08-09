clear all; close all;

t = linspace(0,10,1000);

p = 200*sin(pi*t/4);

om0 = 1.57;

u = 0.364-0.2822*cos(om0*t) - 0.111*cos(2*om0*t)+0.776*cos(3*om0*t);

figure;
% plot(t, p);

% hold on;

plot(t,u);