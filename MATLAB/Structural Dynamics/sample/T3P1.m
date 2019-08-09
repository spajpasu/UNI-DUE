clear all; close all;

t = linspace(0,25,1000);
omE = 0.2;
omD = 1.996;
omN = 2;
dR = 0.0625;

uH = exp(-dR*omN.*t).*(-2.5185*cos(omD.*t)-0.211*sin(omD.*t));

uP = 2.5185*cos(omE.*t)+0.5368*sin(omE.*t);

u = uH+uP;

figure;
grid;
plot(t,uH);
hold on;
plot(t,uP);
hold on;
plot(t,u);