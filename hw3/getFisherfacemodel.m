function [A1] = getFisherfacemodel(faces, A0, ids, d0, d1)

x=faces*A0; 

[A1, lat]=getLDA(x,ids);

% Eigenvalues
figure(50); 
subplot(1,2,1); grid on; hold on; stem(lat, '.'); 
f_eng=lat.*lat; 
subplot(1,2,2); grid on; hold on; plot(cumsum(f_eng)/sum(f_eng), '.-'); 

% Eigenfaces
figure(51); 
for k=1:d1
    subplot(2,d1/2,k); colormap('gray'); 
    imagesc(reshape(A1(:,k), [sqrt(d0), sqrt(d0)]));
    title(sprintf('eigf_%d', k));
end

A1 = A1(:,1:d1);
end
