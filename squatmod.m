function [ n ] = squatmod( q )
%squatmod Compute the modulus
%   

    [r,c] = size(q);

    if c~= 4
        error('squatmod expect q in format nx4');
    end
    
    n = sqrt(squatnorm(q));
end

