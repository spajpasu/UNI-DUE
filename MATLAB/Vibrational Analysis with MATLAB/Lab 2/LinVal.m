%------------------Linear Mass and Stiffness-----------------------------
% parameters:   
syms m l g k
% mass/inertia-matrix
Mlin = (m*l^2)/4;
% displacement-portional matrix
Qlin = -m*g*l/2;

% ----------------------------------------------------------- 