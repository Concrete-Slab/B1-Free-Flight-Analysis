% Driver function for thick aerofoil solution
% Arguments  n      Number of subdivisions along the camber line
%            t        Thickness
%            m        Height of maximum camber
%            p        Position of maximum camber
%            u        Free stream velocity vector
%            x        Panel vertices
%            q        Sources & circulation
%            dt       Time step for time integration
%            tlim     Final time for integration

function [x,q] = run(n, t,m,p, u,dt,tlim )



% Initialize sources and circulation vector
 
 qw= zeros(10000000,1);       % vector with shed vortex strengths
 xw= zeros(10000000,2);       % vector with shed vortex positions

% Generate aerofoil
y= [0;0];                     % initial position of centre of mass
theta=0;                      % initial value of incidence

[x]= nacaxxxx(n, t,m,p);
[x1] = attitude(y,theta, x);


% Build aerodynamic influence matrix
[a]= influence(x);                                    % note steady part of aerodynamic influence matrix never changes
r= zeros(2*n+1,1);






% time integration starts

time=0;                                             % physical time
k= 0;                                               % time step counter

while time < tlim

    
    
% positions of panel vertices and shed vortex cores



    x0= x1;                                         % save old position


    [y,theta]= motion(time);                        % update position of centre of mass & angular position of aerofoil
    [x1] = attitude(y,theta, x);                    % new positions of panel vertices

    dx= x1-x0;
    dx= dx/dt;                                      % time derivatives of the panel vertices
    
% update positions of shed vortices (note only far field velocity affects these
    for h=1:k
        xw(h,:)= xw(h,:)+ dt*u;
    end
        
    
    
    
% assemble residual for unsteady problem - the following lines have a very  similar purpose to your old "residual" function, but use velocities due
% not only to the far field but also to the motion of the aerofoil itself
     
% normal velocities induced by the motion of the aerofoil
    
    for i=1:2*n
        [~,~,np]=panel(x1,i);
        vp= 0.5*( dx(i,:)+dx(i+1,:) );
        vp= vp- u;
        r(i)= np'*vp;                                  % note minus sign: the source and vortex strength will create a velocity field which cancels the normal component
    end
    

% normal velocities induced by old sections of the wake
    for h=1:k
        for i=1:2*n
           [xp,~,np]= panel( x1,i );                 % note normals evaluated at most recent position
           [v]= vortex( xw(h,:), xp );
           r(i)= r(i)- qw(h)*(np'*v);                 % note minus sign: the source and vortex strength will create a velocity field which cancels the normal component
        end
    end
    
    
    
% assemble the sections of the aerodynamic influence matrix due to the shed  vorticity
% velocities induded by vortex of unit strength located at new wake vortex position


    a1= zeros(2*n+1,1);
    a2= zeros(2*n+1,1);
    for i=1:2*n
        
        % plesae complete this loop by inserting appropriate lines to
        % perform the following operations:
        
        % evaluate midpoint, tangent and normal of panel i, using the most recent panel vertex positions
        
        % estimate the position of the newest shed vortex
        
        % evaluate the velocity induced by this vortex (assumed for now of unit strength on panel i: store this value at the appropriate entry in a1
        
        % evaluate the contribution of panel i to the time derivative of the circulation around the aerofoil and accumulate this contribution on the entry 2*n+1 of a2;
      
    end
    a2(2*n+1)= a2(2*n+1)/dt;
    a3= 1./dt;

    
% assemble complete influence matrix
     aa= [ a, a1; a2', a3 ];
     rr= [ r; 0 ];
     
% Solve the unsteady problem for one time step

     qq= aa\rr;
     q= qq(1:2*n+1);
     
% save
     qw(k+1)= qq(2*n+2);  
     xw(k+1,:)= xm(1,:);                              

     k= k+1;
     time= time+dt;
end

