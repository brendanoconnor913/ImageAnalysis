function [f,d] = getImageSift(im, k)
grayim = single(rgb2gray(im));

[fi,di] = vl_sift(grayim);
[v,i] = sort(fi(5,:),'descend');
topk = i(1:k);

f = fi(:,topk)';
d = di(:,topk)';
end