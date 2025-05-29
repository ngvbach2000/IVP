% Change Object color using Segmentation
clear, clc, close all;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pkg load image;

%load test image
img = imread('shapes.png');

%binarize the input image
img_grayscale = rgb2gray(img);

%binarize the input image
level = graythresh(img_grayscale);
img_BW = 1 - im2bw(img_grayscale, level);

%change object color
[L, obj] = bwlabel(img_BW, 6);

%1. circle: dark gray
%2. square: black
%3. regtangle: organge
%4. asterisk: cyan
%5. pentagon: yellow
cmap = [128 128 128; 0 0 0; 255 165 0; 0 255 255; 255 255 0] / 255;
rgblabel = label2rgb(L, cmap);

FS = 15;
figure, clf;
subplot(2, 2, 1), imshow(img), title('Origin Image', "fontsize", FS);
subplot(2, 2, 2), imshow(img_grayscale), title('Gray scale Image', "fontsize", FS);
subplot(2, 2, 3), imshow(img_BW), title('Binary Image', "fontsize", FS);
subplot(2, 2, 4), imshow(rgblabel), title('Converted Color Image', "fontsize", FS);
saveas(gcf, "Change Object color using Segmentation.jpg");

