y = [0;0];
theta = linspace(0,2*pi,50);
x = [sin(theta) ; cos(theta)];
v = vortex(y,x);

quiver(x(1,:),x(2,:),v(1,:),v(2,:))