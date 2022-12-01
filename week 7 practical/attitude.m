function [x1] = attitude(y,theta, x)
% Compute the new coordinates of the aerofoil given the position of the
% center of mass y and the incidence angle
% Arguments               y         position of centre of mass (2x1)
%                         theta     incidence angle
%                         x         positions of aerofoil vertices in 
%                                   local frame of reference
%                         x1        positions of aerofoil vertices in
%                                   absolute frame


n= size(x,2);
c= cos(theta);
s= sin(theta);
for i=n:-1:1
    x1(i,1)= x(i,1)*c+ x(i,2)*s+y(1);
    x1(i,2)=-x(i,1)*s+ x(i,2)*c+y(2);
end
end

