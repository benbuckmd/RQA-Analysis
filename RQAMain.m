function [RQOut, HM] = RQAMain(signalVector, embed)
    % Initialize matricies and variables
    vecLen = length(signalVector);
    lastPossible = vecLen - embed;
    
    % Error if embed is invalid
    if embed ~= floor(embed)
        msg = strcat('Embeded dimension must be a positive integer.');
        error(msg)
    end
        
    % Calculate delay
    delay = input(strcat('Time delay within vectors?'));
    if delay >= 1 && delay == floor(delay)
        vecDelay = delay;
    else
        msg = strcat('Proposed delay vector was not acceptable. Will ', ...
                      'default to delay=1.');
        disp(msg)
        vecDelay = 1;
    end
    lastPossible = vecLen - delay*(embed-1); % update last possible
    
    % Calculate first vector
    first = input(strcat('Time position of first vector?', ...
        ' (Max Possible = ', num2str(lastPossible), ') '));
    if first >= 1 && first <= lastPossible && floor(first)==first
        firstVec = first;
    else
        msg = strcat('First proposed vector is not within acceptable', ...
                     ' range. Will default to first possible vector.');
        disp(msg)
        firstVec = 1;
    end    
    
    % Calculate final vector
    last = input(strcat('Time position of last vector?', ...
        ' (Max Possible = ', num2str(lastPossible), ')'));
    if last >= 1 && last <= lastPossible && floor(last)==last
        lastVec = last;
    else
        msg = strcat('Last proposed vector is not within acceptable ', ...
                     'range. Will default to last possible vector: ', ...
                     num2str(lastPossible), '.');
        disp(msg)
        lastVec = lastPossible;
    end 
        
    % Calculate vector series
    
    % Fill in table of vectors
    
    % Compare pairwise and output to new array
    HM = 1;
    RQOut = 1;
end