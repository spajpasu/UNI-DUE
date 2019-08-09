clear; close all; format compact;
disp(['SaM_E25.m:  ',date])                       % control-output
disp('Symbolic Motion Equations via Lagrange 2.Kind')
disp('E25: Tank truck model (3 dof) (symbolic ODEs)')
% ----------------------------------------------------------------
% AGREEMENTS:
% ----------------------------------------------------------------
                             % system-parameters
syms c L        real         % - tire cover/rear-axle   
syms M Js h     real         % - semitrailer (frame + empty tank) 
syms m Jn l H   real         % - tank capacity (payload)
syms g          real         % - gravitational constant
   disp('Sytem-Parameter');  whos;                % control-output
dof=3;                       % degrees of freedom
syms t          real         % independant variable
     % generalised coord. + derivatives of dependend variables
syms q1 q2 q3   real         % - coordinates (y,phi,psi)
syms v1 v2 v3   real             % - velocities
syms a1 a2 a3   real         % - accelerations
syms ul ur      real         % steet-pofile input
syms Q1 Q2 Q3   real         % non potential forces
     % coord.- + derivative-vectors
q=[q1; q2; q3];              % - coordinates
v=[v1; v2; v3];              % - velocities
a=[a1; a2; a3];              % - accelerations
     % input, forces / moments / elongations
u=[ul; ur];                  % - input-vector (not used)
Q=[Q1; Q2; Q3];              % - non potential forces
   disp('coordinates, derivatives');              % control-output
   disp([q,v,a]);
   disp('input-vector');          disp(u)
   disp('non potential forces');  disp(Q)
% ----------------------------------------------------------------
% INPUT:   position-vektores, angular velocity-vectores
% ----------------------------------------------------------------
                                % position-vektors (center.punkts)
r0S=[   h*sin(q2); 
     q1+h*cos(q2);
                0];             % - semitrailer
r0N=[   H*sin(q2)+l*sin(q3); 
     q1+H*cos(q2)-l*cos(q3); 
                          0];   % - tank capacity (payload) 
   disp('position-vectors (center-points)');          % control-output
   disp(' - semitrailer r0S');    disp(r0S);
   disp(' - tank capacity r0N');  disp(r0N);
                                % angular velocity-vectores
omS=[0;0;-v2];                  % - semitrailer
omN=[0;0; v3];                  % - tank capacity (payload) 
   disp('angular velocity-vectors');                % control-output
   disp(' - semitrailer omS');    disp(omS);
   disp(' - tank capacity omN');  disp(omN);
%
                                % spring-elongations
yFl=q1+L*sin(q2)-ul;            % - semitrailer/axle (left)
yFr=q1-L*sin(q2)-ur;            %                    (right)
   disp('spring-elongations');                     % control-output
   disp(' - semitrailer/axle yFl,yFr');  disp([yFl;yFr]); 
                                % tensors of inertia
IS=diag([0 0 Js]);              % - semitrailer
IN=diag([0 0 Jn]);              % - tank capacity (payload) 
                                % gravitation-vector
gv=[0;-g;0];
% ----------------------------------------------------------------
% CALCULATION:   velocities
% ----------------------------------------------------------------
                                % center-point velocity-vectors
vS=jacobian(r0S,q)*v+...
   jacobian(r0S,t);             % - semitrailer
vN=jacobian(r0N,q)*v+...
   jacobian(r0N,t);             % - tank capacity (payload)
                                                  % control-output
   disp('velocity-vectors (center-points)');
   disp(' - semitrailer vS');    disp(vS)
   disp(' - tank capacity vN');  disp(vN)
% ----------------------------------------------------------------
% INPUT:   energy-terms
% ----------------------------------------------------------------
T=1/2*M*vS.'*vS + 1/2*omS.'*IS*omS +...
  1/2*m*vN.'*vN + 1/2*omN.'*IN*omN;   % kinetic energy
U= -M*gv.'*r0S - m*gv.'*r0N +...
  1/2*c*yFl^2  + 1/2*c*yFr^2;         % potential energy
                                      % (dissipation-fkt)
   disp('energy-terms');                     % control-output
   disp(' - kinetic energy   T');   disp(T);
   disp(' - potential energy  U');  disp(U);
% ----------------------------------------------------------------
% CALCULATION:  Lagrange Formalism of 2.Kind for Mechanical System)
% ----------------------------------------------------------------
                                % partial derivatives
dTdv=simplify(jacobian(T,v).');   % - kin.energy wrt. velocities
dTdq=simplify(jacobian(T,q).');   % - kin.energy wrt. coordinates
dUdq=simplify(jacobian(U,q).');   % - pot.energy wrt. coordinates
                                % total derivative of dTdv wrt. t
                                
% ------------------------------------------------------------------
% Equilibrium at q = [-(M+m)*g/2/c; 0; 0]

ht = dTdq - dUdq;
gt = simplify((jacobian(dTdv,q).')*v) + ...
     simplify(jacobian(dTdv,t));
 
%  ft = ht - gt;
%  ft1 = subs(ft, [q1 q2 q3], [0 0 0])
%  ft2 = subs(ft, [q1 q2 q3], [-(M+m)*g/2/c 0 0])
%  
%  M = simplify(jacobian(dTdv,v).')
%  Mlin1 = subs(M,[q1 q2 q3], [(-(M+m)*g/2/c) 0 0])
% q0 = [0, 0, 0]';
% qEqui = solve(ft, q)


dTdvdt = simplify((jacobian(dTdv,v).')*a) + ...
         simplify((jacobian(dTdv,q).')*v) + ...
         simplify(jacobian(dTdv,t));

% Linearised Equation is:
     
h = dTdvdt - dTdq + dUdq;

% hS = subs(h, [q1 q2 q3 ul ur], [0 0 0 0 0])

Mlin = simplify(jacobian(h,a).');
Mlin = subs(Mlin, [q1 q2 q3 v1 v2 v3 a1 a2 a3], [0 0 0 0 0 0 0 0 0]);

Qlin = simplify(jacobian(h,v).');
Qlin = subs(Qlin, [q1 q2 q3 v1 v2 v3 a1 a2 a3], [0 0 0 0 0 0 0 0 0]);

Klin = simplify(jacobian(h,q).');
Klin = subs(Klin, [q1 q2 q3 v1 v2 v3 a1 a2 a3], [0 0 0 0 0 0 0 0 0]);

A = -Mlin\Klin;
 
halftruckP

A = double(subs(A));

[Eve Eva] = eig(A);

disp('The mode shapes are:')
disp(Eve);

freq = sqrt(Eva);
disp('The frequencies are:')
disp(freq)