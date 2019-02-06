function float=decimal_to_bin_str(a,n,k)

% a: decimal expression of the number to be converted.
% n: the number of available bits
% k: the desired precision

% Determine if there will be overflow or underflow.

if ((abs(a)>0) && (abs(a)<2^(1-2^(n-k-1))));
    display('UNDERFLOW');
    return
elseif (abs(a)>2^(2^(n-k-2)-1)*(2-2^(-k)));
    display('OVERFLOW')
    return 
end;

% Determine the signum:
s='0';
if a<0;
    s='1';
end
 
% Separate the whole and fractional parts of the absolute value 
% of a.

w = floor(abs(a));
f = abs(a) - floor(abs(a));

% Convert the whole part of a to binary.  We initialize the 
% empty string to store the binary digits of the whole part of a.

wb = '';

% The method for converting decimal integers to binary requires 
% collecting the remainders of iterative division by 2 until 
% enough divisions have occurred so that the resulting quotient 
% is 0.

q=1;
while q>0;
    q=floor(w/2);
    r=w-2*q;
    wb=strcat(num2str(r),wb);
    w=q;
end

% We desire to collect the digits of the mantissa, but to do so 
% we must detect where the first leading 1 is located.  In the 
% event that the whole part of a is nonzero, the exponent is 
% detected by counting the number of digits in the binary 
% representation of the whole part of a.

exp=length(wb)-1;

% If the whole part of a is zero, then we must determine the 
% number of leading zeros before the first leading 1.

% We initialize the empty string to store binary digits of the 
% fractional part of a.

fb = '';

% Because the binary expansion of a finite decimal fraction may 
% be infinite, we must limit the number of digits generated to 
% avoid an endless loop.  We stop this process once we have 
% collected k digits for the mantissa, which we call m.
if wb(1)=='0';
    exp=floor(log2(f));
    f=2^-exp*f-floor(2^-exp*f);
    d=0;
    while length(fb)<k;
        d=floor(2*f);
        fb=strcat(fb,num2str(d));
        f=2*f-floor(2*f);
    end
    m=fb;
end

% To determine the mantissa when the whole part of a is nonzero, 
% we concatenate the string wb with enough digits to provide the 
% desired precision.

if wb(1)=='1';
    m=wb(2:length(wb));
    d=0;
    while length(m)<k;
        d=floor(2*f);
        m=strcat(m,num2str(d));
        f=2*f-floor(2*f);
    end
end

% Add the bias to the exponent.

exp = exp + 2^(n-k-2)-1;

% Convert the exponent to a binary number.  We initialize the 
% empty string to store the binary digits of the exponent.

e='';

q=1;
while q>0;
    q=floor(exp/2);
    r=exp-2*q;
    e=strcat(num2str(r),e);
    exp=q;
end

% Place sufficiently many leading 0s to the left of the binary
% representation of the exponent, so that the number of binary 
% digits of the exponent is equal to n-k-1.

while length(e)<n-k-1;
    e=strcat('0',e);
end

% Concatenate s, e, and m to generate the desired floating point
% representation.

float=strcat(s,e,m(1:k));