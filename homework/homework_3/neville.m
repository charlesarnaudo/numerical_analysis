function output = neville(x, y, z)
%{
    Inputs: 
        x: array of x coords
        y: array of y coords
        z: point to evaluate
    Outputs:
        output: the final value from nevilles
%}
n = length(x);
p = zeros(n, n);

for i = 1:n
    p(i, 1) = y(i);
end

for i=2:n
    for j=2:i
        p(i,j) = (((z-x(i-j+1)) * p(i, j-1)) - ((z-x(i)) * p(i-1, j-1))) / (x(i) - x(i-j+1));
    end
end

output = p(n, n);
