% hole detection using erosion
clear, clc, close all;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pkg load image;

%load test image
img = imread('fence.jpg');

img_gray = rgb2gray(img); %convert from rgb to gray scale image
level = graythresh(img_gray); % level = 128
BW = im2bw(img_gray, level);

%a. perform the erosion with diamond with redius = 35
se1 = strel('diamond', 35);
BW1 = imerode(BW, se1);

%a. perform the erosion with define cross structuring element

length = 101; % 50 pixel each side
NHOOD = zeros(length);
NHOOD(ceil(length/2), :) = 1;
NHOOD(:, ceil(length/2)) = 1;
se2 = strel('arbitrary', NHOOD);
BW2 = imerode(BW, se2);

%plot images
FS = 15; %fontsize of caption
figure(1), clf;
imshow(NHOOD), title('50-pixel-cross-se', "fontsize", FS);
saveas(1, 'Cross structuring element.jpg');

%plot images
figure(2), clf;
subplot(2,2,1), imshow(img), title('Original Image', "fontsize", FS);
subplot(2,2,2), imshow(BW), title('Binary Image', "fontsize", FS);
subplot(2,2,3), imshow(BW1), title('Erosion w. diamond', "fontsize", FS);
subplot(2,2,4), imshow(BW2), title('Erosion w. Cross', "fontsize", FS);
saveas(1, 'hole detection using erosion.jpg');
