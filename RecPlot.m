function HM = RecPlot(fname, radius)
    % Import the recurrence matrix and color data
    %!!!!!!! add location to path
    fileID = fopen(fname,'r');
    cellin = textscan(fileID,' %n %n %n');
    fclose(fileID);
    matrixin = horzcat(cellin{:});
    bhbjet = jet;
    bhbjet(1,:) = [1, 1, 1];

    % Convert wide to long
    inDim = length(matrixin);
    matDim = max(matrixin);
    matDim = matDim(1);
    matrixOut = -1*ones(matDim);
    for i = 1:inDim;
        xc = matrixin(i, 1);
        yc = matrixin(i, 2);
        matrixOut(xc,yc) = matrixin(i, 3);
    end

    %HM = matrixOut
    % imagesc(hh)
    % HM = HeatMap(matrixOut, 'colormap', bhbjet, 'symmetric', false, 'displayrange', radius)
    % colorbar;
    % HM = matrixin
    % Produce Plot
    map = imagesc(matrixOut);
    colormap(bhbjet);
    colorbar;
    set(gca, 'YDir', 'normal', 'XTickLabel', {''}, 'YTickLabel', {''}, 'TickLength', [0,0]);
    axHd1 = get(map, 'parent');
    set(axHd1, 'CLim', [-1,radius]);
    title([fname], 'FontSize', 13);
    HM = map
end