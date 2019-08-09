clear all; close all
syms F1 F2 x l

M2 = -F2*x;
M1 = M2 - F1*(x-(l/2));

V2EI = simplify(int(M1^2,x,l/2,l) + int(M2^2,x,0,l/2))

% V2EI2 = simplify(int(M1^2,x,0,l/2) + int(M2^2,x,l/2,l))