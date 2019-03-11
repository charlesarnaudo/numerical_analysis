%{
    Inputs: 
        x: matrix
        f: matrix
    Outputs:
        output: cubic spline interpolating polynomial coeffcients
%}
function [a, b, c, d] = cubic_spline(x, f)
    n = length(x)-1;
    h = zeros(n, 1);
    h = x(2:n+1, 1) - x(1:n, 1);
    C = zeros(n + 1);
    C(n+1, n+1) = 1;
    C(1, 1) = 1;
    
    for j=2:n
        C(j, j-1) = h(j-1);
        C(j, j) = 2 * (h(j-1) + h(j));
        C(j, j+1) = h(j);
    end
    
    v = zeros(n+1, 1);
    
    for j=2:n
        v(j) = 2/h(j-1) * (f(j+1) - f(j))-3/h(j) * ((f(j+1) - f(j)));
    end
    c=C^-1 * v;
    
    a = f;
    d = zeros(n+1, 1);
    for i=1:n
        d(i) = (c(i+1) - c(i)) / (3 * h(i));
    end
    
    b = zeros(n+1, 1);
    for i=1:n
        b(i) = (f(i + 1) - f(i)) / h(i) * (c(i + 1) + 2*c(i)) / 3;
    end
    M=[a, b, c, d];