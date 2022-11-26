B1 - Aerofoil Week 6 practical

This folder contains matlab scripts to perform the computations constant source/vorticity panel for thick aerofoils,
see notes at section 3.2.2.
The folder contains the following matlab scripts:

Geometric functions

nacaxxx.m:               function to compute the positions of panel vertices along the aerofoil surface
naca00xxc.m:             function to compute the camber line
naca00xxt.m:             function to compute the thickness distribution
panel.m:                 mid-point, normal and tangent vectors for panel i
run.m:                   driver function.

Influence coefficients, residuals

coef.m:                  Influence coefficients of panel j onto panel i
residual.m:              residual for the panel method equations (see Eq. 3.2)
influence.m:             aerodynamic influence matrix (see Eq. 3.4)

Induced velocity

csrc1.m:                 Velocity induced by a panel with unit and uniform source strenght, (See Eq. 3.10)

Please complete the function csrc1.m implementing Equation 3.10 in the notes. Please also write functions evaluating 
pressure coefficients based on Bernoulli's equation to produce plots of pressure coefficient to examine pressure distributions.
Plesae write a function using the computed pressures to obtain forces and moments around the aerofoil.
Produce graphs documenting the validity of your implementation.

