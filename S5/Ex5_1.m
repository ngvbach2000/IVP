%Ex5_1 Convolution between an image and a simple filter
clear, clc, close all;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pkg load image;
%load test image
%Img = im2double(imread('airplane.png'));
Img = im2double(imread('bike.png'));

%construct three different simple filters
h1 = ones(1,10) / 10; %horizontal filter
h2 = ones(10,1) / 10; %vertical filter
h3 = ones(10) / 100; %box/window filter

%perform convolving on the image
filtered_Img1 = imfilter(Img, h1, 'symmetric');
filtered_Img2 = imfilter(Img, h2, 'replicate');
filtered_Img3 = imfilter(Img, h3, 'circular');

%show images
FS = 15; %fontsize of caption
figure(1), clf;
subplot(1,2,1), imshow(Img), title('Original Image', "fontsize", FS);
subplot(1,2,2), imshow(filtered_Img1), title('Horizontal Filtering', "fontsize", FS);
saveas(1, 'Horizontal Filtering.png');

figure(2), clf;
subplot(1,2,1), imshow(Img), title('Original Image', "fontsize", FS);
subplot(1,2,2), imshow(filtered_Img2), title('Vertical Filtering', "fontsize", FS);
saveas(2, 'Vertical Filtering.png');

figure(3), clf;
subplot(1,2,1), imshow(Img), title('Original Image', "fontsize", FS);
subplot(1,2,2), imshow(filtered_Img3), title('Box Filtering', "fontsize", FS);
saveas(3, 'Box Filtering.png');
