%% Import and Prepare Data
% Import Model 1 as _m1mat_ to work with and compute _m1h_ and _m1v_,
% horizontal and vertical bipoles, respectively.

m1mat = importDAT('C:/Users/Benjamin/Documents/JPH Lab/Data/Simulations Data/Models/Model 1');
[m1h, m1v] = diffCalculator(m1mat);
% m2mat = importDAT('C:/Users/Benjamin/Documents/JPH Lab/Data/Simulations Data/Models/Model 2');
% [m2h, m2v] = diffCalculator(m2mat);
% m3mat = importDAT('C:/Users/Benjamin/Documents/JPH Lab/Data/Simulations Data/Models/Model 3');
% [m3h, m3v] = diffCalculator(m3mat);
% m4mat = importDAT('C:/Users/Benjamin/Documents/JPH Lab/Data/Simulations Data/Models/Model 4');
% [m4h, m4v] = diffCalculator(m4mat);
% m5mat = importDAT('C:/Users/Benjamin/Documents/JPH Lab/Data/Simulations Data/Models/Model 5');
% [m5h, m5v] = diffCalculator(m5mat);

%% Filter and extract timeseries from model matrix
% The variables _f1hr5c4_ and _f1vr5c4_ represent the filtered 15,000 ms
% timeseries recorded from the horizontal bipole spanning row 4, column 5 
% and row 5, column 5; and the vertical bipole spanning row 4, column 5 and
% spanning row 4, column 6

f1hr5c4 = extractSignal(m1h, 5, 4, 5000, 20000, 'filtered');
f1vr5c4 = extractSignal(m1v, 5, 4, 5000, 20000, 'filtered');

%% Plot the full 15,000 ms sample of _f1hr5c4_
sigPlot = figure('Name', 'Plot of Signal');
hax = axes('Parent', sigPlot);
plot(hax, f1hr5c4);
title(hax, 'Figure 1: Plot of Signal f1hr5c4');

%% Compute array of angles
% Produces a table of pairs of vectors, the dot products of the vectors and
% the arccosine of these products.

[f1hr5c4W, f1hr5c4ST] = simArrayCalc(f1hr5c4);
[f1vr5c4W, f1vr5c4ST] = simArrayCalc(f1vr5c4);

%% Calculate Similarity Index ($\rho$) for a number of points at any given epsilon
%
% $$\rho = \frac{2}{N(N-1)} \sum_{i=1}^{N} \sum_{j=i+1}^{N} \Theta(\varepsilon-d(y_1 - y_j))$$
% 
% The variable _f1hr5c4SI_ and _f1hr5c4W_ represent the similarity index
% and the array of compared waveforms when considering _f1hr5c4_ at a given
% threshold, _threshold_. 

threshold = pi/3;
f1hr5c4SI = calcSI(f1hr5c4ST, threshold);

%% Plots all waveforms in array _f1hr5c4W_
vecPlot = plotVectors(f1hr5c4W);
dim = [.15 .45 .45 .45];
str = strcat('\rho= ', num2str(f1hr5c4SI));
annotation(vecPlot, 'textbox',dim,'String',str,'FitBoxToText','on');

%% Display resulting similarity index
% 
% $$\rho(\frac{\pi}{3}) = $$

f1hr5c4SI %#ok<NOPTS>

%% Compare bipole orientations
% Intuitively, signals from bipoles oriented parallel to the direction of
% wavefront travel should be narrower and sharper than signals from
% perpendicular bipoles at the same location. Visual inspection confirms
% this assumption.

h1 = f1hr5c4W{1,2};
v1 = f1vr5c4W{1,2};

compPlot = figure('Name', 'Comparison of Bipole Orientations');
ax1 = axes('Parent', compPlot);
hold(ax1, 'on');
plot(ax1, h1, 'Color', 'blue');
plot(ax1, v1, 'Color', 'red');
title(ax1, 'Figure 3: Plot of First Waveform at R5 C4');
legend('Horizontal Bipole','Vertical Bipole');
hold(ax1, 'off');

% Questionably interesting numbers about this waveform:
h1t = trapz(h1);
h1ta = trapz(abs(h1));
v1t = trapz(v1); 
v1ta = trapz(abs(v1));

%% Next on the to-do list:
% * Add blanking functionality to code