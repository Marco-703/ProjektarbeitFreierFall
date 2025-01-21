function plotResults(object, groundTruthData, measurements, stateEstimationData)

    % Extract shape name
    shape = object.name;
    % Extract data length
    n = length(groundTruthData);

    % Preallocate arrays
    t = zeros(1, n);
    F_drag = zeros(1, n);
    F_drag_estimated = zeros(1, n);
    height = zeros(1, n);
    height_estimated = zeros(1, n);
    height_measurement = zeros(1, n);
    velocity = zeros(1, n);
    velocity_estimated = zeros(1, n);

    % Extract data from input structures
    for i = 1:n
        t(i) = groundTruthData(i).time;

        F_drag(i) = groundTruthData(i).dragForce;
        F_drag_estimated(i) = stateEstimationData(i).dragForce;

        height(i) = groundTruthData(i).height;
        height_estimated(i) = stateEstimationData(i).height;
        height_measurement(i) = measurements(i);

        velocity(i) = groundTruthData(i).velocity;
        velocity_estimated(i) = stateEstimationData(i).velocity;
    end

    % Plot 1: F_drag vs. F_drag_estimated
    figure;
    plot(t, F_drag, 'b', 'LineWidth', 1.5);
    hold on;
    plot(t, F_drag_estimated, 'r', 'LineWidth', 1.5);
    hold off;
    grid on;
    title([shape ' - Drag Force vs Time']);
    xlabel('Time (s)');
    ylabel('Drag Force (N)');
    legend('F_{drag}', 'F_{drag, estimated}');

    % Plot 2: Height, Height Measurement, and Height Estimated
    figure;
    plot(t, height, 'b', 'LineWidth', 1.5);
    hold on;
    plot(t, height_measurement, 'g', 'LineWidth', 1.5);
    plot(t, height_estimated, 'r', 'LineWidth', 1.5);
    hold off;
    grid on;
    title([shape ' - Height vs Time']);
    xlabel('Time (s)');
    ylabel('Height (m)');
    legend('Height', 'Height Measurement', 'Height Estimated');

    % Plot 3: Velocity vs Velocity Estimated
    figure;
    plot(t, velocity, 'b', 'LineWidth', 1.5);
    hold on;
    plot(t, velocity_estimated, 'r', 'LineWidth', 1.5);
    hold off;
    grid on;
    title([shape ' - Velocity vs Time']);
    xlabel('Time (s)');
    ylabel('Velocity (m/s)');
    legend('Velocity', 'Velocity Estimated');
end
