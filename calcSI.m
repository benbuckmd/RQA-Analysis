% Calculates similarity index for a EKG signal.
% Accepts vector containing signal data and threshold value.
% Returns scalar ( simIndex, rho) describing proportion of pairs of signals
% which differ by less than the threshold condition.

function simIndex = calcSI(inArray, threshold)
    % Initialize variables and matricies
    denom = length(inArray);
    SICount = 0;
        
    % Execute loop to calculate SI
    for i = 1:denom
        if inArray{i,4} < threshold
            SICount = SICount + 1;
        end
    end
    
    simIndex = SICount/denom;

end
