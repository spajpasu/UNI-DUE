%----------------- Parameters.m ----------------------------------------
mB = 1000;      % Mass of building
mF = 20000;     % Mass of Foundation
l = 10;         % Length of building
kt = 100000;    % Torsional Spring Stiffness
k = 10000;      % Foundational Stiffness
Jb = mB*l^2/12; % Moment of Inertia Building
g = 9.81;       % Acceleration due to gravity
xgh = 0.1;      % Amplitude of excitation
Omi = 0;        % Initial Value of Omega
Omf = 2.5;      % Final Value of Omega