function mapFig = RecPlot(fname, radius, recType)
    % Import the recurrence matrix and color data
    indir = 'C:\Users\Benjamin\Documents\JPH Lab\Data\RQA Initial Project\Recurrence List\';
    inext = '.txt';
    outdir = 'C:\Users\Benjamin\Documents\JPH Lab\Data\RQA Initial Project\Graphics\Recurrence Plots\';
    filename = strcat(indir, fname, inext);
    fileID = fopen(filename,'r');
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
    ticklabels = [25; 50; 75; 100];
    
    % Generate Recurrence Plot
    map = imagesc(matrixOut);
    
    mapAx = map.Parent;
    mapAx.Position = [0.07 0.15 0.80 0.80];
    mapAx.YDir = 'normal';
    
    mapFig = mapAx.Parent;
    mapFig.Position = [660 50 675 600];
    mapFig.PaperPosition = [0 0 5 5];
    mapFig.Units = 'inches';
    
    set(mapAx, 'XTickLabel', ticklabels, 'XTick', [25, 50, 75, 100], 'YTick', [25, 50, 75, 100], 'YTickLabel', ticklabels, 'TickLength', [0.0000,0.0000], 'box', 'on');
    colormap(mapAx, bhbjet);
    set(mapAx, 'CLim', [-1,radius]);
    %set(mapAx, 'Title', 'LATI');
     title(recType, 'FontSize', 16);
     
    mapC = colorbar;
    set(mapC, 'FontSize', 12);
    set(mapC, 'Position', [0.90 0.15 0.045 0.80]);
    set(mapC, 'ylim', [0 radius]);
    set(mapC, 'Ticks', [0.45 5 10 15 19.6]);
    set(mapC, 'TickLabels', [0 5 10 15 20]);
    
    annot1 = {'%Rec'; '%DET'};
    annot2 = {'Ent'; 'dmax'};
    text(25, -10, annot1);
    text(65, -10, annot2);
    
    figName = strcat(outdir,fname,'.tiff');
    print(mapFig, figName,'-dtiff', '-r300')
    
end