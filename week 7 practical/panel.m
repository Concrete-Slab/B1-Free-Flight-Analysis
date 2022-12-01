function [xm,t,n] = panel(x,i)

  xm= 0.5*( x(:,i)+x(:,i+1) );
  t= x(:,i+1)-x(:,i);
  l= sqrt(t'*t);
  t= 1./l.*t;
  n=[t(2);-t(1)];

 end

