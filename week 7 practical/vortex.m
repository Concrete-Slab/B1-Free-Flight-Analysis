% Function [v]=vortex(y,x)
% LdM Aug. 2022
% Biot-Savart law in two space dimensions
% Arguments:
% y           Position of vortex core (2x1 matrix)
% x           Position where velocity vector is required (2x1 matrix)
% Return value:
% v           velocity vector (2x1 matrix)
function [v] = vortex(y,x)
   r= x-y;
   d= 1./(r'*r);
   v= [r(2);-r(1)];
   v= v*d;
end