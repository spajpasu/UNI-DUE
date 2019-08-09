% Ex31.m
%----------------------------------------------
SaM_E31S            % System Matrix

A = -Mlin\Qlin
% omq = eig(A)

SaM_E31P            % Parameter
A = double(subs(A))
% omq = eig(A)        % Eigen Vector in Quadratic form
% om = sqrt(omq)
Mlin = double(subs(Mlin))
Qlin = double(subs(Qlin))

[EVe, EVa] = eig(A)
EV = sqrt(EVa)