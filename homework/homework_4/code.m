xValues = [1.4 1.8 1.9 2.5];
yValues = [2.37 3.351 0.233 4.572];

syms P(x);
P(x) = NIDD(xValues, yValues);
double(P(2))

function P = NIDD(xValues, yValues)
    n = length(xValues);
    F = zeros(n,n);
    F(1:n,1) = yValues;
    for i = 2:n
        for j = 2:i
            F(i,j) = (F(i,j-1)-F(i-1,j-1))/(xValues(i)-xValues((i-j)+1));
        end
    end
 
    syms P(x);
    P = F(1,1);
    for i=2:n
        T = F(i,i);
        for j=1:i-1
            T = T * (x - xValues(j));
        end
        P = P + T;
    end
end
