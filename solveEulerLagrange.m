function [eqn, thetaDD] = solveEulerLagrange( L, theta, thetaD, t )
%SOLVEEULERLAGRANGE Solves the Euler-Lagrange equation for the second
%derivative of theta.
%   L is in terms of theta, thetaD and time, and theta/thetaD are just
%   regular symbols. This will output a function of theta, thetaD, and time.

L_theta = diffDV(L, theta);
L_thetaD = diffDV(L, thetaD);

% Rewrite theta as a function of time, and thetaD as its derivative.
fTheta = sym('fTheta', size(theta));
for i = 1:length(theta),
    fTheta(i) = symfun(sprintf('fTheta%d(t)', i), t);
end
fThetaD = diff(fTheta, t);


L_theta = subs(subs(L_theta, theta, fTheta), thetaD, fThetaD);
L_thetaD = subs(subs(L_thetaD, theta, fTheta), thetaD, fThetaD);


eqn = L_theta == diff(L_thetaD, t) + thetaD;

thetaDD = sym('thetaDD', size(theta));

% Substitute thetaDD(i) for any diff(fThetai(t), t, t), and also substitute
% theta and thetaD back in.
for i = 1:length(theta),
    f = fTheta(i);
    
    eqn = subs(eqn, diff(f, t, t), thetaDD(i));
    eqn = subs(eqn, diff(f, t), thetaD(i));
    eqn = subs(eqn, f, theta(i));
end


end

