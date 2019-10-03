function [h] = getHsvHist(im);hsvim=rgb2hsv(im);
[r,c]=size(im);incr=r*c/4;newhsv=reshape(hsvim,[r*c,3]);
sn={[1,r*c];[1,incr];[incr+1,2*incr];[2*incr+1,3*incr];[3*incr+1,4*incr]};
for i=1:5
    startx=sn{i}(1);stopx= sn{i}(2);hsvim=newhsv(startx:stopx,:);
    h(i,:)=[hist(hsvim(:,1),8), hist(hsvim(:,2),4), hist(hsvim(:,3),4)];
end
end