clear all
close all

I1 = im2double(imread('hitler.jpg'));
I2 = im2double(imread('pomona.jpg'));
mask = im2double(imread('mask.jpg'));


grayI1 = rgb2gray(I1);
grayI2 = rgb2gray(I2);
mask = rgb2gray(mask);

sigma = 4;

% [laplacians,gaussians] = getLaplacians(grayI1,5,sigma);

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

[x,y] = size(grayI1);
maskOnes = ones(x,y);
[laplaciansApple,gaussiansApple] = getLaplacians(grayI1,5,sigma);
[laplaciansOrange,gaussiansOrange] = getLaplacians(grayI2,5,sigma);
[laplaciansMask,gaussiansMask] = getLaplacians(mask,5,sigma);
oraple = gaussiansMask{5} .* gaussiansApple{5} + (maskOnes - gaussiansMask{5}) .* gaussiansOrange{5};
for i = [1:1:4]
    halfApple = laplaciansApple{i} .* gaussiansMask{i};
    maskOther = maskOnes - gaussiansMask{i};
    halfOrange = laplaciansOrange{i} .* maskOther;
    figure
    imshow(halfApple)
    figure
    imshow(halfOrange)
    orapleAtCurrentLevel = halfApple + halfOrange;
    oraple = oraple + orapleAtCurrentLevel;
end
figure
imshow(oraple)
imwrite(oraple, 'oraple.jpg')



