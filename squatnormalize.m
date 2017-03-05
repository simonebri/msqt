function [ n ] = squatnormalize( q )
%squatnormalize Normalizes a quaternion
%   
    [r,c] = size(q);

    if c~= 4
        error('squatnormalize expect q in format nx4');
    end
    

    n = q./squatmod(q);
end

