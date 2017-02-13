function [ valueSnapshots ] = simulate( initValues, initValuesD, valuesDDFunc, numItr, deltaT, timeSteps )
%SIMULATE Simulates a system using a second-order approximation, and
%returns the results of the simulation.

valueSnapshots = zeros(numItr, length(initValues));

values = initValues;
valuesD = initValuesD;

for i = 1:numItr,
    
    for tstep = 1:timeSteps,
        valuesDD = valuesDDFunc(values, valuesD);
        values = values + deltaT * valuesD + .5 * deltaT^2 * valuesDD;
        valuesD = valuesD + deltaT * valuesDD;
    end
    
    valueSnapshots(i,:) = values';
    
    if mod(i,20) == 0,
        fprintf('%d out of %d\n', i, numItr)
    end
end


end

