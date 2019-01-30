function z=bin_float_todec(a,k)

% a:  binary floating point number (must be a string).
% k:  the precision of the input (a positive number with floor less than 
% length(a)-1).

% For example, if the input is a string of length 100, and if the user
% specifies precision of 85, then it will be assumed that there are
% 100-85-1 = 14 digits dedicated to the exponent, and the exponent would be
% biased by 2^13-1.

n=length(a);
s=str2num(a(1));
digits(k+1);

% For the purpose of this example, we do not use the built-in MATLAB 
% commands that convert between binary and decimal.  We use a loop to 
% perform the conversion:

ex=0;
for j=0:n-k-2
  ex=ex+str2num(a(n-k-j))*2^j;
end

e=ex-2^(n-k-2)+1;

% We assume that the convention used is that a_(n-k+1),...,a_n is the
% string giving the digits of the mantissa after the first leading 1.  Thus 
% we initialize f assuming that the leading 1 is already present.

f=1;
for l=1:k
    f=f+str2num(a(n-k+l))*2^(-l);
end

z=vpa((-1)^s*2^e*f);