function [RQOut, HM] = RQAMain(signalVector, embed)
    % Initialize matricies and variables
    vecLen = length(signalVector);
    
    % Create structure to hold configuration data
    configStr = struct('lastPossible',      vecLen - embed,...
                       'delay',             1,...
                       'first',             1,...
                       'last',              vecLen - embed,...
                       'embed',             embed,...
                       'continueConfig',    'N');
    
    % Update configuration and make sure all inputs are valid
    while configStr.continueConfig ~= 'Y'
        fprintf(1, '\n');
        disp('Current Settings:')
        fprintf(strcat('Embeded Dimension:', '\t', num2str(configStr.embed)))
        fprintf('\n')
        fprintf(strcat('First Vector:', '\t', num2str(configStr.first)))
        fprintf('\n')
        fprintf(strcat('Last Vector:', '\t', num2str(configStr.last)))
        fprintf('\n')
        fprintf(strcat('Delay:', '\t', num2str(configStr.delay)))
        fprintf('\n')
        configStr.continueConfig = upper(input('Accept current settings? [Y/N]', 's'));
        if configStr.continueConfig == 'Y'
            break
        end
        
        % Error if embed is invalid
        embed = input('Dimension to embed signal into?');
        if embed == floor(embed) && embed > 0 && embed < vecLen
            configStr.embed = embed;
        else
            disp(strcat('Embeded dimension must be a positive integer',...
                        'less than the timeseries length. Will default',...
                        ' to 1.'));
            configStr.embed = 1;
        end
        
        % Calculate delay
        fprintf('\n')
        delay = input(strcat('Time delay within vectors?'));
        if delay >= 1 && delay == floor(delay)
            configStr.delay = delay;
        else
            fprintf('\n')
            fprintf(strcat('Proposed delay vector was not acceptable.', ...
                           ' Will default to delay = 1.'))
            fprintf('\n')
            configStr.delay = 1;
        end
        configStr.lastPossible = vecLen - delay*(configStr.embed - 1); % Also updates last possible
        
        % Calculate first vector
        first = input(strcat('Time position of first vector?', ...
            ' (Max Possible = ', num2str(configStr.lastPossible), ') '));
        if first >= 1 && first <= configStr.lastPossible && floor(first)==first
            configStr.first = first;
        else
            msg = strcat('First proposed vector is not within acceptable', ...
                         ' range. Will default to first possible vector.');
            disp(msg)
            configStr.first = 1;
        end
    
        % Calculate final vector
        last = input(strcat('Time position of last vector?', ...
            ' (Max Possible = ', num2str(configStr.lastPossible), ')'));
        if last >= 1 && last <= configStr.lastPossible && floor(last)==last
            configStr.last = last;
        else
            msg = strcat('Last proposed vector is not within acceptable ', ...
                         'range. Will default to last possible vector: ', ...
                         num2str(configStr.lastPossible), '.');
            disp(msg)
            configStr.last = configStr.lastPossible;
        end 

    end
        
    % Calculate vector series
    
    % Fill in table of vectors
    
    % Compare pairwise and output results to new array
    
    % Generate heatmap
    HM = 1;
    RQOut = 1;
end

% Add third optional input to allow passage of custom config and bypass
% settings