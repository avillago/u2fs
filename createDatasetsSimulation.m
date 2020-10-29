%% Script to generate the clustering data for U2FS simulations
%  In "Utility metric for Unsupervised feature selection", 
%  Amalia Villa, Abhijith Mundanad Narayanan, Sabine Van Huffel, Alexander
%  Bertrand, Carolina Varon

close all;
clearvars;
clc;

addpath('./datasetsSimulation');
%% Clouds

numpoints = 2000;
data = [];
centers = [-3 2;-4 4;-5 1];

for i=1:3
    data = [data;0.25*randn(numpoints,2)+...
        repmat(centers(i,:),numpoints,1)];
end

simul.clouds.fea = data;
simul.clouds.gnd = [ones(numpoints,1);2*ones(numpoints,1);3*ones(numpoints,1)];

%% Moons

N = 2000;
minx = -20;
noise = 0.5;
ratio = 0.6;
r2 = 35;

phi2 = rand(N/2,1) * pi;
fea = [minx + r2 * sin(phi2) - .5 * noise  + noise * rand(N/2,1) r2 * ratio * cos(phi2) - .5 * noise  + noise * rand(N/2,1) zeros(N/2,1)];
fea2 = -1.*fea(:,1:2);
fea2(:,1) = fea2(:,1) - 20*ones(size(fea2,1),1);
fea2(:,2) = fea2(:,2) - 20*ones(size(fea2,1),1);
fea2(:,3) = ones(size(fea2,1),1);

fea = [fea;fea2];
fea(:,1:2) = fea(:,1:2)+1.1*randn(size(fea,1),2);

simul.moons.fea = fea(:,1:2);
simul.moons.gnd = fea(:,3) + ones(size(fea,1),1);

%% Spirals

N = 50;
data = twospirals(N, 400, 90, 1); 

simul.spirals.fea = data(:,1:2);
simul.spirals.gnd = data(:,3) + ones(size(data,1),1);

%% Cornerns

data = corners(N, 1, 2, 1);

simul.corners.fea = data(:,1:2);
simul.corners.gnd = data(:,3) + ones(size(data,1),1);

%% Half Kernel

data = halfkernel(N, 10, 2, 4, 0.5, 5);

simul.halfKer.fea = data(:,1:2);
simul.halfKer.gnd = data(:,3) + ones(size(data,1),1);

%% CresMoon

data = crescentfullmoon(N);
simul.cresMoon.fea = data(:,1:2);
simul.cresMoon.gnd = data(:,3);

%% Add extra features
datasets = fieldnames(simul);
titsData = {'Clouds', 'Moons', 'Spirals', 'Corners', 'Half-Ker', 'Cres-Moon'};

for p = 1 : length(datasets)

    fea = simul.(datasets{p}).fea(:,1:2);
    
    % Original num features
    ref = size(fea,2);
    % Labels
    labs = simul.(datasets{p}).gnd;
    % Number of clusters
    numClus = length(unique(labs));
    
    %% Add features

    % New distribution f1
    fea(:,3) = pearsrnd(mean(fea(:,1)),std(fea(:,1)),skewness(fea(:,1)),kurtosis(fea(:,1)),length(fea(:,1)),1);
    % New distribution f2
    fea(:,4) = pearsrnd(mean(fea(:,2)),std(fea(:,2)),skewness(fea(:,2)),kurtosis(fea(:,2)),length(fea(:,2)),1);
    % Noisy version f1
    fea(:,5) = (fea(:,1)+1.5*randn(size(fea(:,1),1),1)*sqrt(max(fea(:,1))-min(fea(:,1))));
    % Noisy version f2
    fea(:,6) = (fea(:,2)+1.5*randn(size(fea(:,2),1),1)*sqrt(max(fea(:,2))-min(fea(:,2))));
    
    fea = zscore(fea);
    % Constant
    fea(:,7) = zeros(size(fea,1),1);
    
    simul.(datasets{p}).fea = fea;
    
end