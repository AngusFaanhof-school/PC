function [direction] = getDirectionFromVect(vect)
    [~, index] = max(vect);
    direction = "g";
    
    if index == 3
        direction = "r";
    elseif index == 2
        direction = "g";
    elseif index == 1
        direction = "l";
    end
end

