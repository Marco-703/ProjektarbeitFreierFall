close all; clear; clc;

%% Includes

addpath('Datatypes');


%% Define shapes

shapes = {'Cube', 'Sphere', 'Cylinder', 'Half Sphere', 'Cone'};
dragCoeficients = [1.05, 0.47, 1.2, 0.42, 0.5]; % Drag coefficients

%% Parameters

simulationTime = 25; % time in seconds
sampleRate = 100; % Hz

%% Create an object and simulate

object = createObjectPrompt(shapes, dragCoeficients);
%{
object = createObjectStruct();
object.area = 0.05;
object.mass = 2.5;
object.dragCoefficent = 0.47;
object.name = 'Sphere';
%}

groundTruthData = calculateGroundTruth(object, simulationTime, sampleRate);

measurements = createMeasurements(groundTruthData);
stateEstimationData = calculateStateEstimation(object, sampleRate, measurements);

%% Plot

plotResults(object, groundTruthData, measurements, stateEstimationData);