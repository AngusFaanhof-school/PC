leftIndex = 0;
rightIndex = 0;
haltIndex = 0;

vid = videoinput('winvideo',1);
start(vid);
preview(vid);

loop = 1;
while loop == 1

    type = input("Label (l, r, h), or q to quit: ", 's');

    [~, image] = takeImageAndGetVect(vid);
    imshow(image);

    if type == "l"
        leftIndex = leftIndex + 1;
        imwrite(image, "samples/" + type + leftIndex + ".png");
    elseif type == "r"
        rightIndex = rightIndex + 1;
        imwrite(image, "samples/" + type + rightIndex + ".png");
    elseif type == "h"
        haltIndex = haltIndex + 1;
        imwrite(image, "samples/" + type + haltIndex + ".png");
    elseif type == "q"
        loop = 0;
    elseif type ~= "s"
        disp("Please choose a valid answer");
    end
end