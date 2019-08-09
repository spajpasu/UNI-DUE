clear; close all; format compact;
disp('Symbolic Motion Equations via Lagrange 2.Kind')
disp('Earth Quake model (2 dof) (symbolic ODEs)')
% ----------------------------------------------------------------
% AGREEMENTS:
% ----------------------------------------------------------------
                             % system-parameters
syms k kt mB Jb Jx Jy l mF g t      real         
% - ground stiffness
% - building mass, moment of Inertia and length
% - mass of foundation
% - gravitational constant
% independant variable
        
     % generalised coord. + derivatives of dependend variables
syms q1 q2 v1 v2 a1 a2 Q1 Q2   real         
% - coordinates (x, theta)
% - velocities
% - accelerations
% non potential forces

dof = 2;     % 2 degree of freedom

q=[q1; q2];              % - coordinates
v=[v1; v2];              % - velocities
a=[a1; a2];              % - accelerations
% input, forces / moments / elongations
u=[q1; 0];                  % - input-vector
Q=[Q1; Q2];              % - non potential forces
% ----------------------------------------------------------------
% INPUT:   position-vektores, angular velocity-vectores
% ----------------------------------------------------------------
                                % position-vektors (center.punkts)
r0B=[   q1+(l*sin(q2))/2; 
     l*cos(q2)/2];             % - semitrailer
r0F=[   q1; 0];   % - tank capacity (payload) 
disp('Position Vector of Building r = '); disp(r0B);
disp('Position Vector of Foundation r = '); disp(r0F);

% angular velocity-vectores
omB=[0;0;v2];                  % - Building

% spring-elongations
yFl = -q1;            % Foundation (left)
yFr =  q1;            % Foundation (right)
yFt = q2;             % Rotational Elongation
% tensors of inertia
IB=diag([Jx Jy Jb]);              % - semitrailer
% gravitation-vector
gv=[0;-g];
% ----------------------------------------------------------------
% CALCULATION:   velocities
% ----------------------------------------------------------------
                                % center-point velocity-vectors
vB=jacobian(r0B,q)*v+...
   jacobian(r0B,t);             % - Building
vF=jacobian(r0F,q)*v+...
   jacobian(r0F,t);             % - Foundation

% ----------------------------------------------------------------
% INPUT:   energy-terms
% ----------------------------------------------------------------
T=1/2*mB*vB.'*vB + 1/2*omB.'*IB*omB +...
  1/2*mF*vF.'*vF ;                                  % kinetic energy
U= -mB*gv.'*r0B - mF*gv.'*r0F +...
  1/2*k*yFl^2  + 1/2*k*yFr^2 + 1/2*kt*yFt^2;         % potential energy

% ----------------------------------------------------------------
% CALCULATION:  Lagrange Formalism of 2.Kind for Mechanical System)
% ----------------------------------------------------------------
                                % partial derivatives
dTdv=simplify(jacobian(T,v).');   % - kin.energy wrt. velocities
dTdq=simplify(jacobian(T,q).');   % - kin.energy wrt. coordinates
dUdq=simplify(jacobian(U,q).');   % - pot.energy wrt. coordinates
                                % total derivative of dTdv wrt. t
Mass=simplify(jacobian(dTdv,v));  % - dTdv wrt. velocities (*a)


gt=simplify(jacobian(dTdv,q)*v)+... 
   simplify(jacobian(dTdv,t));    % -dTdv wrt. coordinates and t
ht=simplify(simplify(dTdq-dUdq));
ft = ht - gt;