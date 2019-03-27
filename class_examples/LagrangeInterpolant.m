function L=LagrangeInterpolant(z,f)

syms x;
n=size(z,1);
LCP=[];
for i=1:n
    L=1;
    for j=1:n
        if i~=j
            L=L*(x-z(j,1))/(z(i,1)-z(j,1));
       end
    end
    LCP=[LCP;L];
end
L=simplify(sum(LCP.*f));