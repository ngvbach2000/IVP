% Subtracting two image
clear, clc, close all;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pkg load image; %load image package in Octave

%Load test image
live = im2double(imread('live.jpg'));
mask = im2double(imread('mask.jpg'));

dif_Img = imsubtract(live, mask) .^ 0.5;

%plot image
FS = 15
figure, clf;

subplot(1, 3, 1), imshow(live, [0, 1]), title('Live Image', "fontsize", FS);
subplot(1, 3, 2), imshow(mask, [0, 1]), title('Mask Image', "fontsize", FS);
subplot(1, 3, 3), imshow(dif_Img, [0, 1]), title('Different Image', "fontsize", FS);

saveas(gcf, 'live_mask.jpg');

