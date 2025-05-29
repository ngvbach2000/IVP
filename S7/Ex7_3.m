%Ex7_3 Circle Counting using Erosion
clear, clc, close all;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pkg load image;
%load test image
Img = imread('circles.png');

%perform erosion with some different structuring elements (SEs)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%a. small disk with radius = 50
se1 = strel('disk', 50, 0);
BW1 = imerode(Img, se1);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%b. square with side = 60
se2 = strel('square', 60);
BW2 = imerode(Img, se2);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%c. rectangle with dimensions = [38 48]
se3 = strel('rectangle', [38 48]);
BW3 = imerode(Img, se3);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%d. diamond with radius = 50
se4 = strel('diamond', 50);
BW4 = imerode(Img, se4);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%e. line with length = 30 and inclided angle = 45
se5 = strel('line', 30, 45);
BW5 = imerode(Img, se5);

%plot images
FS = 15; %fontsize of caption
figure, clf;
subplot(2,3,1), imshow(Img), title('Original Image', "fontsize", FS);
subplot(2,3,2), imshow(BW1), title('Disk', "fontsize", FS);
subplot(2,3,3), imshow(BW2), title('Square', "fontsize", FS);
subplot(2,3,4), imshow(BW3), title('Rectangle', "fontsize", FS);
subplot(2,3,5), imshow(BW4), title('Diamond', "fontsize", FS);
subplot(2,3,6), imshow(BW5), title('Line', "fontsize", FS);
saveas(gcf, 'Circle Counting using Erosion.jpg');
