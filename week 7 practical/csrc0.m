% Function to evaluate the induced velocity of a uniform unit source
% distribution located on the x-axis between points x0 and x1 at location
% x,z
% Arguments         x0          Left end of the source distribution
%                   x1          Right end
%                   x           x-coordinate of the point where velocity is
%                               desired
%                   z           y-coordinate of the point where velocity is
%                               desired
%                   u           Horizontal velocity component
%                   v           Vertical velocity component
function [u,v] = csrc0(x0,x1, x,z)

f= 2.*pi;
f= 1./f;

dx1= x-x1;
dx0= x-x0;

a= dx0*dx0+ z*z;
b= dx1*dx1+ z*z;


u= 0.5*f*log(a/b);
v=     f*(atan2(z,dx1)-atan2(z,dx0));
end

