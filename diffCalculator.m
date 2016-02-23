function [diffMatrixH, diffMatrixV] = diffCalculator(inMatrix)
    % Initialize variables and matrices
    inDim = size(inMatrix);
    inDimD = inDim(3); % Matrix depth
    inDimC = inDim(2); % Matrix columns
    inDimR = inDim(1); % Matrix rows
    outDimD = inDimD;
    outDimHR = inDimR;
    outDimHC = inDimC-1; 
    outDimVR = inDimR-1;
    outDimVC = inDimC;
    diffMatrixH = zeros(outDimHR, outDimHC, outDimD);
    diffMatrixV = zeros(outDimVR, outDimVC, outDimD);
    
    % Produce bipole data 
    for i = 1:outDimD;
        
        % Horizontal bipole data 
        for j = 1:outDimHR;
            for k = 1:outDimHC;
                diffMatrixH(j, k, i) = inMatrix(j, k, i) - inMatrix(j, k, i);
            end
        end
        
        % Vertical bipole data
        for j = 1:outDimVR;
            for k = 1:outDimVC;
                diffMatrixV(j, k, i) = inMatrix(j, k, i) - inMatrix(j, k, i);
            end
        end
    end
%     export generated dataset    
end