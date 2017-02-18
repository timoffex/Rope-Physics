%% Setup variables.
setupRopeWorkspace

%% This will give us 100 seconds of simulation.
numIterations = 5000;
deltaT = 0.02;
timeSteps = 10;


%% Configure the physics.

% Configure the rigid rope physics. This will create the L variable
% (the Lagrangian).
disp('Configuring rope physics..');
ropeRigid

% S==0 is the Euler-Lagrange equation for the system. S==-force makes the
% system be affected by a force (roughly). thetaDD is just the symbol for
% the second time derivative of theta.
disp('Computing Euler-Lagrange..');
[S, thetaDD] = getEulerLagrange( L, theta, thetaD, t );


%% Solve the linear system (assuming it is linear!).
disp('Getting A and b from the linear system.');
[A,b] = equationsToMatrix(S==0.2*thetaD, thetaDD);

%% Simplify A and b.
% This takes a long time (~6 mins if numRopeSegments == 30), but without it
% simulate would take a LOT longer and it would be impossible to
% re-simulate with different starting parameters.


disp('Simplifying A and b. This can take a couple of minutes!');
A = simplify(A);
b = simplify(b);

%% Create a matlab function for thetaDD.
% thetaDDCompute is a function that takes (theta, thetaD) as arguments and
% spits out thetaDD. Use getThetaDDFunctionLinear if the system is in the
% form A*thetaDD = b.
disp('Solving for thetaDD..');
thetaDDCompute = getThetaDDFunctionLinear(theta, thetaD, A, b );

%% Simulate the system.
disp('Simulating..');
thetaSnapshots = simulate( initTheta, initThetaD, thetaDDCompute, ...
    numIterations, deltaT / timeSteps, timeSteps );

disp('To playback, type')
disp('   playbackSnapshots')
disp('To avoid recomputing rope positions, type')
disp('   playbackSnapshotsRender')