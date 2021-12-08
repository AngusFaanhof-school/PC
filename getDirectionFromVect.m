function [direction] = getDirectionFromVect(vect)
    [~, index] = max(vect);
    direction = "m";
    
    if index == 3
        direction = "r";
    elseif index == 2
        direction = "s";
    elseif index == 1
        direction = "l";
    end
end

