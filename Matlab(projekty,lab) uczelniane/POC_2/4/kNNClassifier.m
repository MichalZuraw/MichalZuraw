function [imgCoeffs, class, distances]=kNNClassifier(img,trainData,k)
    imgCoeffs=[0 0];
    [imgCoeffs(1), imgCoeffs(2), a, b, c]=calcCoeffs(img);
    [points,~]=size(trainData);
    %getting euclidean distances between new image coefficients and trainData
    distances=zeros(points,2);
    for i=1:points
        distances(i,1)=norm(trainData(i,1:2)-imgCoeffs);
        distances(i,2)=i;
    end
    %sorting distances to get k smallest values
    distances=sortrows(distances,'ascend');
    %get classess closest to new point
    closestClasses=zeros(k,1);
    for i=1:k
        closestClasses(i)=trainData(distances(i,2),3);
    end
    %classify new point
    class=mode(closestClasses);
end