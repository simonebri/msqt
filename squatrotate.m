function [ n ] = squatrotate( q, r )
%squatrotate Rotate a vector by quaternion q
%   
    [qr,qc] = size(q);

    if qc~= 4
        error('squatrotate expect q in format nx4');
    end
    
    [rr,rc] = size(r);

    if rc~= 3
        error('squatrotate expect r in format nx3');
    end
    
    
    if rr ~= qr && qr ~= 1
         error('length of r and q shall be equal');
    end
    
    
     % We need to use this instead of preallocation for symbolic math support
    n = [];
    
    % Now compute
    for i = 1:rr
        
        ri = r(i,:);
    
        if qr == 1
            qi = q;
        else 
            qi = q(i,:);
        end
        
        n = [n; (ri*squat2rotm(qi))];
        
    end

end

