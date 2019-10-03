% create invt list and hamming distance table for hash
% z.li, 2017/07/07, started
% input:
%   q - query hash
%   r - hamming distance
%   indx - hash index, precomputed with getHashIndex()
% output:
%   hoffs - offset in the hash table
 function [hoffs,dist,offs,vlist]=fastHashSearch(q, r, indx)
dbg=0;
if dbg
    n=1200; kd=8; 
    H=zeros(n, kd); h=randn(n,kd); H(find(h>=0))=1;
    indx = getHashIndex(H); 
    q = H(12,:); r=1; 
    t0=cputime;
end

% find code with hamming distance <= r
dist = pdist2(indx.h, q, 'minkowski', 1); 
offs = find(dist <= r); 

% offset in the hash H
vlist = indx.list(offs);
hoffs = cell2mat(vlist);

if dbg
    fprintf('\n t=%1.4f s hamming distance:', cputime-t0); %fprintf('%d ', pdist2(H(hoffs,:), q, 'minkowski', 1));
end

return;