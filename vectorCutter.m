function vectorArray = vectorCutter(inSignal, bctrList)
    % Initialize variables
    inDim = size(bctrList);
    inDimD = inDim(2);
    vectorArray = cell(inDimD, 2);
    
    % Execute function
    for i = 1:inDimD;
        vectorArray{i, 1} = bctrList(i);
        vectorArray{i, 2} = inSignal(bctrList(i) - 24: bctrList(i) + 25);
    end
end