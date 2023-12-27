%load the fisheriris.mat dataset
load fisheriris

%shuffle the dataset
rng(1); % For reproducibility

%select 60% of the dataset for training
idx = randperm(size(meas,1),round(size(meas,1)*0.6));

%select the remaining 40% of the dataset for testing
idx_test = setdiff(1:size(meas,1),idx);

%training data
X = meas(idx,:);
Y = species(idx);

%training target
Y = categorical(Y);
Y = dummyvar(Y)

%testing data
X_test = meas(idx_test,:);
Y_test = species(idx_test);

%testing target
Y_test = categorical(Y_test);
Y_test = dummyvar(Y_test)

%Define the hidden layer size for NN using iteration assume 10, 15, and 20 hidden layers
hiddenLayerSize = [10, 15, 20];

% Initialize an array to store the accuracy of each run
accuracies = [];

%for each neural network setting repeat the experiment 4 times
for i = 1:4
    %for each hidden layer size
    for j = 1:length(hiddenLayerSize)
        %create a neural network with 1 hidden layer
        net = feedforwardnet(hiddenLayerSize(j));
        
        %Train the neural network based on the training dataset created
        net = trainlm(net,X',Y');

        %view the neural network
        view(net)

        %test the neural network using the testing dataset
        y_pred = net(X_test');

        %calculate the accuracy of the neural network
        accuracy = sum(y_pred == Y_test')/length(Y_test);

        %store the accuracy in the accuracies array
        accuracies = [accuracies, accuracy];
    end
end

%calculate the average accuracy
average_accuracy = mean(accuracies);

%display the average accuracy
disp(average_accuracy)






