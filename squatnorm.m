function [ n ] = squatnorm( q )
%squatnorm Compute the norm of quaternion
%   
    [r,c] = size(q);

    if c~= 4
        error('squatconj expect q in format nx4');
    end
    
    n = sum((q.^2)')';

end

