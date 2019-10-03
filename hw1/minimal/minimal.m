load('fid.mat');
for i=1:size(mp_fid,1)
    im1=imread(['data/',mp_fid{i,1}]);im2=imread(['data/',mp_fid{i,2}]);
    hsv1=getHsvHist(im1);hsv2=getHsvHist(im2);hog1=getHog(im1);hog2=getHog(im2);
    tpv(i,:)=pdist2(hsv1(1,:),hsv2(1,:));tpg(i,:)=pdist2(hog1(1,:),hog2(1,:));
    tpf(i,:)=pdist2([hog1(1,:),(mean(hsv1(1,:),2))/10^7],[hog2(1,:),(mean(hsv2(1,:),2))/10^7]);
end
for i=1:size(nmp_fid,1)
    im1=imread(['data/',nmp_fid{i,1}]);im2=imread(['data/',nmp_fid{i,2}]);
    hsv1=getHsvHist(im1);hsv2=getHsvHist(im2);hog1=getHog(im1);hog2=getHog(im2);
    tnv(i,:)=pdist2(hsv1(1,:),hsv2(1,:));tng(i,:)=pdist2(hog1(1,:),hog2(1,:));
    tnf(i,:)=pdist2([hog1(1,:),(mean(hsv1(1,:),2))/10^7],[hog2(1,:),(mean(hsv2(1,:),2))/10^7]);
end
f=figure;histogram(tpv(:,1),20);hold on;histogram(tnv(:,1),20);
saveas(f,'wholeimagehsvdistances.png');f=figure;histogram(tpg(:,1),20);hold on
histogram(tng(:,1),20);saveas(f, 'wholeimagehogdistances.png');f=figure;
histogram(tpf(:,1),20);hold on;histogram(tnf(:,1),20);saveas(f, 'wholefuseddistances.png')