% Create a test motion for the aerofoil composed of
% - constant  velocity travel of the centre of mass
% - constant rate rotation around centre of mass up to a fixed time tmax

% Arguments  t      time since start of flight
%            y      Centre of mass position of aerofoil (2x1)
%            theta  Angular position of aerofoil (1x1)

function [y,theta] = motion( t )

    tmax=1;  

    y= [0;0];
    y(1)= t*15;
    y(2)= t*0.1;
    if( t < tmax )
       theta= 0.1*t;
    else
       theta= 0.1*tmax;
    end
           
end

