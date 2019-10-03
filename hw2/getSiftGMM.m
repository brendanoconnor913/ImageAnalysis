function [gmm, A] = getSiftGMM(siftTrainData,kd,nc)
load = pca(cast(siftTrainData,'single'));
A = load(:,1:kd);
lowDdata = cast(siftTrainData,'single')*A;
[gmm.m, gmm.s, gmm.p] = vl_gmm(lowDdata', nc);
end

