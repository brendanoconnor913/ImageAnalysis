function[hog]=getHog(im);[h,w]=size(rgb2gray(im));
sn={[1,w,1,h];[1,w/2,1,h/2];[w/2+1,w,1,h/2];[1,w/2,h/2+1,h];[w/2+1,w,h/2+1,h]};
for i = 1:5
    starty=sn{i}(1);stopy= sn{i}(2);startx=sn{i}(3);stopx=sn{i}(4);grayim=single(rgb2gray(im));
    ihog = vl_hog(grayim(startx:stopx,starty:stopy),8,'variant','dalaltriggs','numOrientations',8);
    [m,n,d]=size(ihog);hog(i,:)=mean(reshape(ihog,[m*n,d]));
end
end