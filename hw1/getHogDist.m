function [dist] = getHogDist(hog1,hog2)
% dist(1) = whole image dist(2) ave 2x2 distance
wholeimage1 = hog1(1,:);
wholeimage2 = hog2(1,:);

dist(1) = pdist2(wholeimage1, wholeimage2);

aveimage1 = mean(hog1(2:5,:));
aveimage2 = mean(hog2(2:5,:));
dist(2) = pdist2(aveimage1, aveimage2);

end

