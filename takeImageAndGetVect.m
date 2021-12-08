function [vect, bw, final] = takeImageAndGetVect()
    % take image
    vid = videoinput('winvideo',1);
    start(vid);
    im = getsnapshot(vid);
    clear vid;

    % calculate threshold
    level=graythresh(im);

    % process image
    im4=im2bw(im,level); 
    %im5=imopen(im4,strel('disk',2)); 
    im6=imcomplement(im4);
    im2 = imresize(im6, [28, 28]);
    
    imshow(im4);
    % convert to vector
    vect = im2(:);
    bw = im4;
    final = im2;
end

