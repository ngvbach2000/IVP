% Smaill Hole Ẻmoval úing
clear, clc, close all;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pkg load image;

%load test image
img = imread('man_face.png');

% binarize the input image
BW = img < 112; %manual thresthold

% perform closing
se = strel('square', 22);
img_dilated = imdilate(BW, se); % dilation first
img_closed = imerode(img_dilated, se);
img_diff = img_closed - BW;

%plot images
FS = 15;
figure(1), clf;
subplot(2,2,1), imshow(BW), title('Binary Image', "fontsize", FS);
subplot(2,2,2), imshow(img_dilated), title('Dilation Image', "fontsize", FS);
subplot(2,2,3), imshow(img_closed), title('Close Image', "fontsize", FS);
subplot(2,2,4), imshow(img_diff), title('Different Image', "fontsize", FS);
saveas(1, 'Closing Image.jpg');

