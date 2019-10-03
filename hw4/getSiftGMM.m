function [gmm, A, lat] = getSiftGMM(siftTrainData,kd,nc)
[load, score, lat] = pca(cast(siftTrainData,'single'));
A = load(:,1:kd);
lowDdata = cast(siftTrainData,'single')*A;
[gmm.m, gmm.s, gmm.p] = vl_gmm(lowDdata', nc);
end

