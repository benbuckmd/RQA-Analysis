% Calculates differences between vectors of arbitrary size.
% Accepts cell array containing barycenters (1st column) and vectors (2nd
% column).
% Returns four-column cell array containing Vector 1, Vector 2, the dot
% product of these two vectors, and the angle calculated from these dot
% products.

function vecPlot = plotVectors(vectorList)
    % Initialize Variables
    listLen = length(vectorList);
    
    % Configure plotter
    vecPlot = figure('Name', 'Plot of Vectors');
    hax = axes('Parent',vecPlot);
    hold on;
    for i = 1 : listLen
        plot(hax, vectorList{i, 2})
    end
    hold off;
    title(hax, 'Figure 2: Plot of All Waveforms, Superimposed');
end
