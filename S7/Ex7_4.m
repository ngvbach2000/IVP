%Ex7_4 Hole Detection using Erosion
clear, clc, close all;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pkg load image;
%load test image
Img = imread('fence.jpg');

Img_gray = rgb2gray(Img); %convert from rgb to grayscale image
level = graythresh(Img_gray);
BW = im2bw(Img_gray, level);

%a. perform the erosion with a diamond with radius = 35
se1 = strel('diamond', 35);
BW1 = imerode(BW, se1);

%b. perform the erosion with a defined cross structuring element
length = 101; %50 pixels each size
NHOOD = zeros(length);
NHOOD(ceil(length/2), :) = 1;
NHOOD(:, ceil(length/2)) = 1;
se2 = strel('arbitrary', NHOOD);
BW2 = imerode(BW, se2);

%plot images
FS = 15; %fontsize of caption
figure(1), clf;
imshow(NHOOD), title('50-pixel Cross SE', "fontsize", FS);
saveas(1, 'Cross Structuring Element.jpg');

figure(2), clf;
subplot(2,2,1), imshow(Img), title('Original Image', "fontsize", FS);
subplot(2,2,2), imshow(BW), title('Binary Image', "fontsize", FS);
subplot(2,2,3), imshow(BW1), title('Erosion w. Diamond', "fontsize", FS);
subplot(2,2,4), imshow(BW2), title('Erosion w. Cross', "fontsize", FS);
saveas(2, 'Hole Detection with Erosion.jpg');
