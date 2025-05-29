%Ex9_1 Coins Counting using Dilation
clear, clc, close all;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pkg load image;
%load test image
Img = imread('coins.png');

%binarize the input image
level = graythresh(Img);
BW = 1 - im2bw(Img, level); %im2bw: coins=black, bg=white

%a. no dilation
[L1, obj1] = bwlabel(BW, 6);
rgbLabel1 = label2rgb(L1, 'jet', 'k');
printf("Number of coins before dilation: %d\n", obj1);

%use dilation
se = strel('disk', 25, 0);
BW_dilated = 1 - imdilate(im2bw(Img,level), se);

[L2, obj2] = bwlabel(BW_dilated, 6);
rgbLabel2 = label2rgb(L2, 'jet', 'k');
printf("Number of coins before dilation: %d\n", obj2);

%show images
FS = 15; %fontsize of caption
figure, clf;
subplot(2,2,1), imshow(Img), title('Original Image', "fontsize", FS);
subplot(2,2,2), imshow(BW), title('Binary Image', "fontsize", FS);
subplot(2,2,3), imshow(rgbLabel1), title('Labelling w.o. Dilation', "fontsize", FS);
subplot(2,2,4), imshow(rgbLabel2), title('Labelling w. Dilation', "fontsize", FS);

saveas(gcf, 'Coins Counting using Dilation.jpg');
