function [A0, eigv] = getEigenfacemodel(faces,kd)
[A1, s, lat]=princomp(faces); 

h=20; w=20;

% Eigenvalues
figure(30); 
subplot(1,2,1); grid on; hold on; stem(lat, '.'); 
f_eng=lat.*lat; 
subplot(1,2,2); grid on; hold on; plot(cumsum(f_eng)/sum(f_eng), '.-'); 

% Eigenfaces
figure(31); 
for k=1:kd
    subplot(4,kd/4,k); colormap('gray'); imagesc(reshape(A1(:,k), [h, w]));
    title(sprintf('eigf_%d', k));
end

A0 = A1(:,1:kd);
eigv = lat(1:kd);
display(["energy lost: " sum(lat(kd:end))]);
end

