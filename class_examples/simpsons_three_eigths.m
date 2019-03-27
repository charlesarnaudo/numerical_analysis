syms x0 h f0 f1 f2 f3

x=[x0; x0+h; x0+2*h; x0+3*h];
f=[f0;f1;f2;f3;];

L=LagrangeInterpolant(x, f);

IL=simplify(int(L));

simplify(subs(IL, x0+3*h) - subs(IL, x0))
