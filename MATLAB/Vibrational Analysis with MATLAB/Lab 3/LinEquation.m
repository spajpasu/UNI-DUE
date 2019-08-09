%----------------- LinEquation.m -------------------------------------
clear all; close all;
syms mB mF l Jb g
syms k kt

Mlin = [mB + mF,    (l*mB)/2;        ...
       (l*mB)/2,    (mB*l^2)/4 + Jb]; 
   disp('b)')
disp('Linearised Mass Matrix')
disp(Mlin)
Klin = [2*k, 0;             ...
         0,  kt-(g*l*mB)/2];
disp('Linearised Stiffness Matrix')
disp(Klin)
