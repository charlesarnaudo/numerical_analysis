function SevenPointMidpoint()

syms c h f0 f1 f2 f3 f4 f5 f6 x
% c denotes the midpoint
% h denotes the spacing between consecutive values of x
% f0, f1, f2, f3, f4, f5 and f6 are the function values at x0, x1, x2, x3 x4, x5 and x6
% (respectively).

% the following vector contains all of the x values
v=c*[1;1;1;1;1;1;1]+h*[-3;-2;-1;0;1;2;3];

% the following vector contains all of the y values
f=[f0;f1;f2;f3;f4;f5;f6];

% we will build the Lagrange coefficient polynomials
LCP=[];
for n=0:6
    L=1;
    for j=0:6
        if j~=n
            L=L*(x-v(j+1))/(v(n+1)-v(j+1));
        end
    end
    LCP=[LCP;L];
end

% we now express the Lagrange Interpolating Polynomial as an appropriate linear combination of the coefficient polynomials
L=sum(LCP.*f);
% we differentiate the Lagrange Interpolating Polynomial
dL=diff(L,x);
% the formula comes from evaluating this derivative at c
formula=subs(dL,c)
