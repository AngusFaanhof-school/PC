testData  = csvread('testImages.csv');
trainData  = csvread('trainImages.csv');

for k=1:192
    j = testData(1:end, k);
    length(j);
    digit = reshape(j,[28,28]);
    subplot(16,12,k);
    imshow(digit);
end

trainFcn = 'trainscg';  % Scaled conjugate gradient backpropagation.

% Create a Pattern Recognition Network
hiddenLayerSize = 100;
net = patternnet(hiddenLayerSize, trainFcn);

% Setup Division of Data for Training, Validation, Testing
net.divideParam.trainRatio = 70/100;
net.divideParam.valRatio = 15/100;
net.divideParam.testRatio = 15/100;

% Train the Network
[net,tr] = train(net,testData,trainData);

% Test the Network
y = net(testData);
e = gsubtract(trainData,y);
performance = perform(net,trainData,y)
tind = vec2ind(trainData);
yind = vec2ind(y);
percentErrors = sum(tind ~= yind)/numel(tind);

% View the Network
view(net);

% Plots
% Uncomment these lines to enable various plots.
%figure, plotperform(tr)
%figure, plottrainstate(tr)
%figure, ploterrhist(e)
%figure, plotconfusion(t,y)
%figure, plotroc(t,y)

