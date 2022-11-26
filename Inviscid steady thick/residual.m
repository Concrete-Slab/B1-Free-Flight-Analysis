% Function to evaluate residual
% Arguments        x      Panel vertices
%                  u      Far field velocity vector
%                  q      Sources and circulation

function [r]=residual(x,u,q)

% number of control points
   n=size(x,2);
   n= n-1;

   r= zeros(n+1,1);
   
   %compatibility at the wall
   for i=1:n
     [~,~,n0] = panel(x,i);
      r(i)= n0'*u;
      for j=1:n
         [an,~,bn,~]= coef(x,i,j);
          r(i)= r(i)+ an*q(  j);
          r(i)= r(i)+ bn*q(n+1);
      end
   end
   
   %Kutta condition
   [~,t0,~] = panel(x,1);
   [~,t1,~] = panel(x,n);

    r(n+1)= t0'*u+ t1'*u;
    for j=1:n
        i=1;
       [~,at,~,bt]= coef(x,i,j);
        r(n+1)= r(n+1)+ at*q(  j);
        r(n+1)= r(n+1)+ bt*q(n+1);
        i=n;
       [~,at,~,bt]= coef(x,i,j);
        r(n+1)= r(n+1)+ at*q(  j);
        r(n+1)= r(n+1)+ bt*q(n+1);
    end
   
   
end
