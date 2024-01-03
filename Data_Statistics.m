%load the fisheriris.mat dataset
load fisheriris.mat

%total number of rows in the dataset
N = size(meas,1);
fprintf('total number of rows in the dataset is %d\n',N);

%for each feature Mean, the Standard Deviation, Maximum, Minimum and Root Mean Square
for i = 1:4
    %mean of the coloumn
    fprintf('Mean of coloumn %d is %f\n',i,mean(meas(:,i)));

    %standard deviation of the coloumn
    fprintf('Standard deviation of coloumn %d is %f\n',i,std(meas(:,i)));

    %maximum value of the coloumn
    fprintf('Maximum value of coloumn %d is %f\n',i,max(meas(:,i)));

    %minimum value of the coloumn
    fprintf('Minimum value of coloumn %d is %f\n',i,min(meas(:,i)));

    %root mean square of the coloumn
    fprintf('Root mean square of coloumn %d is %f\n',i,rms(meas(:,i)));

    fprintf('=====================================================================\n')
end