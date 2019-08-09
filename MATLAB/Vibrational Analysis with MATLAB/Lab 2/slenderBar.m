clear; close all; format compact;
fprintf('\n \n ');
disp('Symbolic Motion Equations via Lagrange 2.Kind')
disp('Slender Bar model (1 dof) (symbolic ODEs)')
% ----------------------------------------------------------------
% Agreements:
% ----------------------------------------------------------------                        
syms k m l         real         
% spring stiffness
% mass
% bar length
          
syms q v a g t       real          
% coordinates (theta) = q 
% velocity (d(theta)/dt) = q' = v
% Acceleration = a
% gravitational Constant = g 
% independent variable = t

syms Q          real            
% non potential forces

% position-vektors (center.punkts)
rS = [0.5*l*sin(q); 0.5*l*cos(q)];
   
% spring Elongation
eL = l - l*cos(q);

% gravitation
gv = -g;

vS = diff(rS,q)*v;
% center-point velocity-vector

% kinetic energy
T=1/2*m*vS'*vS;                       

% potential energy
U= -m*gv*rS(2) + 1/2*k*eL^2;         

% partial derivatives
% LAGRANGE
dTdv = diff(T,v);
dTdq = diff(T,q);
dUdq = diff(U,q);

Mass=simplify(diff(dTdv,v));
gt=simplify(diff(dTdv,q)*v)+... 
   simplify(diff(dTdv,t));

ht=simplify(simplify(dTdq-dUdq));
% ----------------------------------------------------------------
% OUTPUT:   non linear motion equation
% dgl: h(a,v,q,t) = 0
% ----------------------------------------------------------------
disp('a)')
disp('Non linear motion equation:  Mass(q,t)*a+gt(v,q,t)=ht(v,q,t)+Q(t)')
fprintf('\n')
disp(Mass*a+gt);
disp('='); disp(ht+Q)
ft=simplify(-gt+ht);

%--------------------------------------------------------------------------
% Finding the Equilibrium Positions
%--------------------------------------------------------------------------
Parameters          % import Parameters
equi = solve(ft, q);
equi = subs(equi);
equi = double(equi*180/pi);
fprintf('\n')
disp('b)')
disp('The first equilibrium position is theta:');
disp(equi(1));
disp('The other equilibrium position is theta:');
disp(equi(2));
fprintf('\n')
%------------------------------------------------------------------------
LinVal % the linearised values of Mass and displacement proportional values
%--------------------------------------------------------------------------

disp('c)')
disp('eigen-frequency of the small motions sqrt(-Qlin/Mlin)')
omg = simplify(sqrt(-Qlin/Mlin));
Parameters          % import Parameters
omg = double(simplify(subs(omg)));
disp(omg);
fprintf('\n')

disp('d)')
disp('Linearised Value of mass:')
disp(Mlin)
disp('Linearised Value of displacement Portional :')
disp(Qlin)

%--------------------------------------------------------------------------

syms a b theta theta0
a = double(q0);
b = double(v0/omg);
theta = simplify(a * cos(omg*t) + b * sin(omg*t));
theta0 = a * cos(omg*t0) + b * sin(omg*t0);
fprintf('\n')
disp('e)')
disp('the amplitude at Time 0 is:')
fprintf('\n')
theta0 = double(subs(theta0));
disp(theta0)
fprintf('\n')

%--------------------------------------------------------------------------
% plotting theta vs varying t
t = linspace(0,8*pi/omg,500);
theta = double(subs(theta));
figure
plot(t,theta)
xlabel('Time')
ylabel('Theta')
title('Theta vs Time')