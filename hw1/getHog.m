function [hog] = getHog(im)
grayim =  single(rgb2gray(im));
[w, h] = size(grayim);
ihog = vl_hog(grayim,8,'variant','dalaltriggs','numOrientations',8);
[m,n,d] = size(ihog);
hog(1,:) = mean(reshape(ihog,[m*n,d]));

s1 = [1, w/2, 1, h/2];
s2 = [w/2+1, w, 1, h/2];
s3 = [1, w/2, h/2+1, h];
s4 = [w/2+1, w, h/2+1, h];
sn = {s1 s2 s3 s4};

for i = 1:4
    s = sn{i};
    startx = s(1);
    stopx  = s(2);
    starty = s(3);
    stopy  = s(4);
    
    ihog = vl_hog(grayim(startx:stopx,starty:stopy),...
        8,'variant','dalaltriggs','numOrientations',8);
    [m,n,d] = size(ihog);
    hog(end+1,:) = mean(reshape(ihog,[m*n,d]));
end

end

