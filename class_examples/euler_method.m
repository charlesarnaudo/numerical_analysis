%{
    Inputs: 
        h: number of steps
        y: starting value of the initial condition
        m: left endpoint 
        n: right endpoint
    Outputs:
        approx
%}
function output=euler_method(n, m, order)
    h=1/n;
    t=0;
    y=2;
    for i=0:n-1
        s=t*(y+1);
        t=t+h;
        y=y+h*s;
    end
    digits(m);
    output=[vpa(y);vpa(3*exp(1/2)-1); vpa(abs(vpa(y)-vpa(3*exp(1/2)-1))); vpa(abs(y-(3*exp(1/2)-1))/h^order)];
end