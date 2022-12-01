% Driver function for thick aerofoil solution
% Arguments  n      Number of subdivisions along the camber line
%            t        Thickness
%            m        Height of maximum camber
%            p        Position of maximum camber
%            u        Free stream velocity vector
%            x        Panel vertices
%            q        Sources & circulation

function [x,q] = run(n, t,m,p, u)

% Initialize sources and circulation vector
 q= zeros(2*n+1,1); % why 2n+1?
 % 2n+1 because n is number of subdivisions on wing. This means for each
 % subdivision there is a panel above and below, hence the multiplying by 2

 % hence this n is different to the n used internally in other functions

% Generate aerofoil
[x]= nacaxxxx(n, t,m,p);

% Build aerodynamic influence matrix
[a]= influence(x);

% Evaluate residual
[r]= residual(x,u,q);

% Solve the potential flow problem
 q= q- a\r;
end

