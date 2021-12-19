function [vect, resizeIm] = takeImageAndGetVect(vid)
    % Take image
    im = getsnapshot(vid);

    % Calculate gray threshold
    level = graythresh(im);

    % Convert image to black and white
    bwIm = im2bw(im, level);

    % Open the image
    openIm = imopen(bwIm, strel('disk', 2));

    % Resize the image
    resizeIm = imresize(openIm, [28, 28]);

    % Convert image to a vector
    vect = resizeIm(:);
end