%------------------newCase.m--------------------------------------------
clear all; close all;
syms mB mF l Jb g
syms k kt

Parameters

Mlin = [mB + mF,(l*mB)/2; (l*mB)/2,...
    (mB*l^2)/4 + Jb];
% Special Case when kt = (g*l*mB)/2;
Klin = [2*k, 0; 0, 0];
A = double(subs(-Mlin\Klin));
[eVec, eVal] = eig(A);
omg = sqrt(eVal);
disp('e) Special Case')
fprintf('Eigen values (Natural Frequencies) are %10.6f, %10.6f \n',...
    imag(omg(1,1)),imag(omg(2,2)))
disp('Mode Shapes are')
disp(eVec)

figure(1);
plot(eVec);
hold on;
line([1,2],[0,0],'LineStyle',':');
text(1.4,0.05,'Equilibrium Position')
title('Eigen Mode Plot');
legend('Mode1','Mode2','location','south');

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

% x vs Omg
figure(3)
subplot(2,1,1);
plot(Omg,abs(yf(1,:)),'-k');
title('Amplitude vs Frequency (Abs Value)');
xlabel('Frequency');
ylabel('Amplitude (x)');
axis([Omi,Omf,0,1]); grid on;
line([0.993808,0.993808],[0,1],'LineStyle',':');


% x vs Omg
subplot(2,1,2);
plot(Omg,abs(yf(2,:)),'-m');
title('Amplitude vs Theta (Abs Value)');
xlabel('Frequency');
ylabel('Amplitude (Theta)');
axis([Omi,Omf,0,1]); grid on;
line([0.993808,0.993808],[0,1],'LineStyle',':');

fprintf('For case with kt = (g*l*mB)/2, one natural frequency is zero')
fprintf('\n which means the system is free to move \n')