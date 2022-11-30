B1 - Aerofoil Week 7 practical

This folder contains matlab scripts to perform the computations constant source/vorticity panel for thick aerofoils in unsteady motion,
see notes at section 3.2.3.
The folder contains the following matlab scripts:

Geometric functions

nacaxxx.m:               function to compute the positions of panel vertices along the aerofoil surface
naca00xxc.m:             function to compute the camber line
naca00xxt.m:             function to compute the thickness distribution
panel.m:                 mid-point, normal and tangent vectors for panel i
attitude.m:              transform the panel vertex coordinates from local frame of reference to global frame of reference



Influence coefficients, residuals

coef.m:                  Influence coefficients of panel j onto panel i
influence.m:             aerodynamic influence matrix (see Eq. 3.4)

Induced velocities

csrc1.m:                 Velocity induced by a panel with unit and uniform source strenght, (See Eq. 3.10)
csrc0.m:                 Velocity induced by a panel with unit and uniform source strenght placed on the x-axis
vortex.m                 Velocity induced by a concentrated vortex

Driver

run.m:                   driver function. This function is a modification of the one you used for the week 6 practical.
                         The function is modified with provisions for the storage and update of wake vortices and their strengths.
                         Furthermore, the function contains operations to evaluate the velocities induced by the wake vortices.

Please complete the function run.m implementing the evaluation of velocities induced by the first wake vortex. 
Produce graphs documenting the validity of your implementation.

