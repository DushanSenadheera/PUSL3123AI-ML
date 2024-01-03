%load the MATLAB file named fisheriris.mat
load fisheriris

%Shuffle the dataset randomly
rng(1); % For reproducibility
randomOrder = randperm(size(meas,1));
meas = meas(randomOrder,:);
species = species(randomOrder,:);

%selecting 60% for training
trainingSize = floor(0.6 * size(meas,1));
trainingSet = meas(1:trainingSize,:);
trainingLabels = species(1:trainingSize,:);

%remaining 40% for testing
testSet = meas(trainingSize+1:end,:);
testLabels = species(trainingSize+1:end,:);

%create training data, training target, testing data and testing target
trainingData = trainingSet';
trainingTarget = trainingLabels';
testingData = testSet';
testingTarget = testLabels';

k = [5, 7]; %K values to be used for KNN

%For each K value, confusion matrix and percentage of correct classifications
for i = 1:length(k)
    %train the model
    Mdl = fitcknn(trainingData',trainingTarget','NumNeighbors',k(i));
    predictedLabels = predict(Mdl,testingData');

    %confusion matrix
    confusionMatrix = confusionmat(testingTarget',predictedLabels);
    fprintf('Confusion Matrix for K = %d is\n',k(i));
    disp(confusionMatrix);

    %confusion matrix chart
    subplot(1,length(k),i); % Create a subplot for each K value
    confusionchart(testingTarget',predictedLabels);
    title(sprintf('Confusion Matrix for K = %d', k(i)));

    %classifier accuracy
    accuracy = sum(strcmp(predictedLabels, testingTarget')) / length(testingTarget);
    fprintf('Percentage of correct classifications for K = %d is %f\n',k(i),accuracy);
end

