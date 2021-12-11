Files = dir('*.png');
testFile = [];
trainFile = [];

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

writematrix(testFile, 'testHandIm.csv');
writematrix(trainFile, 'trainHandIm.csv');

