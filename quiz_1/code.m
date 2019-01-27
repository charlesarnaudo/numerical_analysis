syms x;
f(x) = x - x^2 + 4*(x^3) + x^4 - x^5;
N = 10^(-8);

% Calculate Remainder %
for i=1:10^8
    f = diff(f);
    r = abs( (f(5)/factorial(i + 1)) * (5 - 10)^(i + 1) );
    if r <= N
        i
        vpa(double(r))
        break
    end
end

% Calculate Taylor Series
f(x) = x - x^2 + 4*(x^3) + x^4 - x^5;
sum = f(1);
for i=1:6
    f = diff(f);
    sum = sum + ( (f(5) / factorial(i)) * (10 - 5)^(i) );
    vpa(double(sum))
end

