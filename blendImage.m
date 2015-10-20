function blendedImage = blendImage(image1, image2, maskOfImage1, sigma, levels)
    [x,y] = size(image1);
    onesMatrix = ones(x,y);
    [laplacians1, gaussians1] = getLaplaciansAndGaussians(image1, levels, sigma);
    [laplacians2, gaussians2] = getLaplaciansAndGaussians(image2, levels, sigma);
    [laplaciansMask, gaussiansMask] = getLaplaciansAndGaussians(maskOfImage1, levels, sigma);
    maskOfImage2 = onesMatrix - gaussiansMask{levels};
    blendedImage = gaussiansMask{levels} .* gaussians1{levels} + maskOfImage2 .* gaussians2{levels};
    for i = [1:1:(levels-1)]
        maskOfImage2 = onesMatrix - gaussiansMask{i};
        halfImage1 = laplacians1{i} .* gaussiansMask{i};
        halfImage2 = laplacians2{i} .* maskOfImage2;
        figure
        imshow(halfImage1)
        figure
        imshow(halfImage2)
        blendedImageAtCurrentLevel = halfImage1 + halfImage2;
        blendedImage = blendedImage + blendedImageAtCurrentLevel;
    end
end