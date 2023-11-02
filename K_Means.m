%load the MATLAB file named kmeansdata.mat
load('kmeansdata.mat');

k = [3,4,5]

% implement Kmeans clustering and then repeat the same procedure to evaluate different number of clusters
for i = 1:length(k)
    [idx, C] = kmeans(X, k(i));
    figure;
    gscatter(X(:,1),X(:,2),idx);
    hold on;
    plot(C(:,1),C(:,2),'kx','MarkerSize',15,'LineWidth',3);
    title(['Kmeans Clustering with k = ', num2str(k(i))]);
    xlabel('x1');
    ylabel('x2');
    hold off;
end

%find out the optimal number of classes that achieve the best performance
eva = evalclusters(X,'kmeans','CalinskiHarabasz','KList',[1:6]);
disp(eva)

%For each K value, report the mean performance using the Silhouette measure and plot the Silhouette for each cluster 
for i = 1:length(k)
    [idx, C] = kmeans(X, k(i));
    figure;
    [silh,h] = silhouette(X,idx);
    h = gca;
    h.Children.EdgeColor = [.8 .8 1];
    xlabel 'Silhouette Value';
    ylabel 'Cluster';
    title(['Silhouette Plot with k = ', num2str(k(i))]);
    hold off;
end






