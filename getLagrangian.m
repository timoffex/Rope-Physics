function [ L ] = getLagrangian( positions, velocities, massMatrix, g, ySelect )
%GETLAGRANGIAN Returns the Lagrangian of the system with the given
%position and velocity functions. The mass matrix is a diagonal matrix with
%a mass entry corresponding to each position/velocity index. ySelect is a
%column vector with a 1 for every i such that positions(i) is a y
%coordinate.

T = .5 * (sqrt(massMatrix) * velocities)' * (sqrt(massMatrix) * velocities);
U = -g * ySelect' * massMatrix * positions;

L = T - U;

end

