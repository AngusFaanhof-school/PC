%Get .png image from folder
Files = dir('*.png');
testFile = [];
trainFile = [];

%Convert all images into matrix
for k=1:length(Files)
    Filename = Files(k).name;
    im = imread(Filename);
    vect = im(:);
    output = [
        startsWith(Filename, 'l'); %turnLeft
        startsWith(Filename, 'r'); %turnRight
        startsWith(Filename, 'h');  %stop
    ];
    testFile = [testFile vect];
    trainFile = [trainFile output];
end

%Write the matrix into csv file
writematrix(testFile, 'testHandIm.csv');
writematrix(trainFile, 'trainHandIm.csv');
