function [direction] = getCommandFromVector(vect)
    % Find the max value and index of that value
    [value, index] = max(vect);

    direction = "g"; % Default command

    if value > 0.8 % Confident enough to detirmine a direction
        if index == 2
            direction = "r"; % Right
        elseif index == 1
            direction = "l"; % Left
        end
    end
end

