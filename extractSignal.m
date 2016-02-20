% Extracts signals of requested length from signal matrix
% Accepts matrix containing signal data for all points, coordinates
% desired, time range desired and whether signal is to be filtered
% Returns vector of signal data
function sigVector = extractSignal(inMatrix, row, col, startTime, stopTime, filterStatus)
    % Initialize vectors and matricies
    inDim = size(inMatrix);
    outDimD = stopTime - startTime; % Matrix depth
    outDimC = inDim(2); % Matrix columns
    outDimR = inDim(1); % Matrix rows
    
    % Capture signal from matrix
    sigVector = zeros(1, outDimD);
    for i = 1:outDimD;
        sigVector(1, i) = inMatrix(row, col, startTime + i);
    end
    
    % Filter if necessary (defaults to filtered signal)
    if filterStatus == 'filtered'
        sigVector = filterSignal(sigVector);
    elseif filterStatus == 'unfiltered'
        sigVector = sigVector;
    else
        % throw warning
        msg = ['Please specify "filtered" or "unfiltered" for variable',
                '"filterStat". Defaulting to filtered signal.'];
        error(msg)
        sigVector = filterSignal(sigVector);
    end
end