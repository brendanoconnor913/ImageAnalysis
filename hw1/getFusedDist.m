function [dist] = getFusedDist(hsv1,hog1,hsv2,hog2)

wholeimage1hsv = log2(mean(hsv1(1,:),2));
wholeimage1hog = hog1(1,:);
wholeimage2hsv = log2(mean(hsv2(1,:),2));
wholeimage2hog = hog2(1,:);

wholeimage1 = [wholeimage1hog wholeimage1hsv];
wholeimage2 = [wholeimage2hog wholeimage2hsv];

dist(1) = pdist2(wholeimage1, wholeimage2);

aveimage1hsv = log2(mean(mean(hsv1(2:5,:)),2));
aveimage1hog = mean(hog1(2:5,:));
aveimage2hsv = log2(mean(mean(hsv2(2:5,:)),2));
aveimage2hog = mean(hog2(2:5,:));

aveimage1 = [aveimage1hog aveimage1hsv];
aveimage2 = [aveimage2hog aveimage2hsv];

dist(2) = pdist2(aveimage1, aveimage2);

end

