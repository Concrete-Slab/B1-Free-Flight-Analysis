% Evaluate the induced velocity of a panel of uniform unit source strength 
% with endpoints x1 and x2
% Arguments              x1          Endpoint 1
%                        x2          Endpoint 2
%                        x           Location where induced velocity is
%                        required

function [w] = csrc1(x1,x2, x)

% Here you need to implement equation 3.10 from the handout
% You should treat x1,x2, x,w as vectors of length 2x1
t = (x2-x1)/norm(x2-x1);
R = [t(1) -t(2);t(2) t(1)]; % rotation matrix (t is unit vector)
x2 = R\x2;
x1 = R\x1;
% first rotate x into the frame of reference where x2 -> x1 is horizontal
x = R\x;
% apply the velocity transform as a function of position
u = 1/2 * log(((x(1)-x1(1))^2+(x(2)-x1(2))^2)/((x(1)-x2(1))^2 + (x(2)-x2(2))^2));
% inverse tan does not reflect the [-pi,pi] nature of angles.
% convert the 2d vectors into complex numbers, and find their arguments
i = sqrt(-1);
delX2 = x-x2;
delX1 = x-x1;
v = angle(delX2(1) + i*delX2(2)) - angle(delX1(1) + i*delX1(2));
% rotate back into the original frame of reference
w = R*[u;v]./(2*pi);
end

% Evaluate the induced velocity of a panel of uniform unit source strength 
% with endpoints x1 and x2
% Arguments              x1          Endpoint 1
%                        x2          Endpoint 2
%                        x           Location where induced velocity is
%                        required

% % % function [w] = csrc1(x1,x2, x)
% % % 
% % % % Tangent vector to the panel
% % % s= x2-x1;
% % % d= sqrt(s'*s);
% % % s= 1./d*s;
% % % 
% % % % Normal vector to the panel
% % % t=[-s(2);s(1)];
% % % 
% % % % Positon of point 2 in the s-t frame of reference
% % % z1=  s'*(x2-x1);
% % %      
% % % % Coordinates of x in the s-t frame of reference
% % % z=  [s'*(x-x1);
% % %      t'*(x-x1)];
% % %  
% % % % Evaluate velocities in the s-t frame of reference
% % % [u,v] = csrc0(0.,z1, z(1),z(2));
% % % 
% % % % Transform back
% % % w = u*s + v*t;
% % % 
% % % end
% % % 
