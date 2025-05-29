% Circle couting using erosion
clear, clc, close all;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pkg load image;
%load test image
img = imread('circles.png');

%perform dialtion with some different structuring element (SEs)

%a. small disk with redius = 50
se1 = strel('disk', 50, 0);
BW1 = imerode(img, se1);

%b. square with side - 45
se2 = strel('square', 95);
BW2 = imerode(img, se2);

%d. rectangle with dimentions = [35 45]
se3 = strel('rectangle', [45 55]);
BW3 = imerode(img, se3);

%e. diamond with radius = 44
se4 = strel('diamond', 50);
BW4 = imerode(img, se4);

%f. line with length = 30, inclided angle = 45
se5 = strel('line', 30, 45);
BW5 = imerode(img, se5);

%plot images
FS = 15; %fontsize of caption
figure(1), clf;
subplot(2,3,1), imshow(img), title('Original Image', "fontsize", FS);
subplot(2,3,2), imshow(BW1), title('Small disk', "fontsize", FS);
subplot(2,3,3), imshow(BW2), title('Square', "fontsize", FS);
subplot(2,3,4), imshow(BW3), title('Rectangle', "fontsize", FS);
subplot(2,3,5), imshow(BW4), title('Diamond', "fontsize", FS);
subplot(2,3,6), imshow(BW5), title('Line', "fontsize", FS);
saveas(1, 'Circle counting using erosion.jpg');

