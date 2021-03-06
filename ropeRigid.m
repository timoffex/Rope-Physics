% Defines theta and thetaD, and updates xPositions and yPositions to
% simulate a rigid, unstretchable rope. Stores the Lagrangian in L.
%	theta will have an entry for every angle, and xPositions/yPositions will
%	depend only on the angle of each rope segment.
%   Assumes:
%       length(xPositions) = numRopeSegments
%       length(yPositions) = numRopeSegments

theta = sym('theta', [numRopeSegments, 1]);
thetaD = sym('thetaD', [numRopeSegments, 1]);

initTheta = zeros(size(theta));
initThetaD = zeros(size(thetaD));

assume(theta, 'real');
assume(thetaD, 'real');


xPositions(1) = segmentLength(1) * cos(theta(1));
yPositions(1) = segmentLength(1) * sin(theta(1));

for i = 2:numRopeSegments,
    xPositions(i) = xPositions(i-1) + segmentLength(i) * cos(theta(i));
    yPositions(i) = yPositions(i-1) + segmentLength(i) * sin(theta(i));
end


position = [xPositions;yPositions];
velocity = diffVV(position, theta) * thetaD;


T = .5 * (velocity') * velocity;
U = 9.8 * (1:2*numRopeSegments > numRopeSegments) * position;

L = T - U;