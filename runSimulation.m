

if ~exist('SIMULATION_DEFINED', 'var') || ~SIMULATION_DEFINED,
    % Number of rope segments.
    numAngles = 10;

    % Gravity.
    g = 9.8;

    % Symbol for time.
    t = sym('t');

    % Symbol for each angle and its derivative.
    theta = sym('theta', [numAngles, 1]);
    thetaD = sym('thetaD', [numAngles, 1]);

    % Symbol for the position of each point.
    xPositions = sym('xPositions', [numAngles, 1]);
    yPositions = sym('yPositions', [numAngles, 1]);


    % Basic assumptions (every number is real).
    assume(t, 'real');
    assume(theta, 'real');
    assume(thetaD, 'real');
    assume(xPositions, 'real');
    assume(yPositions, 'real');


    % Define the x and y position functions.
    for i = 1:numAngles,
        if i > 1,
            xPositions(i) = xPositions(i-1) + cos(theta(i));
            yPositions(i) = yPositions(i-1) + sin(theta(i));
        else
            xPositions(i) = cos(theta(i));
            yPositions(i) = sin(theta(i));
        end
    end

    % The total position vector for simplicity.
    position = [xPositions ; yPositions];
    ySelect = ((1:2*numAngles) > numAngles)';


    % The mass of each point is 1.
    M = eye(2*numAngles);


    % The derivative of position wrt theta.
    dP = diffVV(position, theta);

    % The total velocity vector.
    velocity = dP * thetaD;


    disp('Computing Lagrangian...');
    L = getRopeLagrangian(position, velocity, M, g, ySelect, theta);
    [eqn, thetaDD] = solveEulerLagrange(L, theta, thetaD, t);

    disp('Solving for thetaDD...');
    [A,b] = equationsToMatrix(eqn, thetaDD);
    A = simplify(A);
    b = simplify(b);
    SIMULATION_DEFINED = true;
end


% The state of the rope (position + velocity).
angles = zeros(numAngles,1);
anglesD = zeros(numAngles,1);


deltaT = 0.01;
numIterations = numSeconds / deltaT;

thetaSnapshots = zeros(numIterations, length(theta));


Ahandle = matlabFunction(A);
bhandle = matlabFunction(b);


disp('Beginning simulation....');
for i = 1:numIterations,
    
    argACell = num2cell(angles');
    argBCell = num2cell([angles' anglesD']);
    
    
    numA = Ahandle(argACell{:});
    numB = bhandle(argBCell{:});
    
    anglesDD = linsolve(numA,numB);
    
    angles = angles + deltaT * anglesD + .5 * deltaT^2 * anglesDD;
    anglesD = anglesD*(1-(1-dragCoefficient)*deltaT) + deltaT * anglesDD;
    
    thetaSnapshots(i,:) = angles;
    
    if mod(i,20) == 0,
        fprintf('%d / %d\n', i, numIterations);
    end
end
disp('Done!');