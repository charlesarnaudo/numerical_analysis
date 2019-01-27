syms x;

sum=0;

N=10^4 + 1;

for i=1:N
    sum = sum + (((-1)^(i-1))/i)*(1.01^i);
end

vpa(sum)