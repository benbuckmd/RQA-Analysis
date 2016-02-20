% Calculates similarity index for a EKG signal.
% Accepts vector containing signal data and threshold value.
% Returns scalar ( simIndex, rho) describing proportion of pairs of signals
% which differ by less than the threshold condition.

function [waveforms, tableSI] = simArrayCalc(inSignal)
    bctrList = barycenterCalc(inSignal);
    waveforms = vectorCutter(inSignal, bctrList);
    tableSI = compareVectors(waveforms);
end