
% Example program usage:
%   setupRopeWorkspace
%   ropeRigid
%   [S, thetaDD] = solveEulerLagrange( L, theta, thetaD, t );
%   thetaDDCompute = getThetaDDFunctionLinear( S, theta, thetaD, thetaDD )
%   thetaSnapshots = simulate( initTheta, initThetaD, thetaDDCompute,
%   numIterations, deltaT, timeSteps );


numRopeSegments = 15;
numIterations = 500;
deltaT = 0.02;
timeSteps = 10;

disp('In setupRopeWorkspace:')
fprintf('\t%d rope segments\n', numRopeSegments);
fprintf('\t%f*%d = %f seconds per frame in simulation\n', ...
    deltaT, timeSteps, deltaT * timeSteps);

segmentLength = ones(numRopeSegments,1);
xPositions = sym('xPositions', [numRopeSegments, 1]);
yPositions = sym('yPositions', [numRopeSegments, 1]);

t = sym('t');