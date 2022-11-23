% Function [a]=influence(o,p, s )
% LdM Aug. 2022
% Assemble influence matrix for the steady panel method
% Arguments:
% o           Position of control points (2,n) 
% p           Normals to the camber line at the control point locations
%             (2,n)
% s           Position of vortices (both bound and shed) (2,n)
% Return value:
% a           Influence matrix


function [a]=influence(o,p, s )
n = length(o);
for i = n:-1:1
    for j = n:-1:1
        a(i,j) = p(:,i)'*vortex(s(:,j),o(:,i));
    end
end
end
