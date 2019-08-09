clear all; close all;

t = linspace(0,5,500);
p0 = 20;
om = 2;


for i = 1:6
    if i == 1
        p(i,:) = (4*p0/pi)*sin(om.*t);
    elseif rem(i,2) ~= 0
        p(i,:) = p(i-1,:)+(4*p0/(i*pi))*sin(i*om.*t);
    else
        p(i,:) = p(i-1,:);
    end
end

a = size(p);
figure;
for i = 1:a(1)
    plot(t, p(i,:));
    hold on;
end