
ddir = dir('./jd/');
data = []; % Matrix to store all of our images
inc = 1;
% Read through all of the image directories and get the first half of each
% directory (5 of the 10 images)
for k = 3:length(ddir) % discard '.' and '..'
    fname = strcat('./jd/',ddir(k).name);
    disp(fname);

    % Scale the image and add to our matrix of all images
    m = imresize(double(rgb2gray(imread(fname)))/256, [1 400]);
    data(end+1,:) = m;
    inc = inc + 1;

end