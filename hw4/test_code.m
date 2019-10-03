% load('p_1080_32bits .mat');
% H = p_1080_32bits;

% load('p_720_32bits .mat');
% H = p_720_32bits;

load('p_720_low_32bits .mat');
H = p_720_low_32bits;

hit=0;
substring=8;
indx=getHashIndex(H(:,1:substring));

tic
for i11=1:1000
    rng(1)
    a1=randi(length(H)-4);
    
    query=H(a1:a1+4,1:substring);

    hoff= fast_search_with_r(indx,query);
 
    for k10=1:5
        an(k10)= find(ismember(hoff{1,k10},a1+k10-1)==1);
    end
    
    if(length(an)==5)
        hit=hit+1;
    end
end
toc