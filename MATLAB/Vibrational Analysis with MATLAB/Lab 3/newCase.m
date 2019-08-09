%------------------newCase.m--------------------------------------------
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

fprintf('For case with kt = (g*l*mB)/2, one natural frequency is zero')
fprintf('\n which means the system is free to move \n')