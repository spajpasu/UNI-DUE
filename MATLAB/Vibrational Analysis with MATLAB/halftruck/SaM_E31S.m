% SaM:  Free Vibrations, B.Weyh, UDE/IMU
% ----------------------------------------------------------- SaM_E31S.m
%       Free Vibrations linear time-invariant systemes
% E31:  Tank truck model, cofficent-matrix-script (symbolic)
% ----------------------------------------------------------------------
% parameters:   
syms c L h M Js m Jn l H g 

% mass/inertia-matrix
Mlin = [M+m,              0,              0;
          0, M*h^2+Js+H^2*m,          H*m*l;
          0,          H*m*l,       m*l^2+Jn]

% displacement-portional matrix
Qlin = [2*c,                    0,        0;
          0, -M*g*h-m*g*H+2*c*L^2,        0;
          0,                    0,    m*g*l]
% ----------------------------------------------------------- SaM_E31S.m