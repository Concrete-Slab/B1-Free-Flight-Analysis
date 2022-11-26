close all

% Define simulation parameters
theta = 5; % angle of attack (degrees)
n = 100; % number of control points
poly = [0 0]; % polynomial coefficients for wing camber
nXField = 500; % number of x grid points
nYField = nXField; % number of y grid points


uinf = [cos(theta*pi/180);sin(theta*pi/180)]; % far field velocity

% run the simulation
[x,o,p,s,q] = run(n,poly,uinf);
% interesting: if -q is flipped, the solution is valid if camber is linear, but turning is
% centered at trailing edge instead of leading edge

%q = -flip(q);
if ~checksoln(o,p,uinf,s,q) % check the impermeance condition
    warning("Solution has non-negligible residuals")
end


% preallocate velocity field
xu = linspace(-1.5,2.5,nXField); % x grid points
yu = linspace(-1.5,1.5,nYField); % y grid points
[X,Y] = meshgrid(xu,yu); % full mesh, X and Y as matrices with repeated columns/rows
uField = zeros(length(yu),length(xu),2); % grid velocity field
controlVel = zeros(2,n); % velocity at each control point
for i = 1:length(xu)
    for j = 1:length(yu)
        pos = [xu(i);yu(j)]; % position in grid
        uField(j,i,:) = uinf + vortex(s,pos)*q; % velocity at position
    end
end
for i = 1:n
    controlVel(:,i) = uinf + vortex(s,o(:,i))*q; % velocity at ith control point
end

%% Plot results

figure
tiledlayout(1,2)
nexttile
%quiver(o(1,:),o(2,:),p(1,:),p(2,:),"AutoScaleFactor",0.1)
hold on
uFieldNorm = sqrt(uField(:,:,1).^2 + uField(:,:,2).^2);
[C,h] = contourf(X,Y,uFieldNorm,20);
h.EdgeAlpha = 0;
%plot(o(1,:),o(2,:),'rx')
%plot(s(1,:),s(2,:),'b*')
plot(x(1,:),x(2,:),'k')
quiver(X,Y,uField(:,:,1),uField(:,:,2))

%quiver(o(1,:),o(2,:),controlVel(1,:),controlVel(2,:),AutoScaleFactor=0.2)
[cp,cf,cm] = forces(x,o,uinf,p,s,q);
% shift cf into frame of reference of velocity field
cf = [cos(theta*pi/180) sin(theta*pi/180) ; -sin(theta*pi/180) cos(theta*pi/180)]*cf
cm % cm does not require coordinate transform as it is invariant to 2d rotation

hold off
nexttile
hold on
plot(o(1,:),cp(1:n),DisplayName="Below camber line")
plot(o(1,:),cp(n+1:end),DisplayName="Above camber line")
legend("show")
hold off