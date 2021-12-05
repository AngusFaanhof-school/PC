im = imread('r2.tif'); 
im2=imcrop(im,[555,220,239,199]);
im3=rgb2gray(im2);
level=graythresh(im3)
imhist(im3);
im4=im2bw(im3,level); 
im5=imopen(im4,strel('disk',2)); 
im6=imcomplement(im5);

[labels,numlabels]=bwlabel(im6);
im7 = label2rgb(labels); 
imshow(im7);
vislabels(labels);

stats = regionprops(labels, 'all'); 
stats(1)
area = stats(1).Area;
formFactor =4*pi*stats(1).Area/((stats(1).Perimeter)^2)
