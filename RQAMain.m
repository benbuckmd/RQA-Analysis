function [RQOut, HM] = RQAMain(signalVector, embed)
    % need elseif statements for input to only accept integers; can use
    % floor(x) ~= x as test

    % Initialize matricies and variables
    vecLen = length(signalVector);
    lastPossible = vecLen - embed;
    
    % Calculate first vector
    first = input(strcat('Time position of first vector?', ...
        ' Max Possible = ', str2cat(lastPossible), '.'));
    if first <= lastPossible
        firstVec = first;
    elseif floor(first) ~= first
        msg = strcat('First proposed vector was not integer. Will ', ...
                      'default to ', num2str(floor(first)), '.');
        error(msg)
        firstVec = floor(first);        
    else
        msg = strcat('First proposed vector will end beyond end of ', ...
                      'time series. Will default to first possible ', ...
                      'vector.');
        error(msg)
        firstVec = 1;
    end    
    
    % Calculate final vector
    last = input(strcat('Time position of last vector?', ...
        ' Max Possible = ', str2cat(lastPossible), '.'));
    if lastPossible <= last
        lastVec = last;
    elseif floor(last) ~= last
        msg = strcat('Last proposed vector was not integer. Will ', ...
                      'default to ', num2str(floor(last)), '.');
        error(msg)
        lastVec = floor(last);
    else
        msg = strcat('Last proposed vector will end beyond end of ', ...
                      'time series. Will default to last possible ', ...
                      'vector.');
        error(msg)
        lastVec = lastPossible;
    end
    
    % Calculate delay
    delay = input(strcat('Time delay between vectors?'));
    if delay <= 1
        delay = 1;
    elseif floor(delay) ~= delay
        msg = strcat('First proposed vector will end beyond end of ', ...
                      'time series. Will default to first possible ', ...
                      'vector.');
        error(msg)
        delay = floor(delay);
    else
        msg = strcat('Proposed delay vector was not integer. Will ', ...
                      'default to ', num2str(floor(delay)), '.');
        error(msg)
        lastVec = lastPossible;
    end
    
    % Calculate vector series
    
    % Fill in table of vectors
    
    % Compare pairwise and output to new array
    
end