function [x,o,p,s] = foil(n)
% Function [a,r]=foil(n)
% LdM Aug. 2022
% Assemble aerofoil camber line geometry.
% Arguments:
% n           Number of panels
% Return value:
% x           Position of grid coordinates (n+1,1)
% o           Position of control points (2,n)
% p           Normals to camber line at the control point locations (2,n)
% s           Position of vortices (both bound and shed) (2,n)

    x= zeros(n+1,1);
    o= zeros(2,n);
    p= zeros(2,n);
    s= zeros(2,n);

    % grid coordinates

    for i=1:n+1
        t= i-1;
        t= t/n;
        x(i)= t;
    end

    for i=1:n

    % control point    
       o(1,i)= 0.75*x(i+1)+0.25*x(i);
       o(2,i)= 0.;

    % normal vector
       p(1,i)= 0.;
       p(2,i)= 1.;

    % vortex point   
       s(1,i)= 0.25*x(i+1)+0.75*x(i);
       s(2,i)= 0.;

    end


end