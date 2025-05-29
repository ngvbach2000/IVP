%Ex3_2 Flipping and Rotating images
clear, clc, close all;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pkg load image;
FS = 15; %fontsize of caption

%a. Flipping an image up-down and left-right
%Img = imread('atrium.jpg');
%Img_ud = flipud(Img); %flip up to down
%Img_lr = fliplr(Img); %flip left to right

%figure(1), clf;
%subplot(1,3,1), imshow(Img), title('Original Image', "fontsize", FS);
%subplot(1,3,2), imshow(Img_ud), title('Flipped Up-Down Image', "fontsize", FS);
%subplot(1,3,3), imshow(Img_lr), title('Flipped Left-Right Image', "fontsize", FS);

%save image
%saveas(1, 'Flipping Image.png');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%b. Rotating an image with an angle theta in degree
Img = imread('eight.png');

theta = 90;
Img_rot = imrotate(Img, theta);

figure(2), clf;
subplot(1,2,1), imshow(Img), title('Original Image', "fontsize", FS);
subplot(1,2,2), imshow(Img_rot), title('Rotated Image', "fontsize", FS);

%save image
saveas(2, 'Rotating Image.png');
