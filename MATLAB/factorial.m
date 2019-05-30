%this function calculates factorial of number given as input

function fact = factorial(n)
fact = 1;
while n >= 1
    fact= fact*n;
    n=n-1;
end