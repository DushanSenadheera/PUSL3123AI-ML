%load the MATLAB file named kmeansdata.mat
load('kmeansdata.mat');

%assign number of clusters
k = [3,4,5]

% Create a new figure
figure;

% implement Kmeans clustering to evaluate different number of clusters
for i = 1:length(k)
    [idx, C] = kmeans(X, k(i));

    % Create a subplots for the clustering
    subplot(2, length(k), i);
    gscatter(X(:,1),X(:,2),idx);
    hold on;
    plot(C(:,1),C(:,2),'kx','MarkerSize',15,'LineWidth',3);
    title(['Kmeans Clustering with k = ', num2str(k(i))]);
    xlabel('x1');
    ylabel('x2');
    hold off;

    % Create a subplots for the silhouette plot
    subplot(2, length(k), length(k) + i);
    [silh,h] = silhouette(X,idx);
    h = gca;
    h.Children.EdgeColor = [.8 .8 1];
    xlabel 'Silhouette Value';
    ylabel 'Cluster';
    title(['Silhouette Plot with k = ', num2str(k(i))]);
    hold off;

    % Calculate the mean performance using silhouette Value
    meanSilhouette = mean(silh);
    
    % Display the mean silhouette value
    fprintf('Mean Silhouette Value for K = %d is %f\n',k(i),meanSilhouette);
end

%find out the optimal number of clusters that achieve the best performance
eva = evalclusters(X,'kmeans','CalinskiHarabasz','KList',[3:5]);
disp(eva)





