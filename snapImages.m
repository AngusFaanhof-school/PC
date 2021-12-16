leftIndex = 0;
rightIndex = 0;
haltIndex = 0;

vid = videoinput('winvideo',1);
start(vid);
preview(vid);

loop = 1;
while loop == 1
    
    type = input("Label (l, r, h), or q to quit: ", 's');
    
    [v, ~, f, ~] = takeImageAndGetVect(vid);
    imshow(f);    

    if type == "l" 
        leftIndex = leftIndex + 1;
        imwrite(f, "samples/" + type + leftIndex + ".png");
    elseif type == "r" 
        rightIndex = rightIndex + 1;
        imwrite(f, "samples/" + type + rightIndex + ".png");
    elseif type == "h"
        haltIndex = haltIndex + 1; 
        imwrite(f, "samples/" + type + haltIndex + ".png");
    elseif type == "q"
        loop = 0;
    elseif type ~= "s"
        disp("Please choose a valid answer");
    end
end