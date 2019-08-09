clear all; close all

syms L om t q l
syms v a m g Q

rS = [L*cos(om*t) + l*sin(q); L*sin(om*t) - l*cos(q)];
vS = diff(rS,q)*v + diff(rS,t);
% disp(vS)

T = 0.5*vS.'*m*vS;

U = m*g*rS(2);

dTdv = diff(T,v);
dTdq = diff(T,q);
dUdq = diff(U,q);
dTdvdt = diff(dTdv,v)*a + diff(dTdv,q)*v + diff(dTdv,t);

h = dTdvdt - dTdq + dUdq - Q;

% Linearised Equation q = 0, Q = 0, om = 0

Mlin = diff(h,a);
Plin = diff(h,v);
Qlin = diff(h,q);

hS = subs(h, [q om Q], [0 0 0]);
Mlin = subs(Mlin, [q om Q], [0 0 0]);
Plin = subs(Plin, [q om Q], [0 0 0]);
Qlin = subs(Qlin, [q om Q], [0 0 0]);

%--------------------------------------------------------------------------

Lin = Mlin*a + Plin*v + Qlin*q + hS;