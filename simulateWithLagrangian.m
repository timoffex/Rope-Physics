function [ valueSnapshots ] = simulateWithLagrangian( L, theta, thetaD, t, deltaT, numIterations, timeSteps, initValues, initValuesD )
%SIMULATEWITHLAGRANGIAN Simulates the system and returns a matrix of
%snapshots with size [numIterations, length(theta)]
%   
%   L should represent the Lagrangian of the system as a function of theta
%   and thetaD
%   
%   t is the symbol for time
%   deltaT is the time interval to use during the simulation
%   numIterations is the number of iterations to perform

disp('Computing Euler-Lagrange equation...');
[eqn, thetaDD] = solveEulerLagrange(L, theta, thetaD, t);

disp('Solving for thetaDD...');
[A,b] = equationsToMatrix(eqn, thetaDD);
A = simplify(A);
b = simplify(b);


values = initValues;
valuesD = initValuesD;


valueSnapshots = zeros(numIterations, length(theta));


Ahandle = matlabFunction(A, 'Vars', [theta' thetaD' t]);
bhandle = matlabFunction(b, 'Vars', [theta' thetaD' t]);

time = 0;

disp('Beginning simulation....');
for i = 1:numIterations,
    
    for tstep = 1:timeSteps,
        argACell = num2cell([values' valuesD' time]);
        argBCell = num2cell([values' valuesD' time]);


        numA = Ahandle(argACell{:});
        numB = bhandle(argBCell{:});

        valuesDD = linsolve(numA,numB);

        values = values + deltaT * valuesD + .5 * deltaT^2 * valuesDD;
        valuesD = valuesD + deltaT * valuesDD;
    end
    
    valueSnapshots(i,:) = values;
    
    if mod(i,20) == 0,
        fprintf('%d / %d\n', i, numIterations);
    end
    
    time = time + deltaT;
end
disp('Done!');


end

