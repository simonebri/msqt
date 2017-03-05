function [ n ] = squatconj( q )
%squatconj Compute the conjugate of a quaternion
%  
    [r,c] = size(q);

    if c~= 4
        error('squatconj expect q in format nx4');
    end
    
    n = [q(:,1) -q(:,2) -q(:,3) -q(:,4)];

end

