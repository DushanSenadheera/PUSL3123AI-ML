%load the MATLAB file named fisheriris.mat
load fisheriris

%Shuffle the dataset randomly by selecting 60% for training and remaining 40% for testing
rng(1); % For reproducibility
randomOrder = randperm(size(meas,1));
meas = meas(randomOrder,:);
species = species(randomOrder,:);

trainingSize = floor(0.6 * size(meas,1));
trainingSet = meas(1:trainingSize,:);
trainingLabels = species(1:trainingSize,:);
testSet = meas(trainingSize+1:end,:);
testLabels = species(trainingSize+1:end,:);

%create training data, training target, testing data and testing target
trainingData = trainingSet';
trainingTarget = trainingLabels';
testingData = testSet';
testingTarget = testLabels';

k = [5, 7]; 

%For each K value, report the confusion matrix and percentage of correct classifications
for i = 1:length(k)
    Mdl = fitcknn(trainingData',trainingTarget','NumNeighbors',k(i));
    predictedLabels = predict(Mdl,testingData');
    confusionMatrix = confusionmat(testingTarget',predictedLabels);
    fprintf('Confusion Matrix for K = %d is\n',k(i));
    disp(confusionMatrix);
    accuracy = sum(strcmp(predictedLabels, testingTarget')) / length(testingTarget);
    fprintf('Percentage of correct classifications for K = %d is %f\n',k(i),accuracy);
end

