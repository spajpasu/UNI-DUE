close all; clear all

syms l m a q v g k t


gv = -g
rS = [l*sin(q)/2; l*cos(q)/2]
vS = diff(rS,q)*v
eL = l-2*rS(2)
T = vS.'*m*vS*0.5
U = -m*g*rS(2) - 1/2*k*eL^2

dTdv = diff(T,v);
dTdq = diff(T,q);
dUdq = diff(U,q);

M = diff(dTdv,v)*a
gt = diff(dTdv,q)*v + diff(dTdv,t)
ht = dTdq - dUdq

ft = simplify(-gt+ht)