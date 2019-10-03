% create invt list and hamming distance table for a given hash table
% input:
%   H - n x kd hash
% output:
%   indx.tab - kd x kd hamming dist table
%   indx.list - offset of kd-bit hash entries in H
% z.li, 2017/07/07, started
%function [indx]=getHashIndex(H)
function [indx]=getHashIndex(H)

[n, kd]=size(H);

% hamming distance table
h=de2bi([0:2^kd-1]); indx.h = h;
indx.tab = squareform(pdist(h, 'minkowski', 1));

% inverted list
list=cell(1, 2^kd);
for k=1:2^kd
    v = h(k,:); Hv = pdist2(H, v, 'minkowski', 1); 
    v_offs  = find(Hv==0); indx.list{k} = v_offs';
end


return;