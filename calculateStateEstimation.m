function stateEstimationData = calculateStateEstimation(object, sampleRate, measurements)
    constants;

    %% Simulation data
    dt = (1/sampleRate);
    stateEstimationData = createStateStruct();

  %% Kalman Filter properties
    x = [0; 0; 0];    % state
    P = [             % covariance
        10, 0, 0; 
        0, 10, 0; 
        0, 0, 10
        ];  
    
    F = [               % State transition matrix
        1, dt, 0; 
        0, 1, -1 * (dt/object.mass); 
        0, 0, 1
        ];
    B = [0; dt; 0];     % Input effec matrix

    H = [1, 0, 0]; 
    I = eye(3);                        % Identity matrix

    Q = process_covariance * I;
    R = sensor_covariance;

    u = g;  % External input

    %% Simulation

    for i = 1 : length(measurements)
        % obtain measurement
        z = measurements(i);

        % Prediction step
        x = F * x;
        P = F * P * F' + Q;
        % Update step
        K = P * H' * inv(H * P * H' + R);
        x = x + K * (z - H * x);
        P = (I - K * H) * P;
       
       currentState = createStateStruct();
       currentState.time = i * dt;
       currentState.height = x(1);
       currentState.velocity = x(2);
       currentState.dragForce = x(3);

       stateEstimationData(i) = currentState;
    end
end

