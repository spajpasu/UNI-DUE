function [ p ] = loadval( t )
%LOAD Summary of this function goes here
%   Detailed explanation goes here
    td = 0.6;
    if t<=td
        p = 10*sin(pi*t/td);
    else
        p = 0;
    end
end