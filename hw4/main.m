%%
load('fid.mat');
datadir  = 'data/';
k = 20;
kd = 32;
nc = 128;
numim = 100;
hashbits = 32;
alpha = .3;

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

[gmm, A, lat] = getSiftGMM(siftTrainData,kd,nc);


%% Calculate fv distances and roc
labels = [ones([1 100]) zeros([1 200])];
mpdists = zeros([1 100]);
nmpdists = zeros([1 200]);
k = 20;
H=[];

for i=1:100
    im  = imread([datadir mp_fid{i,1}]);
    x = getFV(im, gmm, A);
    bx = getScalableHash(x, hashbits, lat, gmm, alpha);
    H(end+1, :) = bx;
    
    im  = imread([datadir mp_fid{i,2}]);
    y = getFV(im, gmm, A);
    by = getScalableHash(y, hashbits, lat, gmm, alpha);
    
    mpdists(1,i) = pdist2(bx,by,'minkowski',1);
end

for i=1:200
    im  = imread([datadir nmp_fid{i,1}]);
    x = getFV(im, gmm, A);
    bx = getScalableHash(x, hashbits, lat, gmm, alpha);
    H(end+1, :) = bx;
    
    im  = imread([datadir nmp_fid{i,2}]);
    y = getFV(im, gmm, A);
    by = getScalableHash(y, hashbits, lat, gmm, alpha);
    
    nmpdists(1,i) = pdist2(bx,by,'minkowski',1);
end

%% roc
% h = figure;
% hold on;
% plotroc(labels, [mpdists nmpdists])
% saveas(h, strcat('ROC.png'))

indx = getHashIndex(H);
