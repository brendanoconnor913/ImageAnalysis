function [ h ] = hsv2Hist( hsvim )

h1 = hist(hsvim(:,1),8);
h2 = hist(hsvim(:,2),4);
h3 = hist(hsvim(:,3),4);
h = [h1, h2, h3];

end

