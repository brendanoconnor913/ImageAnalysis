function [A2, S] = getLaplacianfacemodel(faces, A0, ids, d0, d2)

x=faces*A0; 

% LPP - compute affinity
f_dist1 = pdist2(x, x);
% heat kernel size
mdist = mean(f_dist1(:)); h = -log(0.20)/mdist; 
S1 = exp(-h*f_dist1); 
figure(32); subplot(2,2,1); imagesc(f_dist1); colormap('gray'); title('d(x_i, d_j)');
subplot(2,2,2); imagesc(S1); colormap('gray'); title('affinity'); 
% utilize supervised info
id_dist = pdist2(ids, ids);
subplot(2,2,3); imagesc(id_dist); title('label distance');
S2=S1; S2(find(id_dist~=0)) = 0; 
subplot(2,2,4); imagesc(S1); colormap('gray'); title('affinity-supervised');  

% laplacian face
lpp_opt.PCARatio = 1; 
[A2, eigv2]=LPP(S2, lpp_opt, x); 
A2 = A2(:,1:d2);

for k=1:d2
   figure(88);
   subplot(2,d2/2,k); colormap('gray');
   imagesc(reshape(A2(:,k), [sqrt(d0), sqrt(d0)])); 
   title(sprintf('lapf_%d', k)); 
end

S = S2;

end

