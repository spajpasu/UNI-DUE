%------------------------- Ajay Kumar Pasupuleti------------------------
%--------------------------- Mtr. No. 3091942 -------------------------- 
% We plot here the solutions of 3 Linear equations with 'r' varying from 
% [-1,1], we then plot the values of solution x1,x2,x3 and determinant
% vs r

clear all; close all


disp('----------------------- Ajay Kumar Pasupuleti--------------------')
disp('------------------------ Mtr. No. 3091942 -----------------------')
i = 1; % variable to add elements to solution matrix and seterminant matrix
for r = -1:0.01:1
    % calling function to solve equation for value of r
    [sol, deter] = linearequ(r); 
    % while loop to add the calculated values into matrix
    while r<=1
        ref(i) = r;
        f(:,i) = [sol; deter];
        i = i+1;
        break;
    end
end
clear sol; clear deter;

figure; 
% x1 v/s r
plot(ref, f(1,:),'--r');
hold on;
% x2 v/s r
plot(ref, f(2,:),':b');
hold on;
% x3 v/s r
plot(ref, f(3,:),'-.m');
hold on;
% determinant v/s r
plot(ref, f(4,:),'g');
hold on;
% manipulating the matrix display
axis([-1 1 -20 20]);
legend({'x1', 'x2', 'x3', 'det'});
title('Solution Plot ---Mtr. No. 3091942---')
disp('The plots for solutions x1, x2, x3 and determinant have been plotted')
clear i; clear r;