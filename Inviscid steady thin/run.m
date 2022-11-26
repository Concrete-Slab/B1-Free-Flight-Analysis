% Function [r]=run(n,u)
% LdM Aug. 2022
% Driver function for the steady thin aerofoil panel method
% Arguments:
% n           number of interals for discretization
% u           far field velocity.
% poly        polynomial coefficients for shape of airfoil
% Return value:
% r           Residual

function [x,o,p,s,q] = run(n,poly,u)

% construct aerofoil geometry
[x,o,p,s]=foil(n,poly);

% create storage for the unknown circulations & initialize to 0
q= zeros(size(o,2),1);

% evaluate residual
r= residual(o,p,s, u,q );

% evaluate influence coefficient
a= influence( o,p,s);

% solv and update q
q= q- a\r;
end

