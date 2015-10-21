function blendedImage = blendImage(image1, image2, maskOfImage1, sigma, levels)
    [x,y] = size(image1);
    onesMatrix = ones(x,y);
    [laplacians1, gaussians1] = getLaplaciansAndGaussians(image1, levels, sigma);
    [laplacians2, gaussians2] = getLaplaciansAndGaussians(image2, levels, sigma);
    [~, gaussiansMask] = getLaplaciansAndGaussians(maskOfImage1, levels, sigma);
    maskOfImage2 = onesMatrix - gaussiansMask{levels};
    blendedImage = gaussiansMask{levels} .* gaussians1{levels} + maskOfImage2 .* gaussians2{levels};
    for i = [1:1:(levels-1)]
        maskOfImage2 = onesMatrix - gaussiansMask{i};
        halfImage1 = laplacians1{i} .* gaussiansMask{i};
        halfImage2 = laplacians2{i} .* maskOfImage2;
        imwrite(normalizeImage(halfImage1), strcat('half_image_1_level_', int2str(i), '.jpg'))
        imwrite(normalizeImage(halfImage2), strcat('half_image_2_level_', int2str(i), '.jpg'))
        blendedImageAtCurrentLevel = halfImage1 + halfImage2;
        blendedImage = blendedImage + blendedImageAtCurrentLevel;
        imwrite(normalizeImage(blendedImageAtCurrentLevel), strcat('blended_image_level_', int2str(i), '.jpg'))
    end
end