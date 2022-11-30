% Evaluate the induced velocity of a panel of uniform unit source strength 
% with endpoints x1 and x2
% Arguments              x1          Endpoint 1
%                        x2          Endpoint 2
%                        x           Location where induced velocity is
%                        required

function [w] = csrc1(x1,x2, x)

% Tangent vector to the panel
s= x2-x1;
d= sqrt(s'*s);
s= 1./d*s;

% Normal vector to the panel
t=[-s(2);s(1)];

% Positon of point 2 in the s-t frame of reference
z1=  s'*(x2-x1);
     
% Coordinates of x in the s-t frame of reference
z=  [s'*(x-x1);
     t'*(x-x1)];
 
% Evaluate velocities in the s-t frame of reference
 [u,v] = csrc0(0.,z1, z(1),z(2));
 
% Transform back
 w=u*s+ v*t;

end
