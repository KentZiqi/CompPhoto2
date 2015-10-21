function image = unsharp(image_name,sigma,hsize,sharpen_index)
    figure
    I = im2double(imread(image_name));
    h = fspecial('gaussian', hsize, sigma);
    J = imfilter(I,h);
    image = I + sharpen_index*(I-J);
    
    subplot(1,3,1)
    imshow(I)
    subplot(1,3,2)
    imshow(J)
    subplot(1,3,3)
    imshow(image)
    imwrite(image, 'sharp.jpg')
end