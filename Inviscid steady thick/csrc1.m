% Evaluate the induced velocity of a panel of uniform unit source strength 
% with endpoints x1 and x2
% Arguments              x1          Endpoint 1
%                        x2          Endpoint 2
%                        x           Location where induced velocity is
%                        required

function [w] = csrc1(x1,x2, x)

% Here you need to implement equation 3.10 from the handout
% You should treat x1,x2, x,w as vectors of length 2x1
w = 1/2*pi*[log( sqrt( ( (x(1)-x1(1))^2 + (x(2)-x1(2))^2 )/( (x(1)-x2(1))^2 + (x(2)-x2(2))^2 ) ) ) ; atan(()) ]

end
