clear all
close all

I1 = im2double(imread('hitler.jpg'));
I2 = im2double(imread('pomona.jpg'));
mask = im2double(imread('mask.jpg'));


grayI1 = rgb2gray(I1);
grayI2 = rgb2gray(I2);
mask = rgb2gray(mask);

sigma = 4;
levels = 5;

blendedImage = blendImage(grayI1, grayI2, mask, sigma, levels);
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


