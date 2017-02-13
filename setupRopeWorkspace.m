% setupRopeWorkspace
% ropeRigid
% [S, thetaDD] = solveEulerLagrange( L, theta, thetaD, t );
% thetaDDCompute = getThetaDDFunctionLinear( S, theta, thetaD, thetaDD )
% thetaSnapshots = simulate( initTheta, initThetaD, thetaDDCompute,
% numIterations, deltaT, timeSteps );


numRopeSegments = 30;
numIterations = 500;
deltaT = 0.02;
timeSteps = 10;

segmentLength = ones(numRopeSegments,1);
xPositions = sym('xPositions', [numRopeSegments, 1]);
yPositions = sym('yPositions', [numRopeSegments, 1]);

t = sym('t');