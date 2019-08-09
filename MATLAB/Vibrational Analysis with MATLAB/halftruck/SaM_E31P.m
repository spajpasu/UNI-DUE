% SaM:  Free Vibrations, B.Weyh, UDE/IMU
% ----------------------------------------------------------- SaM_E31P.m
%       Free Vibrations of linear time-invariant systemes
% E31:  Tank truck model, Parameter-script
% ----------------------------------------------------------------------
% System-Parameter-Werte
c =6.3e+6;      % [N/m]   tire cover stiffness                      
L =0.8;         % [m]     half axle-length
h =0.82;        % [m]     semitrailer... center point distance
M =8880.0;      % [kg]    semitrailer mass (with empty tank)
Js=12.688e+3;   % [kgm^2] semitrailer... mass moment
m =27.1e+3;     % [kg]    payload mass
Jn=200.0;       % [kgm^2] payload mass moment
l =0.265;       % [m]     payload "pendulum length"
H =1.13;        % [m]     payload "pendulum fasten-point" distance
g =9.81;        % [m/s^2] gravitation constant
% ----------------------------------------------------------- SaM_E31P.m