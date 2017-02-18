function [S, thetaDD] = getEulerLagrange( L, theta, thetaD, t )
%SOLVEEULERLAGRANGE Returns dL/dtheta - d/dt(dL/dthetaD).
%   L is in terms of theta, thetaD and time, and theta/thetaD are just
%   regular symbols. S will be a function of theta, thetaD, and time.

L_theta = diffDV(L, theta);
L_thetaD = diffDV(L, thetaD);

% Rewrite theta as a function of time, and thetaD as its derivative.

fTheta = sym('fTheta', size(theta));
for i = 1:length(theta),
    fTheta(i) = symfun(sprintf('fTheta%d(t)', i), t);
end

fThetaD = diff(fTheta, t);
fThetaDD = diff(fThetaD, t);


L_theta = subs(subs(L_theta, theta, fTheta), thetaD, fThetaD);
L_thetaD = subs(subs(L_thetaD, theta, fTheta), thetaD, fThetaD);

S = L_theta - diff(L_thetaD, t);

thetaDD = sym('thetaDD', size(theta));


% Substitute thetaDD(i) for any diff(fThetai(t), t, t), and also substitute
% theta and thetaD back in.
S = subs(S, [fTheta; fThetaD; fThetaDD], [theta; thetaD; thetaDD]);



end

