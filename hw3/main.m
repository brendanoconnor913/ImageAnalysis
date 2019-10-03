
load("faces-ids.mat")
load("JDimages.mat")
path(path, './LPP');

newids = repmat([999],[10 1]);
ids = [ids; newids];
faces = [faces; jdfaces];

n=length(ids); 
uid = unique(ids); 
m = length(uid);

% query data index:
q_indx = zeros(1, m); 
for k=1:m 
      offs = find(ids==uid(k)); 
      q_indx(k) = offs(1); 
end
train = faces;
train(q_indx,:)= [];
trainids = ids;
trainids(q_indx,:) = [];

d0 = 6^2;
% d0 = 8;
d1 = 4^2;
d2 = 4^2;

[A0, eigv] = getEigenfacemodel(train, d0);
% [A1] = getFisherfacemodel(train, A0, trainids, d0, d1);
[A2, S] = getLaplacianfacemodel(train, A0, trainids, d0, d2);

s