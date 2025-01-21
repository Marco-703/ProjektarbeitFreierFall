close all; clear; clc;

%% Includes

addpath('Datatypes');


%% Define shapes

shapes = {'Cube', 'Sphere', 'Cylinder', 'Half Sphere', 'Cone'};
dragCoeficients = [1.05, 0.47, 1.2, 0.42, 0.5]; % Drag coefficients

%% Parameters

simulationTime = 10; % time in seconds
sampleRate = 100; % Hz

%% Create an object and simulate

object = createObjectPrompt(shapes, dragCoeficients);

%groundTruthData = calculateGroundTruth(object, simulationTime, sampleRate);

%createMeasurements();
%simulationData = simulate(object, simulationTime, sampleRate, groundTruthData);

%% Plot

% plotData(groundTruthData, SimulationData);