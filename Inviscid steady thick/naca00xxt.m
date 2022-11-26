function [y,dy] = naca00xxt( x,t )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

     n= size(x,1);
     y= zeros(n,1);
    dy= zeros(n,1);


    a= [ 0.2969; -0.1260; -0.3516; 0.2843; -0.1015 ];
    s= sum(a);
    a(5)= a(5)-s;
    
    f= 5.*t;
    
    for i=1:n

        z= x(i);
       z2= sqrt(z);

       y(i)=   a(1)*z2+ z*( a(2)+ z*(    a(3)+ z*(    a(4)+ z*   a(5) ) ) );
       dy(i)= 0.5*a(1)/z2+  a(2)+ z*( 2.*a(3)+ z*( 3.*a(4)+ z*4.*a(5) ) );

       y(i)=  f*y(i);
       dy(i)= f*dy(i);

    end
end

