% Erosion
clear, clc, close all;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pkg load image;
%load test image
img = imread('binary_objects.jpg');

%perform dialtion with some different structuring element (SEs)

%a. small disk with redius = 5
se1 = strel('disk', 5, 0);
BW1 = imerode(img, se1);

%b. large disk with redius = 15
se2 = strel('disk', 15, 0);
BW2 = imerode(img, se2);

%c. square with side - 7
se3 = strel('square', 7);
BW3 = imerode(img, se3);

%d. rectangle with dimentions = [5 10]
se4 = strel('rectangle', [5 10]);
BW4 = imerode(img, se4);

%e. diamond with radius = 4
se5 = strel('diamond', 4);
BW5 = imerode(img, se5);

%f. line with length = 10, inclided angle = 45
se6 = strel('line', 10, 45);
BW6 = imerode(img, se6);

%plot images
FS = 15; %fontsize of caption
figure(1), clf;
subplot(2,3,1), imshow(BW1), title('Small disk', "fontsize", FS);
subplot(2,3,2), imshow(BW2), title('Large disk', "fontsize", FS);
subplot(2,3,3), imshow(BW3), title('Square', "fontsize", FS);
subplot(2,3,4), imshow(BW4), title('Rectangle', "fontsize", FS);
subplot(2,3,5), imshow(BW5), title('Diamond', "fontsize", FS);
subplot(2,3,6), imshow(BW6), title('Line', "fontsize", FS);
saveas(1, 'Erode.jpg');

