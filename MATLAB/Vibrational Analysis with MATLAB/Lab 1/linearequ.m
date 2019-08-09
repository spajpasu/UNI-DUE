%------------------------- Ajay Kumar Pasupuleti------------------------
%--------------------------- Mtr. No. 3091942 -------------------------- 
%this solves linear equations and returns solution and det as output
%please provide value of "r" as argument to function 

function [x, d] = linearequ(r)
% fprintf('\n');
r1 = [5 2.*r 1.*r]; % coefficinets of 1st equation takes as row 1 of equtaion
r2 = [3 6 2.*r-1]; % coefficinets of 2nd equation takes as row 1 of equtaion
r3 = [2 1.*r-1 3.*r]; % coefficinets of 3rd equation takes as row 1 of equtaion
a = [r1; r2; r3];
b = [2 3 5]';
d = det(a);
x = a\b;
% fprintf('\n The solutions of equation for r = %f is \n ', r);
% disp(x)
% fprintf('\n The deteminant of a is : %f', d)
% fprintf('\n');
end