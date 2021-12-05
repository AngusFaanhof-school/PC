Files = dir('*.png');
testFile = [];
trainFile = [];

for k=1:length(Files)
    Filename = Files(k).name;
    im = imread(Filename); 
    level=graythresh(im)
    im4=im2bw(im,0.5); 
    im5=imopen(im4,strel('disk',2)); 
    im6=imcomplement(im5);
    vect = im6(:);
    
    output = [
        startsWith(Filename, 'l'); %turnLeft
        startsWith(Filename, 'r'); %turnRight
        startsWith(Filename, 'h');  %stop
    ];
    testFile = [testFile vect];
    trainFile = [trainFile output];
end

writematrix(testFile, 'test.csv');
writematrix(trainFile, 'train.csv');

