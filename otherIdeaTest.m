syms k t N

assume(in(k, 'integer') & k > 0)
assume(in(N, 'integer'))
assume(in(t, 'real'))


% Indexing variable. Certain summations must have different indices.
idx = sym('idx', [10 1]);


% Define theta as a function of k and t (just a trick to introduce
% indexing)
syms theta(k,t)

x(k,t) = symsum(cos(theta(idx(1),t)), idx(1), 1, k);
y(k,t) = symsum(sin(theta(idx(1),t)), idx(1), 1, k);

dx(k,t) = diff(x,t);
dy(k,t) = diff(y,t);

KineticEnergy = simplify((1/2)*symsum(dx(idx(2),t)^2 + dy(idx(2),t)^2, idx(2), 1, N));
PotentialEnergy = simplify(symsum(dy(idx(2),t), idx(2), 1, N));


%% Compute Lagrangian and its functional derivatives!
Lagrangian = KineticEnergy - PotentialEnergy;
Lagrangian_theta = functionalDerivative(Lagrangian, theta);