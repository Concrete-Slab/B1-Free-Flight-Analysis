% Generate camber line distribution and its slope
% See https://www.nasa.gov/image-feature/langley/100/naca-airfoils
% Arguments             n      Number of subdivisions along the camber line
%                       x      Locations where camber line data are needed
%                       m      Height of maximum camber
%                       p      Position of maximum camber
%                       y      Height of the camber line
%                       dy     Slope of the camber line


function [y,dy] = naca00xxc( x,m,p )

n=size(x,1);

y= zeros(n,1);
dy=zeros(n,1);

for i=1:n
    
    z= x(i);
    
% Camber line is made of two parabolic segments to the left and to the
% right of p
    if( z < p )
        
      f= m/(p*p);
      y(i)=   2.*p*z- z*z;
      dy(i)=  2.*p- 2.*z;
      
    else     
      f= 1./(1.-p);
      f= f*f;
      f= f*m;
            
      y(i)= (1-2*p)+ 2.*p*z- z*z;
      dy(i)=         2.*p- 2.*z;
         
    end

% Rescale to desired height
    y(i)= y(i)*f;
    dy(i)= dy(i)*f;

end

