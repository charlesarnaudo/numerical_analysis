syms f(x);
syms nc(x);

h = .025/5;
f(x) = 1/(1+x^2);
nc(x) = ((5*h)/288)*(19*f(x) + 75*f(x + h) + 50*f(x + 2*h) + 50*f(x + 3*h) + 75*f(x + 4*h) + 19*f(x + 5*h));

sum=0;
x=0;
for i = 1:40
    sum=sum+nc(x);
    x=x+.025;
end
vpa(sum)