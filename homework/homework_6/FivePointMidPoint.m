function FivePointMidPoint()
    syms c h f0 f1 f2 f3 f4 x
    % c denotes the midpoint
    % h denotes the spacing between consecutive values of x
    % f0, f1, f2, f3, and f4 are the function values at x0, x1, x2, x3, and x4
    % (respectively).

    % the following vector contains all of the x values
    v=c*[1;1;1;1;1]+h*[-2;-1;0;1;2];

    % the following vector contains all of the y values
    f=[f0;f1;f2;f3;f4];

    % we will build the Lagrange coefficient polynomials
    LCP=[];
    for n=0:4
        L=1;
        for j=0:4
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