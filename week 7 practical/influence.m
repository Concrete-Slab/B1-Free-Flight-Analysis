% Function [a]=influence(x)
% LdM Aug. 2022
% Assemble influence matrix for the steady panel method
% Arguments:
% x           Vertices
% Return value:
% a           Influence matrix


function [a]=influence(x)

% number of control points
   n=size(x,2);
   n= n-1;

   a= zeros(n+1,n+1);
   
   %Impermeability at the wall
   for i=1:n
      for j=1:n
         [an,~,bn,~]= coef(x,i,j);
          a(i,  j)= an;
          a(i,n+1)= a(i,n+1)+ bn;
      end
   end
   
   %Kutta condition
    for j=1:n
        i=1;
       [~,at,~,bt]= coef(x,i,j);
        a(n+1,  j)= a(n+1,  j)+ at;
        a(n+1,n+1)= a(n+1,n+1)+ bt;
        i=n;
       [~,at,~,bt]= coef(x,i,j);
        a(n+1,  j)= a(n+1,  j)+ at;
        a(n+1,n+1)= a(n+1,n+1)+ bt;
    end
   
   
end
