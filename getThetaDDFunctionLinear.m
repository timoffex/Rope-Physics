function [ thetaDDCompute ] = getThetaDDFunctionLinear( S, theta, thetaD, thetaDD )
%GETTHETADDFUNCTION Summary of this function goes here
%   Detailed explanation goes here


[A,b] = equationsToMatrix(S==0, thetaDD);

numA = matlabFunction(simplify(A), 'Vars', [theta; thetaD]);
numB = matlabFunction(simplify(b), 'Vars', [theta; thetaD]);

opts.SYM = true;
thetaDDCompute = @(t, td) linsolve(callWithUnwrapped(numA, [t;td]), ...
    callWithUnwrapped(numB, [t;td]), opts);

end

