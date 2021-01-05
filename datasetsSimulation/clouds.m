function data = clouds(numpoints, centers)
% Generate as many clouds as centers are introduced in the data. Each cloud
% contains numpoints data points. 

data = [];

for i=1:size(centers,1)
    data = [data;0.25*randn(numpoints,2)+...
        repmat(centers(i,:),numpoints,1)];
end