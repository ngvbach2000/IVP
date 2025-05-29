%Ex9_3 Change obhects' color using Segmentation
clear, clc, close all;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pkg load image;
%load test image
Img = imread('shapes.png');

%convert the input image to grayscale
Img_grayscale = rgb2gray(Img);
%binarize the input image
level = graythresh(Img_grayscale);
Img_BW = 1 - im2bw(Img_grayscale, level);

%change objects' color
[L, obj] = bwlabel(Img_BW, 6);
%1. circle: dark gray; 2. square: black;
%3. rectangle: orange; 4. asterisk: cyan; 5. pentagon: yellow
cmap = [128 128 128; 0 0 0; 255 165 0; 0 255 255; 255 255 0] / 255; %RGB
rgblabel = label2rgb(L, cmap);

%show images
FS = 15; %fontsize of caption
figure, clf;
subplot(2,2,1), imshow(Img), title('Original Image', "fontsize", FS);
subplot(2,2,2), imshow(Img_grayscale), title('Grayscale Image', "fontsize", FS);
subplot(2,2,3), imshow(Img_BW), title('Binary Image', "fontsize", FS);
subplot(2,2,4), imshow(rgblabel), title('Converted Color Image', "fontsize", FS);
saveas(gcf, 'Converted Color Image.jpg');
