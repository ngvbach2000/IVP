% zooming images with interpolation methods
clear, clc, close all;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pkg load image;
img = imread('bird.jpg');

img_z1 = imresize(img, 2); %by default, bicubuc
img_z2 = imresize(img, 3, 'nearest');
img_z3 = imresize(img, 4, 'bilinear');

%plot image
FS = 15
figure, clf;

subplot(1, 4, 1), imshow(img), title('Origin Img', "fontsize", FS);
subplot(1, 4, 2), imshow(img_z1), title('Zooming Img 1', "fontsize", FS);
subplot(1, 4, 3), imshow(img_z2), title('Zooming Img 2', "fontsize", FS);
subplot(1, 4, 4), imshow(img_z3), title('Zooming Img 3', "fontsize", FS);

saveas(gcf, 'img zoom.jpg');


