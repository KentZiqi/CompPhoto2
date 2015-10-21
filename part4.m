clear all
close all

sigma = 4;
levels = 6;

file_1_name = 'almond.jpg';
file_2_name = 'lemon.jpg';
output_name = 'result.jpg';

I1 = im2double(imread(file_1_name));
I2 = im2double(imread(file_2_name));

%% Default half-half vertical split mask
[x,y] = size(I1(:, :, 1));
mask = zeros(x,y);
mask(:,1:y/2) = 1; % Change to 1:x/2,: for horizontal

%% If you have a custom mask, uncomment here
%
% mask_name = 'mask.jpg';
% mask = rgb2gray(im2double(imread(mask_name)));

R1 = I1(:, :, 1);
G1 = I1(:, :, 2);
B1 = I1(:, :, 3);

R2 = I2(:, :, 1);
G2 = I2(:, :, 2);
B2 = I2(:, :, 3);

blendedImageR = blendImage(R1, R2, mask, sigma, levels);
blendedImageG = blendImage(G1, G2, mask, sigma, levels);
blendedImageB = blendImage(B1, B2, mask, sigma, levels);

blendedImage = cat(3, blendedImageR, blendedImageG, blendedImageB);
figure
imshow(blendedImage)
imwrite(blendedImage, output_name)


