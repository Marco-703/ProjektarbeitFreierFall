function measurements = createMeasurements(groundTruthData)
    constants;

    measurements = 0;

    for i = 1 : length(groundTruthData)
        height = groundTruthData(i).height;
        randomNoise = sensor_covariance * rand - (0.5 * sensor_covariance);
        measurements(i) = height + randomNoise;
    end
end

