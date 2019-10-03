function [fv] = getFV(im, gmm, A)
k = 20;
[f,d] = getImageSift(im,k);
newvec = cast(d,'single')*A;
fv = vl_fisher(newvec',gmm.m,gmm.s,gmm.p);
end

