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
ft = ht - gt
% ----------------------------------------------------------------
% OUTPUT:   non linear motion equation
% ----------------------------------------------------------------
disp('a)')
disp('motion equation:  Mass(q,t)*a+gt(v,q,t)=ht(v,q,t)+Q(t)')
disp('Mass=');  disp(Mass);
disp('gt=');    for i=1:dof;  disp(gt(i));  end;
disp('ht=');    for i=1:dof;  disp(ht(i));  end;
disp('Q=');     disp(Q);
disp(' ');

%------------------------------------------------------------------
% Eigen Values and Eigen Modes

LinEquation         % Calling Linear Equations
Parameters          % Calling Parameters
% Eigen Value Problem
Mlin = subs(Mlin);
Klin = subs(Klin);
A = double(-Mlin\Klin);

[eVec, eVal] = eig(A);
omg = sqrt(eVal);

disp('c)')
fprintf('Eigen values (Natural Frequencies) are %10.6f, %10.6f \n',...
    imag(omg(1,1)),imag(omg(2,2)))
disp('Mode Shapes are')
disp(eVec)

disp('d)')
disp('Amplitude Frequency Diagrams are')
figure(1);
plot(eVec);
hold on;
line([1,2],[0,0],'LineStyle',':');
text(1.4,-0.03,'Equilibrium Position')
text(1.27,0.8,'\leftarrow Mode 1')
text(1.13,-0.3,'\leftarrow Mode 2')
text(1,0.25,'\leftarrow Foundation')
text(1.85,0.4,' Building \rightarrow')
title('Eigen Mode Plot');

%-----------------------------------------------------------------
% Plotting frequency versus amplitude curves

Omg = linspace(Omi, Omf, 500);
hs = [2*k*xgh; 0];
for i = 1:length(Omg)
   H = [Klin - (Omg(i)^2)*Mlin];
   yh = H\hs;
   yf(:,i) = yh;
end

figure(2)
plot(Omg,yf(1,:),'-k'); hold on;
plot(Omg,yf(2,:),'-m'); hold off;
title('Amplitude vs Frequency');
xlabel('Frequency');
ylabel('Amplitude (x) and Theta');
axis([Omi,Omf,-1,1]); 
grid on;
legend('Displacement(x)', 'Theta', 'Location','SouthEast');

figure(3)
% x vs Omg
subplot(2,1,1);
plot(Omg,abs(yf(1,:)),'-k');
title('Amplitude vs Frequency (Abs Value)');
xlabel('Frequency');
ylabel('Amplitude (x)');
axis([Omi,Omf,0,1]); grid on;
line([0.951523,0.951523],[0,1],'LineStyle',':');
line([1.291267,1.291267],[0,1],'LineStyle',':');
% x vs Omg
subplot(2,1,2);
plot(Omg,abs(yf(2,:)),'-m');
title('Amplitude vs Theta (Abs Value)');
xlabel('Frequency');
ylabel('Amplitude (Theta)');
axis([Omi,Omf,0,1]); grid on;
line([0.951523,0.951523],[0,1],'LineStyle',':');
line([1.291267,1.291267],[0,1],'LineStyle',':');

newCase