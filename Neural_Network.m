%load the fisheriris.mat dataset
load fisheriris.mat

%Shuffle the dataset randomly 
rng(0); % For reproducibility
idx = randperm(size(meas,1));
meas = meas(idx,:);
species = species(idx);

%Shuffle the dataset randomly by selecting 60% for training and remaining 40% for testing
train_data = meas(1:90,:);
train_label = species(1:90,:);
test_data = meas(91:150,:);
test_label = species(91:150,:);

% create training data, training target, testing data and testing target
train_data = train_data';
train_label = train_label';
test_data = test_data';
test_label = test_label';

%select feedforwardnet 
net = feedforwardnet(10);




