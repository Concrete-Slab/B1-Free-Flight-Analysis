% Evaluate the induced velocity of a panel of uniform unit source strength 
% with endpoints x1 and x2
% Arguments              x1          Endpoint 1
%                        x2          Endpoint 2
%                        x           Location where induced velocity is
%                        required

function [w] = csrc1(x1,x2, x)

% Here you need to implement equation 3.10 from the handout
% You should treat x1,x2, x,w as vectors of length 2x1
t = (x2-x1)/norm(x2-x1);
R = [t(1) -t(2);t(2) t(1)];
x2 = R\x2;
x1 = R\x1;
x = R\x;
u = 1/2 * log(((x(1)-x1(1))^2+(x(2)-x1(2))^2)/((x(1)-x2(1))^2 + (x(2)-x2(2))^2));
%v =  atanamend((x(2)-x2(2))/(x(1)-x2(1))) - atan((x(2)-x1(2))/x(1)-x1(1));
i = sqrt(-1);
delX2 = x-x2;
delX1 = x-x1;
v = angle(delX2(1) + i*delX2(2)) - angle(delX1(1) + i*delX1(2));
w = R*[u;v];
end
