function [ eul ] = squat2eul( quat )
%squat2eul Convert from quaternion to euler in order ZYX
%	
%   Convert a serie of quaternion to euler angle according to sequence ZYX 
%   (yaw, pitch, roll)
% 
%   Using double, the difference from quat2eul is in the order of 10^-15
% 
   
    [r,c] = size(quat);
    
    if c ~= 4
        error('Parameter quat shall be in format nx4')
    end
    
    eul = [];
    
    % Now compute
    for i = 1:r
        
        q = quat(i,:);
        
        % from wikipedia
        phi = atan2(2*(q(1)*q(2)+q(3)*q(4)),1-2*(q(2)^2+q(3)^2));
        
        t2 = 2*(q(1)*q(3)-q(4)*q(2));
        
        theta = asin(t2);
        psi = atan2(2*(q(1)*q(4)+q(2)*q(3)),1-2*(q(3)^2+q(4)^2));
        
        eul = [eul; psi theta phi];
        
    end

end

