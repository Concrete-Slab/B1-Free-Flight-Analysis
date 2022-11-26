function [x,o,p,s] = foil(n,poly)
% Function [a,r]=foil(n)
% LdM Aug. 2022
% Assemble aerofoil camber line geometry.
% Arguments:
% n           Number of panels
% poly        polynomial coefficients for the chord to follow
% Return value:
% x           Position of grid coordinates (n+1,1)
% o           Position of control points (2,n)
% p           Normals to camber line at the control point locations (2,n)
% s           Position of vortices (both bound and shed) (2,n)
arguments(Input)
    n(1,1) double
    poly(1,:) double = 0
end
arguments(Output)
    x(2,:) double
    o(2,:) double
    p(2,:) double
    s(2,:) double
end

    o= zeros(2,n);
    p= zeros(2,n);
    s= zeros(2,n);

    % grid coordinates

    xvals = linspace(0,1,n+1);
    x = [xvals;polyval(poly,xvals)];

    for i=1:n

    % control point  
       o(1,i)= 0.75*x(1,i+1)+0.25*x(1,i);
       o(2,i)= interp1(x(1,:),x(2,:),o(1,i));

    % normal vector
       delX = x(:,i+1)-x(:,i);
       p(1,i)= -delX(2);
       p(2,i)= delX(1);
       p(:,i) = p(:,i)/norm(p(:,i));

    % vortex point   
       s(1,i)= 0.25*x(1,i+1)+0.75*x(1,i);
       s(2,i)= interp1(x(1,:),x(2,:),s(1,i));

    end

% maybe change to s(2,:) = polyval ... later for matrix efficiency?

end