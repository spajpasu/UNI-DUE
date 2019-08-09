syms x L k m      real

syms  q1 q2         real

syms EI rowA        real

p = [q1 q2]';
h = [x^2/L^2; x - (x^2)/(L)];
% disp(h)

% dh = diff(h,x);
ddh = diff(h,x,2);

pTIpEI = int(ddh*ddh',x,0,L);

pTIIp = k*subs(h,x,L/2)*(subs(h,x,L/2))';

pTIIIp = pTIIp;

% -----------------------------------------------------------------

% mass terms
% 
% pTIVprowA = int(h*h',x,0,L);


K = EI * (pTIpEI) + pTIIp + pTIIIp;

EI = 2.1e6;
L = 15;
k = 1.5e5;

Kf = double(subs(K));