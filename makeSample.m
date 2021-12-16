leftIndex = 0;
rightIndex = 0;
haltIndex = 0;

vid = videoinput('winvideo',1);
start(vid);

loop = 1;
while loop == 1
    [v, ~, f, ~] = takeImageAndGetVect(vid);
    
    imshow(f);
    s = input("Save? (y/n): ", 's');
    if s == "y"
        valid = 0;

        while valid == 0
            type = input("Label (l, r, h): ", 's');

            if type == "l" 
                leftIndex = leftIndex + 1;
                imwrite(f, "samples/" + type + leftIndex + ".png");
                valid = 1;
            elseif type == "r" 
                rightIndex = rightIndex + 1;
                imwrite(f, "samples/" + type + rightIndex + ".png");
                valid = 1;
            elseif type == "h"
                haltIndex = haltIndex + 1; 
                imwrite(f, "samples/" + type + haltIndex + ".png");
                valid = 1;
            else
                disp("Please choose a valid answer");
                valid = 0;
            end
        end
    end
    
    cont = input("Take a new picture? (y/n) ", 's');
    
    if cont == "y"
        loop = 1;
    else
        loop = 0;
    end
end