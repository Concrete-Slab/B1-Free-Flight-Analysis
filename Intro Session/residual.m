% Function [r]=residual(o,p, s, u,q)
% LdM Aug. 2022
% Assemble influence matrix for the unsteady panel method
% Arguments:
% o           Position of control points
% p           Normals to the camber line at the control point locations
% s           Position of vortices (both bound and shed)
% u           Far field velocity
% q           Vortex strengths
% Return value:
% r           Residual (n,1)


function [r]=residual(o,p, s, u,q)

n = length(p);
for i = n:-1:1
    sumVortex = 0;
    for j = n:-1:1
        sumVortex = sumVortex + q(j).*vortex(s(:,j),o(:,i));
    end
    r(i) = p(:,i)'*(u + sumVortex);
end
% preallocation naturally produces a row vector but matrix inverse solver
% requires a column vector, so transpose
r=r';
end
