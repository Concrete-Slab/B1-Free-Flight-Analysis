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


function [cp,cf,cm,v]=forces(x,o,u,p,s,q)

% Plese insert here operations computing cp,cf,cm starting from x,o,u,q


n = length(o);
for i = n:-1:1
    t = x(:,i+1)-x(:,i);
    t = t/norm(t);
    w = vortex(s,o(:,i))*q + u ;
    v(i) = w'*t;
end

uAbove = v + q';
uBelow = v - q';

v = [uBelow,uAbove];
cp = (norm(u)^2-v.^2)/norm(u)^2;
pCyclic = [p -flip(p,2)];
oCyclic = [o flip(o,2)];
xCyclic = [x flip(x(:,1:n),2)];
%com = sum(x.*(x-x(:,1)),2)./sum(x,2)
cf = 0;
cm = 0;
intrDr = 0;
for i = 1:(size(xCyclic,2)-1)
    dx = xCyclic(:,i+1)-xCyclic(:,i);
    df = cp(i).*norm(dx).*(-pCyclic(:,i));
    intrDr = intrDr + xCyclic(:,i).*dx;
    r = oCyclic(:,i);
    % "2d cross product"
    dm = df(2)*r(1)-df(1)*r(2);
    cf = cf + df;
    cm = cm + dm;
end
deltaX = x(1,end)-x(1,1);
deltaY = x(2,end)-x(2,1);
if deltaY == 0 && deltaX == 0
    com = [0;0];
elseif deltaY == 0
    com = [intrDr/deltaX ; 0];
elseif deltaX == 0
    com = [0 ; intrDr/deltaY];
else
    com = [intrDr(1)/deltaX; intrDr(2)/deltaY];
end
% moment has only been measured around origin
% we need to subtract the moment from the net force acting at the com
cm = cm-(com(1)*cf(2)-cf(1)*com(2));

cf = cf./deltaX; % divide by characteristic area: unity x chord length
cm = cm./deltaX./deltaX; % divice cm by characteristic area x chord length