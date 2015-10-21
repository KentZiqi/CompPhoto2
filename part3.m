clear all
close all

file_name = 'hitler_pomona_hybrid.jpg';
levels = 6;
sigma = 2;

image = im2double(imread(file_name));
[laplacians,gaussians] = getLaplaciansAndGaussians(image, levels, sigma);

[x,y] = size(image);
additions = zeros(x,y);
figure
for i = [1:1:(levels-1)]
    subplot(2,(levels-1),i);
    laplacian = normalizeImage(laplacians{i});
    imshow(laplacian);
    imwrite(laplacian, strcat('latex/second_laplacian_', int2str(i), '.jpg'))
    subplot(2,(levels-1),i+(levels-1));
    gaussian = normalizeImage(gaussians{i});
    imshow(gaussian);
    imwrite(gaussian, strcat('latex/second_gaussian_', int2str(i), '.jpg'))
    % additions = additions + laplacians{i};
end
% additions = gaussians{levels} + additions;
tightfig;

% figure
% imshow(additions);