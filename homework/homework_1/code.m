% Problem 2
syms x;
f(x) = (x*(x-1)*(x-2)*(x-3)*(x-4))/2;
df(x) = diff(f,x);
A = solve(df(x)==(f(.2)-f(3.7))/(.2-(3.7)));
M(x) = ((f(3.7)-f(0.2))/(3.7-(0.2))) * (x - 3.7) + f(3.7);

T(x) = (df(A) .* ([x;x;x;x] - A)) + f(A);

B=[f;M;T];
fplot(B, [0.2,3.7]);
