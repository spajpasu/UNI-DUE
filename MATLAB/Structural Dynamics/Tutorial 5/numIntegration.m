%this file is to run central difference and newmark methods (constant and
% linear variation in acceleration) and compare the results with analytical

% given values

% central difference method
% to satisfy stability condition, dt < Tn/pi
clear all; close all;
m = 0.2533;
k = 10;
om = 6.283;
zeta = 0.05;
td = 0.6;
Tn = 1;
dt = 0.1*(Tn/pi);
t = 0:dt:5;
c = 2*zeta*m*om;

% central difference initial values
u0 = 0;
du0 = 0;
p(1) = loadval(t(1));
ddu0 = (p(1)-c*du0-k*u0)/m;
un = u0 - dt*du0 + dt^2*ddu0/2;
kd = (m/dt^2)+(c/(2*dt));
a = (m/dt^2)-(c/(2*dt));
b = k - (2*m/dt^2);

% for time step 1 i.e t=0
u(1) = u0;

phd(1) = p(1)-a*un-b*u(1);

for i=2 : length(t)
    u(i) = phd(i-1)/kd;
    p(i) = loadval(t(i));
    phd(i) = p(i)-a*u(i-1)-b*u(i);
end

%%
% newmark average and linear average methods
% alpha = 0.5 for both methods
% beta = 1/4 for average acceleration
% beta = 1/6 for linear acceleration
% to satisfy stability condition, dt < 0.551*Tn for linear method
% Average acceleration method is unconditionally stable

% define constants for newmark average method

gamma = 1/2;
aB = 1/6;
u0 = 0;
du0 = 0;
p(1) = loadval(t(1));
ddua0 = (p(1)-c*du0-k*u0)/m;

aa1 = m/(aB*dt^2) + gamma*c/(aB*dt);
aa2 = m/(aB*dt) + ((gamma/aB)-1)*c;
aa3 = ((1/(2*aB))-1)*m + dt*c*((gamma/(2*aB))-1);
ka = k + aa1;

% Initial Conditions
ua(1) = u0;
dua(1)= du0;
ddua(1) = ddua0;
% pha(1) = p(1)+aa1*

for i = 2 : length(t)
    p(i) = loadval(t(i));
    pha(i) = p(i)+aa1*ua(i-1)+aa2*dua(i-1)+aa3*ddua(i-1);
    ua(i) = pha(i)/ka;
    dua(i) = (gamma/(aB*dt))*(ua(i)-ua(i-1))+(1-(gamma/aB))*dua(i-1)+dt*(1-(gamma/(2*aB)))*ddua(i-1);
    ddua(i) = 1/(aB*dt^2)*(ua(i)-ua(i-1)) - 1/(aB*dt)*dua(i-1)-((1/(2*aB)-1)*ddua(i-1));
end

%%

% plotting

figure;
subplot(3,1,1);
plot(t,p);
subplot(3,1,2);
plot(t, u);
subplot(3,1,3);
plot(t, ua);