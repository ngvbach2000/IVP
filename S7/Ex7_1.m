%Ex7_1 Dilation
clear, clc, close all;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pkg load image;
%load test image
Img = imread('binary_objects.jpg');

%perform dilation with some different structuring elements (SEs)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%a. small disk with radius = 5
se1 = strel('disk', 5, 0);
BW1 = imdilate(Img, se1);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%b. large disk with radius = 15
se2 = strel('disk', 15, 0);
BW2 = imdilate(Img, se2);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%c. square with side = 7
se3 = strel('square', 7);
BW3 = imdilate(Img, se3);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%d. rectangle with dimensions = [5 10]
se4 = strel('rectangle', [5 10]);
BW4 = imdilate(Img, se4);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%e. diamond with radius = 4
se5 = strel('diamond', 4);
BW5 = imdilate(Img, se5);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%f. line with length = 10 and inclided angle = 45
se6 = strel('line', 10, 45);
BW6 = imdilate(Img, se6);

%plot images
FS = 15; %fontsize of caption
figure, clf;
subplot(2,3,1), imshow(BW1), title('Small Disk', "fontsize", FS);
subplot(2,3,2), imshow(BW2), title('Large Disk', "fontsize", FS);
subplot(2,3,3), imshow(BW3), title('Square', "fontsize", FS);
subplot(2,3,4), imshow(BW4), title('Rectangle', "fontsize", FS);
subplot(2,3,5), imshow(BW5), title('Diamond', "fontsize", FS);
subplot(2,3,6), imshow(BW6), title('Line', "fontsize", FS);
saveas(gcf, 'Dilation with Different SEs.jpg');
