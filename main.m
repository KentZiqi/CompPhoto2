clear all
close all

I1 = im2double(imread('orange.jpg'));
I2 = im2double(imread('apple_color.jpg'));

R1 = I1(:, :, 1);
G1 = I1(:, :, 2);
B1 = I1(:, :, 3);

R2 = I2(:, :, 1);
G2 = I2(:, :, 2);
B2 = I2(:, :, 3);

[x,y] = size(R1);
mask = zeros(x,y);
mask(:,1:y/2) = 1;
% mask = rgb2gray(im2double(imread('mask.jpg')));

sigma = 4;
levels = 6;

blendedImageR = blendImage(R1, R2, mask, sigma, levels);
blendedImageG = blendImage(G1, G2, mask, sigma, levels);
blendedImageB = blendImage(B1, B2, mask, sigma, levels);

blendedImage = cat(3, blendedImageR, blendedImageG, blendedImageB);
figure
imshow(blendedImage)
imwrite(blendedImage, 'hilter_pomona.jpg')

% [laplacians,gaussians] = getLaplaciansAndGaussians(grayI1,5,sigma);

% additions = zeros(x,y);
% figure
% for i = [1:1:4]
%     subplot(1,4,i);
%     imshow(laplacians{i});
%     additions = additions + laplacians{i};
% end
% tightfig;
% 
% additions = gaussians{5} + additions;
% 
% figure
% imshow(additions)
% figure
% imshow(gaussians{10})


