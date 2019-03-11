syms x;

f(x) = x^2+3*x*sin(2*x)-1;
H(x) = 2.700455350*(1-2*(x-1.3)*(-3.5340))*((x-1.8)^2*(x-2.4)^2*(x-2.9)^2)/(0.7744)-0.149610394*(1-2*(x-1.8)*(-0.5758))*((x-1.3)^2*(x-2.4)^2*(x-2.9)^2)/(0.1089)-2.412385184*(1-2*(x-2.4)*(0.5757))*((x-1.3)^2*(x-1.8)^2*(x-2.9)^2)/(0.1089)+3.367961039*(1-2*(x-2.9)*(3.5340))*((x-1.3)^2*(x-1.8)^2*(x-2.4)^2)/(0.7744)-2.537228161*(x-1.3)*((x-1.8)^2*(x-2.4)^2*(x-2.9)^2)/(0.7744)-7.412552226*(x-1.8)*((x-1.3)^2*(x-2.4)^2*(x-2.9)^2)/(0.1089)+3.071491535*(x-2.4)*((x-1.3)^2*(x-1.8)^2*(x-2.9)^2)/(0.1089)+19.81423306*(x-2.9)*((x-1.3)^2*(x-1.8)^2*(x-2.4)^2)/(0.7744);

y = 2;
% print vals
disp('f(2)')
double(f(y))
disp('H(2)')
double(H(y))
disp('abs error')
vpa(double(abs(f(y) - H(y))))

% calulate error
n = 3;
xvals = [1.3 1.8 2.4 2.9];

numerator = 1;
for i = 1:3
    numerator = numerator * (y - xvals(i))^2;
end

% get the fractional part of the error
fraction = numerator / factorial(2 * n + 2);
disp('fraction')
fraction

% get 8th derivative of the function
derivs(x) = diff(f);
for i = 2:8
    derivs(x) = diff(derivs);
end
derivs(x)

% bounded derivative
g(x) = 768 * abs(x) + 3072;

bounded_error = fraction * g(2.9);
disp('error')
vpa(double(bounded_error))
