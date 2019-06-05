%this function converts temperature from celcius to Fahrenheit
%tempconv(i,j) takes inputs as initial, final tempuratures
%Outputs are 3 vectors,
%1st celcius, 2nd fahrenheit and 3rd matrix with 1st column as Celcius and second as Fahrenheit

function [c, f, temp] = tempconv(ti,tj)
c = [ti:1:tj]';
f = 9.*c/5+32;
temp = [c f];