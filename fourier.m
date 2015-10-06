function [II1,II2] = fourier(I1,I2)
    J1 = fftshift(fft2(I1));
    J2 = fftshift(fft2(I2));
    M1 = abs(J1);
    M2 = abs(J2);
    P1 = angle(J1);
    P2 = angle(J2);
    II1 = ifft2(ifftshift(M1 .* exp(1i*P2)));
    II2 = ifft2(ifftshift(M2 .* exp(1i*P1)));
    figure
    subplot(2,1,1)
    imshow(II1)
    subplot(2,1,2)
    imshow(II2)
end