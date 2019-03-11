%{
    Inputs: 
        x: matrix
        f: vector
    Outputs:
        output: cubic spline interpolating polynomial coeffcients
%}
function (a, b, c, d) = cubic_spline(x, f)
    n = length(x) - 1
    h = zeros(n, 1);