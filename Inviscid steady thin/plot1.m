% function plot1(x, s,q)
% LdM Aug. 2022
% Plot vorticity distribution
% Arguments:
% x           Position of corner points
% s           Position of vortices (both bound and shed)
% q           Vortex strengths
% Return value:


function plot1(x, s,q)

% determine problem size
    n= size(x,1);
    n= n-1;

% determine pension fund size
    dx= zeros(n,1);
    for i=1:n
        dx(i)= x(i+1)-x(i);
    end

% figure bit
    plot( s(1,1:n),q(1:n)/dx );

end
