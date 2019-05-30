%this solves linear equations and returns solution and det as output
%please provide a value as argument to function

function [x, d] = linearequ(r)
r1 = [5 2.*r 1.*r];
r2 = [3 6 2.*r-1];
r3 = [2 1.*r-1 3.*r];
a = [r1; r2; r3];
b = [2 3 5]';
d = det(a);
x = inv(a)*b;