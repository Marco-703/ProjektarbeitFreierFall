close all; clear; clc;

%% Includes

addpath('Datatypes');
addpath('src');


%% Define shapes

shapes = {'Cube', 'Sphere', 'Cylinder', 'Half Sphere', 'Cone'};
dragCoeficients = [1.05, 0.47, 1.2, 0.42, 0.5]; % Drag coefficients

%% Parameters

simulationTime = 25; % time in seconds
sampleRate = 100; % Hz

for i = 1 : length(dragCoeficients)

%% Create an object and simulate

object = createObjectStruct();
object.area = 0.01;
object.mass = 2;
object.dragCoefficent = dragCoeficients(i);
object.name = shapes{i};

groundTruthData = calculateGroundTruth(object, simulationTime, sampleRate);

measurements = createMeasurements(groundTruthData);
stateEstimationData = calculateStateEstimation(object, sampleRate, measurements);

%% Plot


% groundTruthData.velocity vs. groundTruthData.dragForce
% stateEstimationData.velocity vs. stateEstimationData.dragForce

% Number of data points
numDataPoints = length(groundTruthData);

% Preallocate arrays for plotting
gtVelocity = zeros(1, numDataPoints);
gtDragForce = zeros(1, numDataPoints);
seVelocity = zeros(1, numDataPoints);
seDragForce = zeros(1, numDataPoints);

% Extract data from structures
for k = 1:numDataPoints
    gtVelocity(k) = abs(groundTruthData(k).velocity);
    gtDragForce(k) = abs(groundTruthData(k).dragForce);
    seVelocity(k) = abs(stateEstimationData(k).velocity);
    seDragForce(k) = abs(stateEstimationData(k).dragForce);
end

% Create a new figure
figure;
hold on;

% Plot Ground Truth Data
plot(gtVelocity, gtDragForce, '-', 'DisplayName', 'Ground Truth', 'LineWidth', 1.5);

% Plot State Estimation Data
plot(seVelocity, seDragForce, '-', 'DisplayName', 'State Estimation', 'LineWidth', 1.5);

% Add labels and title
xlabel('Velocity');
ylabel('Drag Force');
title(shapes(i));

% Add grid and legend
grid on;
legend;

% Release hold
hold off;

end