%------------------------- Ajay Kumar Pasupuleti------------------------
%--------------------------- Mtr. No. 3091942 -------------------------- 
%   Prism with n - sides
% 
% .....................................
% in:    n - number of sides
%        r - radius of circum circle of base polygons
%        h - height of Prism
 
% out:   Length of Side
%        Area of base
%        Surface Area of Prism
%        Volume of Prism
%        Plot of Prism
% ----------------------------------------------------------------

function [len, area, surface, volume] = prism(n, r, h)
    fprintf('\n');
    disp('--------------------- Ajay Kumar Pasupuleti--------------------');
    disp('---------------------- Mtr. No. 3091942 -----------------------');
    fprintf('\n');
    % calculating values of the prism
    alp = 2*pi/n;
    fprintf('Angle between sides is     %6.5f \n \n',alp);
    len = 2*r*sin(alp/2);
    fprintf('Length of the side is      %6.5f \n \n',alp);
    area = 0.5*n*r^2*sin(alp);
    fprintf('Area of the Polygon is     %6.5f \n \n',area);
    surface = 2*area+n*len*h;
    fprintf('Surface Area of Prism is   %6.5f \n \n',alp);
    volume = area*h;
    fprintf('Volume of the Prism is     %6.5f \n',alp);
    % calculating coordinates for drawing prism
    x(1) = 0;
    y(1) = r;
    z1(1) = 0;
    z2(1) = h;
    for i = 2:n+1
        x(i) = x(i-1)+r*sin(alp*i);
        y(i) = y(i-1)+r*cos(alp*i);
        z1(i) = 0;
        z2(i) = h;
    end
    % plotting figure
    figure;
    plot3(x,y,z1);
    hold on;
    plot3(x,y,z2);
    hold on;
    x = [x; x];
    y = [y; y];
    z = [z1; z2];
    plot3(x,y,z);
    axis off;
    title('Prism ---Mtr. No. 3091942---');
end