% Coin Counting using Dilation
clear, clc, close all;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pkg load image;

%load test image
img = imread('coins.png');

%binarize the input image
level = graythresh(img);
BW = 1- im2bw(img, level);

%a. No dilation
[L1, obj1] = bwlabel(BW, 6);
rgbLabel1 = label2rgb(L1, 'jet', 'k');
printf("number of coins before dilation: %d\n", obj1);

%b. use dilation
se = strel('disk', 25, 0);
BW_dilated = 1- imdilate(im2bw(img, level), se);

[L2, obj2] = bwlabel(BW_dilated, 6);
rgbLabel2 = label2rgb(L2, 'jet', 'k');
printf("number of coins after dilation: %d\n", obj2);

FS = 15;
figure, clf;
subplot(2, 2, 1), imshow(img), title('Origin Image', "fontsize", FS);
subplot(2, 2, 2), imshow(BW), title('Binary Image', "fontsize", FS);
subplot(2, 2, 3), imshow(rgbLabel1), title('Labelling without Delation', "fontsize", FS);
subplot(2, 2, 4), imshow(rgbLabel2), title('Labelling with Delation', "fontsize", FS);
saveas(gcf, "Coin Counting using Dilation.jpg");

