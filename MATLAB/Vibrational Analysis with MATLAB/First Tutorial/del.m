clear all; close all
syms Fa P1 P2 x a EI
M(1) = Fa*x;
M(2) = M(1)-P1*(x-a) ;
M(3) = M(2)-P2*(x-2*a);

% disp(M)

for i = 1:3
V(i) = simplify(0.5*int(M(i)^2/EI, x, i*a-a, i*a));
end

disp(V)

VE = simplify(sum(V));

% Fa = 2*P1/3 + P2/3;
VE = simplify(subs(VE, Fa, (2*P1 + P2)/3));

y1 = simplify(diff(VE, P1))
y2 = simplify(diff(VE, P2))


% y1 = simplify(subs(y1, Fa)
% y2 = simplify(subs(y2, Fa)