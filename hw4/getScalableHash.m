function [fvhash] = getScalableHash(fv,bits,lat,gmm,a)

kd=size(gmm.m,1);
nc=size(gmm.m,2);

lambda=lat(1:kd);
lambda = lambda/sum(lambda);
% a=0.3;

for k=1:kd
    for j=1:nc
        s(j, k) = a*lambda(k) + (1-a)*gmm.p(j);%cut down dimensions of the vector for compact hash
    end
end

[ds, indx]=sort(s(:),'descend');

bfv=zeros(1,2*kd*nc);
bfv(fv>=0)=1;
fvhash=bfv(indx(1:bits));
end

