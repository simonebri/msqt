function [ rotm ] = squat2rotm( q )
%squat2rotm Converts the quaternion to a rotation matrix
%   
    [r,c] = size(q);

    if c~= 4 && r ~= 1
        error('squat2rotm expect q in format 1x4');
    end
    
    q = squatnormalize(q);
    
    rotm = [(1-2*q(3)^2-2*q(4)^2)   2*(q(2)*q(3)+q(1)*q(4))     2*(q(2)*q(4)-q(1)*q(3));
        2*(q(2)*q(3)-q(1)*q(4))     (1-2*q(2)^2-2*q(4)^2)       2*(q(3)*q(4)+q(1)*q(2));
        2*(q(2)*q(4)+q(1)*q(3))     2*(q(3)*q(4)-q(1)*q(2))     (1-2*q(2)^2-2*q(3)^2)]';

end

