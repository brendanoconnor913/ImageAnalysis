
% im = imread('bird.jpg');
load('fid.mat');
datadir  = 'data/';
num_mps  = size(mp_fid,1);
num_nmps = size(nmp_fid,1);

% True positives
for i=1:num_mps
    im1  = imread([datadir mp_fid{i,1}]);
    im2  = imread([datadir mp_fid{i,2}]);
    hsv1 = getHsvHist(im1);
    hsv2 = getHsvHist(im2);
    hog1 = getHog(im1);
    hog2 = getHog(im2);
    
    tphsvdists(i,:)   = getHsvDist(hsv1, hsv2);
    tphogdists(i,:)   = getHogDist(hog1, hog2);
    tpfuseddists(i,:) = getFusedDist(hsv1, hog1, hsv2, hog2);
end

% True negatives
for i=1:num_nmps
    im1  = imread([datadir nmp_fid{i,1}]);
    im2  = imread([datadir nmp_fid{i,2}]);
    hsv1 = getHsvHist(im1);
    hsv2 = getHsvHist(im2);
    hog1 = getHog(im1);
    hog2 = getHog(im2);
    
    tnhsvdists(i,:)   = getHsvDist(hsv1, hsv2);
    tnhogdists(i,:)   = getHogDist(hog1, hog2);
    tnfuseddists(i,:) = getFusedDist(hsv1, hog1, hsv2, hog2);
end

% Hsv distance histogram
f = figure;
histogram(tphsvdists(:,1),20);
hold on
histogram(tnhsvdists(:,1),20);
saveas(f, 'wholeimagehsvdistances.png')

% HoG distance histogram
f = figure;
histogram(tphogdists(:,1),20);
hold on
histogram(tnhogdists(:,1),20);
saveas(f, 'wholeimagehogdistances.png')

% Hsv 2x2 distance histogram
f = figure;
histogram(tphsvdists(:,2),20);
hold on
histogram(tnhsvdists(:,2),20);
saveas(f, '2x2hsvdistances.png')

% HoG 2x2 distance histogram
f = figure;
histogram(tphogdists(:,2),20);
hold on
histogram(tnhogdists(:,2),20);
saveas(f, '2x2hogdistances.png')

% Fused distance histogram
f = figure;
histogram(tpfuseddists(:,1),20);
hold on
histogram(tnfuseddists(:,1),20);
saveas(f, 'wholefuseddistances.png')

% Fused 2x2 distance histogram
f = figure;
histogram(tpfuseddists(:,2),20);
hold on
histogram(tnfuseddists(:,2),20);
saveas(f, '2x2fuseddistances.png')



