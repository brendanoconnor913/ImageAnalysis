

lambda=lat(1:kd);
lambda = lambda/sum(lambda);
a=0.3;
bitsize=32;

for k=1:kd
    for j=1:nc
        s(j, k) = a*lambda(k) + (1-a)*gmm.p(j);%cut down dimensions of the vector for compact hash
    end
end

[ds indx]=sort(s(:),'descend');

fv=randn(1,2*kd*nc);
bfv=zeros(1,2*kd*nc);
bfv(fv>=0)=1;
fvhash=bfv(indx(1:bitsize));