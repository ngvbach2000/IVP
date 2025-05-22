% Ex4 – Image Histogram and Equalization
clear; clc; close all;
pkg load image; % Load image package

% Load the image
Img = imread('waterfall.jfif');

% Font size for titles
FS = 15;

%% (a) Original Image and Histogram
figure(1), clf;

subplot(1, 2, 1), imshow(Img), title('Original Image', 'fontsize', FS);

% Convert to grayscale for histogram visualization
Img_gray = rgb2gray(Img);
[count, bins] = imhist(Img_gray);

subplot(1, 2, 2), bar(bins, count), title('Histogram of Original Image', 'fontsize', FS);
xlabel('Gray Level'), ylabel('Pixel Count'), xlim([0 255]);
set(gca, "fontsize", FS);

% Save the figure
saveas(gcf, 'Color_Histogram.jpeg');

%% (b) Display R, G, B Channels and Recombine in BRG Order
R = Img(:,:,1); % Red channel
G = Img(:,:,2); % Green channel
B = Img(:,:,3); % Blue channel

% Create images showing each channel in grayscale
RedImg = cat(3, R, zeros(size(R), 'uint8'), zeros(size(R), 'uint8'));
GreenImg = cat(3, zeros(size(G), 'uint8'), G, zeros(size(G), 'uint8'));
BlueImg = cat(3, zeros(size(B), 'uint8'), zeros(size(B), 'uint8'), B);

% Recombine channels in BRG order
BRG = cat(3, B, R, G);  % Blue in R, Red in G, Green in B position

figure(2), clf;
subplot(1, 4, 1), imshow(RedImg), title('Red Channel', 'fontsize', FS);
subplot(1, 4, 2), imshow(GreenImg), title('Green Channel', 'fontsize', FS);
subplot(1, 4, 3), imshow(BlueImg), title('Blue Channel', 'fontsize', FS);
subplot(1, 4, 4), imshow(BRG), title('BRG Image', 'fontsize', FS);

saveas(gcf, 'Primary_Colors_and_BRG_Image.jpeg');

%% (c) Histogram Equalization
% Convert to grayscale for equalization
img_gray = rgb2gray(Img); % Convert RGB to grayscale

% Apply histogram equalization
eq_img = histeq(img_gray); % Histogram equalization

% Compute histogram of equalized image
[count_eq, bins_eq] = imhist(eq_img);
bins_eq = bins_eq * 255; % Adjust bin values to [0, 255]

% Plot the equalized image and its histogram
figure, clf;
subplot(1, 2, 2), imshow(eq_img), title('Equalized Image', "fontsize", FS);
subplot(1, 2, 1), bar(bins_eq, count_eq);
set(gca, "fontsize", FS); grid on;
xlim([0 255]); ylim([0 max(count_eq)+500]);
xlabel('Gray Level'); ylabel('# of Pixels');
title('Histogram After Equalization', "fontsize", FS);

% Save the plot
saveas(gcf, 'Equalization_Histogram.jpeg');
