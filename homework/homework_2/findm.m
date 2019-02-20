clear
clc

disp('Part a, allow rounding')
maxValue = 0.9999*(10^15);
m = 0;
while true
    if factorial(m) > maxValue
        m = m - 1;
        break
    end
    m = m + 1;
end
m

clear

disp('Part a, no rounding')
maxValue = 0.9999*(10^15);
i = 0;
m = 0;
while true
    fact = factorial(i);
    if fact > maxValue
        break
    end
    if numSigFigs(fact) <= 4
        m = i;
    end
    i = i + 1;
end
m

clear

disp('Part c, allow rounding')
maxValue = 0.9999*(10^15);
m = 0;
while true
    product = 1;
    for i=0:2
        product = product * ((m-i)/(3-i));
    end
    if product > maxValue
        m = m - 1;
        break
    end
    m = m + 1;
end
m

clear

disp('Part c, no rounding')
maxValue = 0.9999*(10^15);
j = 3;
m = 3;
while true
    product = 1;
    for i=0:2
        product = product * ((j-i)/(3-i));
    end
    if product > maxValue
        break
    end
    if numSigFigs(product) <= 4
        m = j;
    end
    j = j + 3;
end
m

% Counts sig figs of a number
function result = numSigFigs(num)
    result = 0;
    numstr = num2str(num);
    numlen = length(numstr);
    for i=numlen:-1:1
        if isequal(numstr(i), 'e')
            numlen = i-1;
        end
        if isequal(numstr(i), '.')
            numstr = strcat(numstr(1:i-1), numstr(i+1:numlen));
            numlen = numlen - 1;
        end
    end
    for i=numlen:-1:1
        if ~isequal(numstr(i), '0')
            result = i;
            return
        end
    end
end
