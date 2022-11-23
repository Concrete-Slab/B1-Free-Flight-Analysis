% Function [v]=vortex(y,x)
% LdM Aug. 2022
% Biot-Savart law in two space dimensions
% Arguments:
% y           Position of vortex core (2xn matrix)
% x           Position where velocity vector is required (2,1 matrix)
% Return value:
% v           velocity vector (2xn matrix)
function [v] = vortex(y,x)
arguments
    y(2,:) double
    x(2,1) double
end

v = [(-x(2)+y(2,:)) ; x(1)-y(1,:)].*1./((x(1)-y(1)).^2+(x(2)-y(2)).^2);
   
end