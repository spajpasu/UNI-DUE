% EX_31.m
%------------------------------------------

clear; close all;
syms m a P1 P2 x y1 y2 EI         real

FA = 2/3*P1+1/3*P2

M1 = FA*x           % 0:a
M2 = M1-P1*(x-a)    % a:2a
M3 = M2-P2*(x-2*a)  % 2a:3a

% Total Strain EnergyStrain Energy

V2EI = int(M1^2,x,0,a)+...
        int(M2^2,x,a,2*a)+...
        int(M3^2,x,2*a,3*a)
    
% Partial Differentiation (partielle Ableitungen)
p = [P1; P2]
y = simplify(jacobian(V2EI,p)/(2*EI)).'

% Cofficient Matrix (Nachgiebigkeit)
H = jacobian(y,p)

% Stiefigkeits Matris (Stiffness Matrix)
K = inv(H)
% Massen - Matrix
M = diag([1,1])*m
%-----------------------------------------------
% Parameter numerical
m = 10
a = 400
b = 15
h = 10
E = 210*1e3
I = 1/12*b*h^3
EI = E*I
M = double(subs(M))
K = double((subs(K)))
% Eigen Value
[EV, EWq]=eig(-M\K)
EW = sqrt(EWq)