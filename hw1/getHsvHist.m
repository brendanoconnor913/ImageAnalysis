function [h] = getHsvHist(im)

hsvim = rgb2hsv(im);
r = size(im, 1);
c = size(im, 2);
newd = r*c;

newhsv = reshape(hsvim, [newd, 3]);
h(1,:) = hsv2Hist(newhsv);

incr = newd / 4;
for i=1:4
    if i == 1
        strtindx = 1;
        stopindx = incr;
    else
        strtindx = (i-1)*incr + 1;
        stopindx = i*incr;
    end
    h(end+1,:) = hsv2Hist(newhsv(strtindx:stopindx,:));
end

end

