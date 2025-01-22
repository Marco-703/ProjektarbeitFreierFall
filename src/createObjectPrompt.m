function object = createObjectPrompt(shapes, dragCoeficients)
    % Initialize the object structure
    object = createObjectStruct();
    shapeDefined = false;
    massDefined = false;
    areaDefined = false;

    % Loop to define the shape
    while ~shapeDefined
        clc;
        % Display options to the user
        disp('Choose an object from the following list:');
        for i = 1:length(shapes)
            fprintf('%d. %s\n', i, shapes{i});
        end

        % Get user input
        choice = input('Enter the number corresponding to your choice: ');

        if (choice > 0) && (choice <= length(dragCoeficients))
            object.name = shapes{choice};
            object.dragCoefficent = dragCoeficients(choice);
            shapeDefined = true;
        else
            disp('Invalid input! Please select a valid number.');
        end
    end

    % Loop to define the mass
    while ~massDefined
        clc;
        % Format the prompt for mass
        prompt = sprintf('Enter the mass of your %s: ', object.name);
        mass = input(prompt); % Get user input

        if mass > 0.0
            object.mass = mass;
            massDefined = true;
        else
            disp('Invalid input! Mass must be greater than zero.');
        end
    end

    % Loop to define the area
    while ~areaDefined
        clc;
        % Format the prompt for area
        prompt = sprintf('Enter the area of your %s: ', object.name);
        area = input(prompt); % Get user input

        if area > 0.0
            object.area = area;
            areaDefined = true;
        else
            disp('Invalid input! Area must be greater than zero.');
        end
    end
    clc;
    % Final setup message
    disp('Everything is set up.');
end
