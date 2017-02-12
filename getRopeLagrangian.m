function [ L ] = getRopeLagrangian( positions, velocities, massMatrix, g, ySelect, theta )
%GETLAGRANGIAN Returns the Lagrangian of the rope.

T = .5 * (sqrt(massMatrix) * velocities)' * (sqrt(massMatrix) * velocities);
U = g * ySelect' * massMatrix * positions;

L = T - U;

end

