load('fid.mat');
datadir  = 'data/';
k = 20;
kd = 10;
nc = 64;
numim = 100;
labels = [ones(100), zeros(200)];
% Aggregate 100 images sift vectors
for i=1:numim
    im  = imread([datadir mp_fid{i,1}]);
    [f,d] = getImageSift(im,k);
    if i == 1
       siftTrainData = d;
    else
        siftTrainData = [siftTrainData; d];
    end
end

[gmm, A] = getSiftGMM(siftTrainData,kd,nc);


%% Calculate fv distances and roc
labels = [ones([1 100]) zeros([1 200])];
mpdists = zeros([1 100]);
nmpdists = zeros([1 200]);
k = 20;

for i=1:100
    im  = imread([datadir mp_fid{i,1}]);
    x = getFV(im, gmm, A);
    
    im  = imread([datadir mp_fid{i,2}]);
    y = getFV(im, gmm, A);
    
    mpdists(1,i) = pdist2(x',y');
end

for i=1:200
    im  = imread([datadir nmp_fid{i,1}]);
    x = getFV(im, gmm, A);
    
    im  = imread([datadir nmp_fid{i,2}]);
    y = getFV(im, gmm, A);
    
    nmpdists(1,i) = pdist2(x',y');
end

%% roc
h = figure;
hold on;
plotroc(labels, [mpdists nmpdists])
saveas(h, strcat('ROC.png'))
