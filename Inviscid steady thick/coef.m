% Function to evaluate influence coefficients of panel j onto panel i
% Influence coefficients are the derivatives of the normal and tangential
% velocities induced by the source and circulation components of panel j at
% the midpoint of panel i
% Arguments    x         Panel vertices
%              i         Panel where influence coefficients are desired
%              j         Panel exerting the influence
%              an        Derivative of the normal velocity on panel i with
%                        respect to the source strength of panel j
%              at        Derivative of the tangential velocity on panel i with
%                        respect to the source strength of panel j
%              bn        Derivative of the normal velocity on panel i with
%                        respect to the circulation strength of panel j
%              bt        Derivative of the tangential velocity on panel i with
%                        respect to the source strength of panel j

function [an,at,bn,bt] = coef(x,i,j)
 
% Determine midpoint, tangent and normal vectors of panel i
  [xm,t,n] = panel(x,i);
  
% Influence coefficients
  if( j ~= i )
% Evaluate induced velocity
      w = csrc1(x(:,j),x(:,j+1), xm);
% Source influence coefficients
      an= w'*n;
      at= w'*t;
% Vortex influence coefficients, note that it is enough to turn the induced
% velocity by 90o - why?

% vortex velocity is perpendicular to line connecting locus of panel j to
% panel i, whereas uniform source velocity is parallel. rotate source by 90
% to get vortex

      v=[-w(2);w(1)];
      bn= v'*n;
      bt= v'*t;
  else
      % try making an,bt negative if problem encountered
      % (Have a feeling the positive values are correct though)
      an=  -0.5;
      at=  0;
      bn=  0;
      bt=  -0.5;
  end

end

