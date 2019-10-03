function HOFFS1=fast_search_with_r(indx,query)

kd = size(query,2);
substring = size(indx.h,2);    %%% length of our hash bits .
% the length of each segment
m = kd/substring;
m = fix(m);

q=cell(1,m);
% % m segments
for i= 1:m
    q{i}=query(:,substring*i-(substring-1):substring*i);
end

r1=0;
for j1=1:size(query,1)
     for i=1:m
         hoffs{i}=fastHashSearch(q{i}(j1,:), r1, indx);
     end
     HOFFS = cell2mat(hoffs);

%      hoffs = fastHashSearch(query(j1,:),r1,indx);
     HOFFS1{j1} =unique(HOFFS);%deduplication
 end

 
%dist=pdist2(H(HOFFS1{1,3},:),query,'minkowski', 1);
% offs=[];
% hashcode=[];
% %find the true <= r hashcodes
% for i= 1:length(HOFFS1)
%      dist = pdist2(H(HOFFS1(i),:), query, 'minkowski', 1); 
%     if dist <= r
%        offs = [offs HOFFS1(i)];
%        hashcode = [hashcode;H(HOFFS1(i),:)];
%     end
%     fprintf('%d\n',i);
% end    
% 
% list = [offs',hashcode];%The first column of list stores the offsets of hashcodes, and others storage hashcodes


