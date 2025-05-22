% Ex5.6 - Image Restoration: Noise Reduction and Sharpening
clear; clc; close all;
pkg load image;
pkg load signal;

% 1. Read the noisy color image and display both color and grayscale
img = im2double(imread('weather.png')); % read image and convert to double
img_gray = rgb2gray(img);               % convert to grayscale

FS = 15; % Font size for figure titles
figure, clf;
subplot(1,2,1), imshow(img), title('Original Color Image', "fontsize", FS);
subplot(1,2,2), imshow(img_gray), title('Grayscale Image', "fontsize", FS);
saveas(gcf, 'weather_original_display.jpg');

% 2. Noise reduction using a Gaussian filter
h_gauss = fspecial('gaussian', [5 5], 1);  % Gaussian filter 5x5, sigma=1
img_denoised = imfilter(img, h_gauss, 'replicate'); % apply Gaussian filter

% 3. Sharpening using Butterworth High-pass Filter (Frequency Domain)
h = butter(5, 0.4);
filtered_Img = imfilter(img, h, 'replicate');
% Show results
figure, clf;
subplot(1,3,1), imshow(img), title('Original Image', "fontsize", FS);
subplot(1,3,2), imshow(img_denoised), title('Denoised (Gaussian)', "fontsize", FS);
subplot(1,3,3), imshow(filtered_Img), title('Sharpened (Butterworth)', "fontsize", FS);
saveas(gcf, 'weather_denoised_sharpened.jpg');
