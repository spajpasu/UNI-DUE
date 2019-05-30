function [len, area, surface, volume] = prism(n, r, h)
    % calculating values of the prism
    alp = 2*pi/n;
    len = 2*r*sin(alp/2);
    area = 0.5*n*r^2*sin(alp);
    surface = 2*area+n*len*h;
    volume = area*h;
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
    end