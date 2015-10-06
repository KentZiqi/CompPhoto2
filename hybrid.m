function hb = hybrid(I1,I2,hsize1,gamma1,hsize2,gamma2)
    filter1 = fspecial('gaussian', hsize1, gamma1);
    filter2 = fspecial('gaussian', hsize2, gamma2);
    low = imfilter(I1,filter1);
    high = I2-imfilter(I2,filter2);
    hb = (low+high)./2;
    imshow(hb)
end