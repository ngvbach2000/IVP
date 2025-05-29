% Convolution between an image and a simple filter
clear, clc, close all;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pkg load image;
%img = im2double(imread('airplane.png'));
img = im2double(imread('bike.png'));


%construct three diffferent simple filter
h1 = ones(1, 10) / 10; %orizontal filter
h2 = ones(10, 1) / 10; % vertical filter
h3 = ones(10, 10) / 100; % box/windows filter

%perfrom convolving on the image
filter_img1 = imfilter(img, h1, 'symmetric');
filter_img2 = imfilter(img, h2, 'replicate');
filter_img3 = imfilter(img, h2, 'circular');


%show image
FS = 15;
figure(1), clf;

subplot(1,2,1), imshow(img), title('Origin image', "fontsize", FS);
subplot(1,2,2), imshow(filter_img1), title('Horizontal Image.', "fontsize", FS);
saveas(1, 'Horizontal filtering.jpg');

figure(2), clf;
subplot(1,2,1), imshow(img), title('Origin image.', "fontsize", FS);
subplot(1,2,2), imshow(filter_img2), title('Vertical Image.', "fontsize", FS);
saveas(2, 'vertial filtering.jpg');

figure(3), clf;
subplot(1,2,1), imshow(img), title('Origin image.', "fontsize", FS);
subplot(1,2,2), imshow(filter_img3), title('box Image.', "fontsize", FS);
saveas(3, 'box filtering.jpg');
