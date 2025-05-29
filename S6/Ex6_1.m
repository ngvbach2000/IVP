%Ex6_1 Image Sharpening
clear, clc, close all;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pkg load image;
%load test image
%Img = im2double(imread('duck.png'));
Img = im2double(imread('street.jfif'));

%apply two sharpening filters 3x3 to the degraded image
h1 = [0 -1 0; -1 10 -1; 0 -1 0] / 5;
h2 = [0 -1 0; -1 5 -1; 0 -1 0];

Img_sharpened1 = imfilter(Img, h1, 'symmetric');
Img_sharpened2 = imfilter(Img, h2, 'replicate');

%show images
FS = 15; %fontsize of caption
figure, clf;
subplot(1,3,1), imshow(Img), title('Original Image', "fontsize", FS);
subplot(1,3,2), imshow(Img_sharpened1), title('Sharpening 1', "fontsize", FS);
subplot(1,3,3), imshow(Img_sharpened2), title('Sharpening 2', "fontsize", FS);
saveas(gcf, 'Sharpening Images.jpg');
