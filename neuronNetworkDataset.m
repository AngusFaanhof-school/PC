%Load dataset
testSet  = csvread('testImages.csv');
trainSet  = csvread('trainImages.csv');

%Train network via scaled conjugate gradient backpropagation.
trainFcn = 'trainscg';

%Create a Pattern Recognition Network with 100 hidden layers
hiddenLayerSize = 100;
net = patternnet(hiddenLayerSize, trainFcn);

%Setup Division of Data for Training, Validation, Testing
net.divideParam.trainRatio = 70/100;
net.divideParam.valRatio = 15/100;
net.divideParam.testRatio = 15/100;

%Train the Network
[net, tr] = train(net, testSet, trainSet);

%Test the Network
testResult = net(testSet);
gsubtract(trainSet, testResult);

%Calculate network performance
performance = perform(net, trainSet, testResult)

%View the Network
view(net)

%Save the traned neural network
filename = 'trainNN';
save(filename, net);