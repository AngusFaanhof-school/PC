function [vect, bw, final, im] = takeImageAndGetVect(vid)
    % take image
    %
    im = getsnapshot(vid);

    % calculate threshold
    level=graythresh(im);

    % process image
    bwimage=im2bw(im,level); 
    openimage=imopen(bwimage,strel('disk',2)); 
    %imcomplementimage=imcomplement(openimage);
    resizeimage = imresize(openimage, [28, 28]);
    
    imshow(bwimage);
    % convert to vector
    vect = resizeimage(:);
    bw = bwimage;
    final = resizeimage;
    % imshow(openimage);
end

