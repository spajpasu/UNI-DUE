% SAM : pendel - rod
% ----------------------- penrod.m
clear, clc
syms q v t a        real    % q = phi(generalised co-ordinate)
syms L l m Om g     real
% osition-vector
rS = [L*cos(Om*t)+l*sin(q); L*sin(Om*t)-l*cos(q)];
% velocity - vector
vS = [diff(rS(1),t) + diff(rS(1),q)*v; diff(rS(2),t) + diff(rS(2),q)*v];
% kin.energy
T = vS'*m*vS/2;
%pot.energy
U = m*g*rS(2);
% LAGRANGE
dTdv = diff(T,v);
dTdq = diff(T,q);
dUdq = diff(U,q);
% Total Derivative
dTdvdt = diff(dTdv, v)*a ...
    + diff(dTdv,q)*v ...
    + diff(dTdv,t);
% dgl: h(a,v,q,t) = 0
h = dTdvdt-dTdq+dUdq;
hs = simplify(h);
disp(hs);

%----------------------------------------------------

%Taylor-Linearizing wrt.Equilibrium Position q0=0
syms dq dv da q0       real
q0 = 0;
h0 = subs(hs, [a,v,q],[0, 0, q0]); % 0 term
hda = diff(hs, a);
hda = subs(hda, [a,v,q],[0, 0, q0]); % 1st order
hdv = diff(hs, v);
hdv = subs(hdv, [a,v,q],[0, 0, q0]);
hdq = diff(hs, q);
hdq = subs(hdq, [a,v,q],[0, 0, q0]);


hl = h0 + da*hda + dv*hdv + dq*hdq; % linearised equation 
hlf = simplify(hl); % linearised final equation after simplifying
disp(hlf);