% Function [cp,cf,cm]=forces(x,o,u,q)
% LdM Aug. 2022
% Assemble influence matrix for the unsteady panel method
% Arguments:
% x           Position of panel vertices (n+1,1)
% o           Positions of control points (2,n)
% u           Far field velocity (1,1)
% q           Vortex strengths (n,1)
% Return value:
% cp          Pressure coefficient (1,2n)
% cf          Force coefficient (
% cm          Moment coefficient


function [cp,cf,cm,v]=forces(x,o,u,s,q)

% Plese insert here operations computing cp,cf,cm starting from x,o,u,q

t = [1;0];
n = length(o);
for i = n:-1:1
    w = vortex(s,o(:,i))*q + u ;
    v(i) = w'*t;
end

uAbove = v + q';
uBelow = v - q';

v = [uBelow,uAbove];
cp = (norm(u)^2-v.^2)/norm(u)^2;
cf = 0;
cm = 0;
