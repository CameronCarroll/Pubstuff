%%
clear; clc;
tic;
maxval = 10000;
results = [2 3 5];
sieve = 1:maxval;

sieve(:) = false;
sieve(2) = true;
sieve(3) = true;
limit = uint32(sqrt(maxval));

for ii = 1:limit
    for jj = 1:limit
        n = 4*(ii^2) + jj^2;
        if (n <= maxval) && ((mod(n, 12) == 1) || (mod(n, 12) == 5))
            sieve(n) = ~sieve(n);
        end

        n = 3*(ii^2) + jj^2;
        if (n <= maxval) && (mod(n, 12) == 7)
            sieve(n) = ~sieve(n);
        end

        n = 3*(ii^2) - jj^2;
        if (ii > jj) && (n <= maxval) && (mod(n, 12) == 11)
            sieve(n) = ~sieve(n);
        end
    end
end

for ii = 5:limit
    if sieve(ii) 
        step_size = ii^2;
        for jj = (step_size : step_size : maxval)
            sieve(jj) = false;
        end
    end
    
end
% 0
%for ii = 1:maxval
%    if sieve(ii)
%        fprintf('%d \n', ii);
%    end
%end
disp(char(10));
toc;