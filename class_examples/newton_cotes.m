syms f(x);
syms nc(x);

%{
    use the n = 5 newtown-cotes forumla to approximate pi by using
    pi/4 = integral from 0 to 1 of 1/(1 + x^2). Let n = 200.
%}

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