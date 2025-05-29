%Ex5_3 Noise Mean Filtering
clear, clc, close all;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pkg load image;
%load test image
Img = imread('coins.tif');

%add Gaussian noise to the original image
Img_noise = imnoise(Img, 'Gaussian', 0, 0.05);

%show images
FS = 15; %fontsize of caption
figure(1), clf;
subplot(1,2,1), imshow(Img), title('Original Image', "fontsize", FS);
subplot(1,2,2), imshow(Img_noise), title('Noisy Image', "fontsize", FS);
saveas(1, 'Original vs. Noisy Image.jpg');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%apply an averaging filter using two different kernel sizes
%a. default kernel 3x3
f1 = fspecial('average'); %default size = 3x3
Img_denoise1 = imfilter(Img_noise, f1);

%b. a defined kernel 5x5
f2 = fspecial('average', [5 5]);
Img_denoise2 = imfilter(Img_noise, f2);

%show images
figure(2), clf;
subplot(1,2,1), imshow(Img_denoise1), title('Denoise with 3x3 kernel', "fontsize", FS);
subplot(1,2,2), imshow(Img_denoise2), title('Denoise with 5x5 kernel', "fontsize", FS);
saveas(2, 'Filtered Image with Different Kernel Sizes.jpg');
