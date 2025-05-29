% Flipping, Rotating images
clear, clc, close all;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pkg load image;
% a. Flipping
img = imread('atrium.jpg');
img_ud = flipud(img); %up to down
img_lr = fliplr(img); %left to right

%plot image
FS = 15
figure, clf;

subplot(1, 3, 1), imshow(img), title('Org Img', "fontsize", FS);
subplot(1, 3, 2), imshow(img_ud), title('Img Up Down', "fontsize", FS);
subplot(1, 3, 3), imshow(img_lr), title('Img Left Right', "fontsize", FS);

saveas(gcf, 'img_flipping.jpg');

