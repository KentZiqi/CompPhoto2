I1 = im2double(imread('pomona/IMG_0784.JPG'));
I2 = im2double(imread('pomona/IMG_0783.JPG'));

hsize = 10;
sigma = 100;

getLaplacians(I1,10,hsize,sigma)