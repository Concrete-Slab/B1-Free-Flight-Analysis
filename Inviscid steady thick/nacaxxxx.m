% Function to construct four digits NACA aerofoil profiles
% See https://www.nasa.gov/image-feature/langley/100/naca-airfoils for more
% information
% Arguments             n      Number of subdivisions along the camber line
%                       t      Thickness
%                       m      Height of maximum camber
%                       p      Position of maximum camber
%                       
function [x] = nacaxxxx(n, t,m,p)

% Create a discretization for the camber line

    z= zeros(n+1,1);
    for i=1:n+1
        u= i-1;
        u= u/n;
        u= u*pi;

%     u= -cos(u);
%     u= u+1.;
%     u= u*0.5;

        u= u*0.5;
        u= cos(u);
        u= 1-u;

        z(i)= u;
    end

% Create the thickness distribution 
    [y,~ ] = naca00xxt( z,t );

% Create camber line
    [w,dw] = naca00xxc( z,m,p );

% Create panel coordinates
    x= zeros(2,2*n+1);
    for i=1:n


       j= n+2-i;
       fprintf( "( %d %d) from %d % 9.3e\n", i,2*n+2-i, n+2-i, w(j) );

% Find direction normal to the tangent line
       v= [1.;dw(j)];
       q=sqrt(v'*v);
       v=-1./q*v;
       s= [-v(2);v(1) ];

% Construct aerofoil by offsetting camber line along the normal by amount
% dictated by thickness
       r= [z(j);w(j)];
       x(:,i)= r+ s*y(j); 
       x(:,2*n+2-i)= r-s*y(j);
    end

% Leading edge
    x(1,n+1)= 0;
    x(2,n+1)= 0;


end 
