function [ n ] = squatmultiply( q,r )
%squatmultiply Symbolic quaternion multiplication
    
    [rq,cq] = size(q);
    [rr,cr] = size(r);
    
    if cq ~= 4
        error('Parameter q shall be in format nx4')
    end
    
    if cr ~= 4
        error('Parameter r shall be in format nx4')
    end
    
    if rq ~= 1 && rq ~= rr
        error('Parameter r and q shall have same number of rows')
    end
     
    % We need to use this instead of preallocation for symbolic math support
    n = [];
    
    % Now compute
    for i = 1:rr
        
        ri = r(i,:);
        
        if rq == 1
            qi = q;
        else 
            qi = q(i,:);
        end

        n = [n;
            (ri(1)*qi(1)-ri(2)*qi(2)-ri(3)*qi(3)-ri(4)*qi(4)) ...
            (ri(1)*qi(2)+ri(2)*qi(1)-ri(3)*qi(4)+ri(4)*qi(3)) ...
            (ri(1)*qi(3)+ri(2)*qi(4)+ri(3)*qi(1)-ri(4)*qi(2)) ...
            (ri(1)*qi(4)-ri(2)*qi(3)+ri(3)*qi(2)+ri(4)*qi(1))];
    end
end

