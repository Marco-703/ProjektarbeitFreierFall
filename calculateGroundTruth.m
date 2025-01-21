function groundTruthData = calculateGroundTruth(inputObject, simulationTime, sampleRate)
    constants;
    groundTruthData = createStateStruct();

    % Zeitschritt berechnen
    dt = 1 / sampleRate;
    N = round(simulationTime / dt);  % Anzahl der Iterationen

    % Initialisierung der Vektoren
    y = zeros(N+1, 1);  % Höhenwerte
    v = zeros(N+1, 1);  % Geschwindigkeitswerte

    % Anfangswerte
    y(1) = 0;  % Anfangshöhe (m)
    v(1) = 0;  % Anfangsgeschwindigkeit (m/s)

    % Objektparameter
    A = inputObject.area;
    Cd = inputObject.dragCoefficent;
    m = inputObject.mass;


    % Runge-Kutta-Schleife
    for i = 1:N
        currentState = createStateStruct();
        % Runge-Kutta 4. Ordnung
        k1v = dt * acceleration(v(i), Cd, A, m);
        k1y = dt * v(i);

        k2v = dt * acceleration(v(i) + 0.5 * k1v, Cd, A, m);
        k2y = dt * (v(i) + 0.5 * k1v);

        k3v = dt * acceleration(v(i) + 0.5 * k2v, Cd, A, m);
        k3y = dt * (v(i) + 0.5 * k2v);

        k4v = dt * acceleration(v(i) + k3v, Cd, A, m);
        k4y = dt * (v(i) + k3v);

        v(i+1) = v(i) + (1/6) * (k1v + 2 * k2v + 2 * k3v + k4v);
        y(i+1) = y(i) + (1/6) * (k1y + 2 * k2y + 2 * k3y + k4y);

        % Geschwindigkeits- und Höhenupdate
        currentState.time = i * dt;
        currentState.velocity = v(i+1);
        currentState.height = y(i+1);
        currentState.dragForce = 0.5 * rho * Cd * A * v(i+1)^2;  % Luftwiderstandskraft

        groundTruthData(i) = currentState;
    end

end

% Funktion für die Beschleunigung: a = f(v)
function a = acceleration(v, Cd, A, m)
    constants;
        
    F_drag = 0.5 * rho * Cd * A * v^2;  % Luftwiderstandskraft
    F_gravity = m * g;                  % Gewichtskraft
    if v > 0
        a = (F_gravity - F_drag) / m;   % Beschleunigung nach unten
    else
        a = (F_gravity + F_drag) / m;   % Beschleunigung nach oben
    end
end