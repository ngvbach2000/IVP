% Croping, zooming images
clear, clc, close all;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pkg load image;
img = imread('mandrill.tif');

x1 = 150; x2 = 450; y1 = 100; y2 = 500;
width = x2 - x1;
height = y2 - y1;
xmin = x1; ymin = y1;
img_crop = imcrop(img, [xmin ymin, width, height]);

%plot image
FS = 15
figure, clf;

subplot(1, 2, 1), imshow(img), title('Origin Img', "fontsize", FS);
subplot(1, 2, 2), imshow(img_crop), title('Croping Img', "fontsize", FS);

saveas(gcf, 'img crop.jpg');


