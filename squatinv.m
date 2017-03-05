function [ n ] = squatinv( q )
%squatinv Compute the inverse quaternion
%   
    [r,c] = size(q);

    if c~= 4
        error('squatinv expect q in format nx4');
    end
    
    sqnorm = squatnorm(q);
    
    n = squatconj(q)./[sqnorm sqnorm sqnorm sqnorm];
end

