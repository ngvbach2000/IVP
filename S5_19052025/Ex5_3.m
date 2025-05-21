% noise mean filtering
clear, clc, close all;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pkg load image;
img = imread('coins.tif');

img_noise = imnoise(img, "Gaussian", 0, 0.05);

%show image
FS = 15;
figure(1), clf;

subplot(1,2,1), imshow(img), title('Origin image', "fontsize", FS);
subplot(1,2,2), imshow(img_noise), title('Noise filter image', "fontsize", FS);
saveas(1, 'Noise filter image.jpg');

% apply an averaing filter using two different kernel sizes
%a. default kernel 3x3
f1 = fspecial('average');
img_noise1 = imfilter(img_noise, f1);

%b. default kernel 5x5
f2 = fspecial('average', [5 5]);
img_noise2 = imfilter(img_noise, f2);

%show image
FS = 15;
figure(2), clf;

subplot(1,2,1), imshow(img_noise1), title('Image noise 3x3', "fontsize", FS);
subplot(1,2,2), imshow(img_noise2), title('Image noise 5x5', "fontsize", FS);
saveas(2, 'Noise filter image with different kernel size.jpg');




