%Load dataset
x  = csvread('testImages.csv');
t  = csvread('trainImages.csv');

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
[net,tr] = train(net,x,t);

%Test the Network
y = net(x);
e = gsubtract(t,y);

%Calculate network performance
performance = perform(net,t,y)

%View the Network
view(net)

%Save the traned neural network
netSave = net
filename = 'trainNN';
save(filename, 'netSave')
