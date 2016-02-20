function filteredSignal = filterSignal(inSignal)
    % Initialize variables
    inDim = size(inSignal);
    inDimR = inDim(2); % Signal duration
    
    % Initialize the filter
    b = fir1(40,[0.06 0.6]);
    
    % Execute filter
    filteredSignal = filter(b, 1, inSignal);
end