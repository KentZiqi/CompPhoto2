clear all
close all

file_1_name = 'kent.jpg';
file_2_name = 'zq.jpg';
output_name = 'hybrid_people.jpg';
gamma1 = 5;
gamma2 = 50;
hsize1 = 100;
hsize2 = 100;

I1 = im2double(imread(file_1_name));
I2 = im2double(imread(file_2_name));

figure
imshow(I1)
[x1, y1] = ginput(1); % Click on left eye
figure
imshow(I2)
[x2, y2] = ginput(1); % Click on left eye

% Shifts image 2 to align eyes
I2 = circshift(I2, [round(x1 - x2) round(y1 - y2)]);

image = hybrid(I1, I2, hsize1, gamma1, hsize2, gamma2);
imwrite(image, output_name)

%% Uncomment to show final image
% figure
% imshow(image)