% Image Sharpening
clear, clc, close all;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pkg load image;
%img = im2double(imread('duck.png'));
img = im2double(imread('street.jfif'));

%apply two sharpening filters 3x3 to the degraded image
h1 = [0 -1 0; -1 10 -1; 0 -1 0] / 5;
h2 = [0 -1 0; -1 5 -1; 0 -1 0];

img_sharpened1 = imfilter(img, h1, "symmetric");
img_sharpened2 = imfilter(img, h2, "replicate");

%plot image
FS = 15
figure, clf;

subplot(1, 3, 1), imshow(img), title('Origin Img', "fontsize", FS);
subplot(1, 3, 2), imshow(img_sharpened1), title('Sharpening 1', "fontsize", FS);
subplot(1, 3, 3), imshow(img_sharpened2), title('Sharpening 2', "fontsize", FS);

saveas(gcf, "Sharpening Image");

