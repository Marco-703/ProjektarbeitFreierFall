close all; clear; clc;

%% Includes

addpath('Datatypes');


%% Define shapes

shapes = {'Cube', 'Sphere', 'Cylinder', 'Half Sphere', 'Cone'};
dragCoeficients = [1.05, 0.47, 1.2, 0.42, 0.5]; % Drag coefficients

%% Parameters

initialHeight = 100; % height in meters
sampleRate = 100; % Hz

%% Create an object and simulate

object = createObjectPrompt(shapes, dragCoeficients);

%groundTruthData = calculateGroundTruth(object, initialHeight, sampleRate);
%simulationData = simulate(object, initialHeight, sampleRate, groundTruthData);

%% Plot

% plotData(groundTruthData, SimulationData);