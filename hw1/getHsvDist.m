function [dist] = getHsvDist(hsv1,hsv2)
% dist(1) = whole image dist(2) ave 2x2 distance
wholeimage1 = hsv1(1,:);
wholeimage2 = hsv2(1,:);

dist(1) = pdist2(wholeimage1, wholeimage2);

aveimage1 = mean(hsv1(2:5,:));
aveimage2 = mean(hsv2(2:5,:));
dist(2) = pdist2(aveimage1, aveimage2);
end

