function measurements = createMeasurements(groundTruthData)
    constants;

    measurements = 0;

    for i = 1 : length(groundTruthData)
        height = groundTruthData(i).height;
        randomNoise = sqrt(sensor_covariance) * randn();  % randn() generates noise with mean 0 and variance 1
        measurements(i) = height + randomNoise;
    end
end

