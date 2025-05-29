% Rotating images
clear, clc, close all;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pkg load image;
% a. Flipping
img = imread('eight.png');

theta = 90;
img_rot = imrotate(img, theta);

%plot image
FS = 15
figure, clf;

subplot(1, 2, 1), imshow(img), title('Org Img', "fontsize", FS);
subplot(1, 2, 2), imshow(img_rot), title('Img Rotate', "fontsize", FS);

saveas(gcf, 'img rotate.jpg');

