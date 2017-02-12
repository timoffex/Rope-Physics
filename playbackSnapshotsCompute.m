X = zeros(size(thetaSnapshots, 1), length(xPositions));
Y = zeros(size(thetaSnapshots, 1), length(yPositions));

xPosH = matlabFunction(xPositions);
yPosH = matlabFunction(yPositions);

% Compute all X and Y positions
for i = 1:size(thetaSnapshots, 1),
    
    thetaCell = num2cell(thetaSnapshots(i,:));
    
    X(i,:) = xPosH(thetaCell{:})';
    Y(i,:) = yPosH(thetaCell{:})';
    
    if mod(i,20) == 0,
        fprintf('Processing %d out of %d...\n', i, size(thetaSnapshots, 1))
    end
end