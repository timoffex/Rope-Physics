function thetaDDCompute = getThetaDDFunctionLinear( theta, thetaD, A, b )
%GETTHETADDFUNCTION Returns a matlab function that takes the values of
%(theta, thetaD) as parameters and returns the value of thetaDD assuming
%thetaDD = inv(A) * b.
%   Simplify A and b beforehand to improve the runtime of this function.



numA = matlabFunction(A, 'Vars', [theta; thetaD]);
numB = matlabFunction(b, 'Vars', [theta; thetaD]);

opts.SYM = true;
thetaDDCompute = @(t, td) linsolve(callWithUnwrapped(numA, [t;td]), ...
    callWithUnwrapped(numB, [t;td]), opts);

end

