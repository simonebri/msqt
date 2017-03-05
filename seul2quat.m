function [ quat ] = seul2quat( eul, sequence )
%seul2quat Symbolic euler angle to quaternion
%   Convert a serie of euler angle to quaternion according to sequence 
%   Sequence can be a combination of XYZ letter. ZYX is default (yaw,
%   pitch, roll)
% 
%   Using double, the difference from eul2quat is in the order of 10^-15

	if (~exist('sequence', 'var'))
        sequence = 'ZYX';
    end
    
    [r,c] = size(eul);
    
    if c ~= 3
        error('Parameter eul shall be in format nx3')
    end
    
    % We need to use this instead of preallocation for symbolic math support
    quat = [];
    
    % Now compute
    for i = 1:r
        
        angle = eul(i,:);
        
        if sequence(1) == 'Z'
            psi = angle(1);
        elseif sequence(1) == 'Y'
            psi = angle(2);
        elseif sequence(1) == 'X'
            psi = angle(3);
        else 
            error('Unknown first letter in sequence');
        end
        
        
        if sequence(2) == 'Z'
            theta = angle(1);
        elseif sequence(2) == 'Y'
            theta = angle(2);
        elseif sequence(2) == 'X'
            theta = angle(3);
        else 
            error('Unknown second letter in sequence');
        end
        
        if sequence(3) == 'Z'
            phi = angle(1);
        elseif sequence(3) == 'Y'
            phi = angle(2);
        elseif sequence(3) == 'X'
            phi = angle(3);
        else 
            error('Unknown third letter in sequence');
        end
        
        % from wikipedia
        q0 = cos(phi/2)*cos(theta/2)*cos(psi/2)+sin(phi/2)*sin(theta/2)*sin(psi/2);
        q1 = sin(phi/2)*cos(theta/2)*cos(psi/2)-cos(phi/2)*sin(theta/2)*sin(psi/2);
        q2 = cos(phi/2)*sin(theta/2)*cos(psi/2)+sin(phi/2)*cos(theta/2)*sin(psi/2);
        q3 = cos(phi/2)*cos(theta/2)*sin(psi/2)-sin(phi/2)*sin(theta/2)*cos(psi/2);
      
        quat = [quat; q0 q1 q2 q3];
        
    end
end

