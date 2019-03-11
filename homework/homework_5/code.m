close all
clear all
clc

syms a b c d e f g h i j k l x;

F(x) = sin(x);
FP(x) = diff(F(x));
FPP(x) = diff(FP(x));

xVals = [0, pi/12, 5*pi/12, 7*pi/12];

P(x) = a+b*(x)+c*(x^2)+d*(x^3)+e*(x^4)+f*(x^5)+g*(x^6)+h*(x^7)+i*(x^8)+j*(x^9)+k*(x^10)+l*(x^11);
PP(x) = diff(P(x));
PPP(x) = diff(PP(x));

E(x) = P(x) == F(x);
EP(x) = PP(x) == FP(x);
EPP(x) = PPP(x) == FPP(x);

[A, B] = equationsToMatrix([E(xVals(1:4)), EP(xVals(1:4)), EPP(xVals(1:4))]);

V = linsolve(A,B);

S(x) = V(1)+V(2)*(x)+V(3)*(x^2)+V(4)*(x^3)+V(5)*(x^4)+V(6)*(x^5)+V(7)*(x^6)+V(8)*(x^7)+V(9)*(x^8)+V(10)*(x^9)+V(11)*(x^10)+V(12)*(x^11);

fplot([S(x), F(x)])

vpa(double(V))
