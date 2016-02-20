% Function identifies barycenters of input waveform using method described
% by Ravelli et al
function bctrs = barycenterCalc(inSignal)
    % Initialize variables
    inDim = size(inSignal);
    inDimD = inDim(2); % Input signal duration
    windowSize = 50;
    windowHalfSize = windowSize/2;
    outDimD = inDimD-windowSize; % Input signal duration
    rollSig = zeros(1, inDimD);
    zeroCrosses = [];
    
    % Identify Barrycenters
    absSignal = abs(inSignal);
    for i = windowHalfSize: outDimD + windowHalfSize;
        vNext = absSignal(i-24:i);
        vLast = absSignal(i:i+25);
        rollSig(i) = sum(vNext) - sum(vLast);
        if rollSig(i) >= 0 && rollSig(i-1) < 0
            newCross = i;
            zeroCrosses = [zeroCrosses newCross];
        end
    end
    
    bctrs = zeroCrosses;
end