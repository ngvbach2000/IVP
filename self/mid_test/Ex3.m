% Image Comparison
clear, clc, close all;
pkg load image;

% (a) Display two images in color and grayscale format in the same figure

% Read the two color images
cat_a = imread('cat_a.png');
cat_b = imread('cat_b.png');

% Convert them to grayscale
cat_a_gray = rgb2gray(cat_a);
cat_b_gray = rgb2gray(cat_b);

% Display all in one figure
FS = 15;
figure(1), clf;
subplot(2,2,1), imshow(cat_a), title('Cat A (Color)', "fontsize", FS);
subplot(2,2,2), imshow(cat_b), title('Cat B (Color)', "fontsize", FS);
subplot(2,2,3), imshow(cat_a_gray), title('Cat A (Grayscale)', "fontsize", FS);
subplot(2,2,4), imshow(cat_b_gray), title('Cat B (Grayscale)', "fontsize", FS);

% Save the figure
saveas(1, 'Color_Grayscale.jpg');

% (b) Find differences between two images and show in various formats

% Convert images to double precision for processing
cat_a_d = im2double(cat_a);
cat_b_d = im2double(cat_b);

% Compute difference image
diff_color = imabsdiff(cat_a_d, cat_b_d); % absolute difference
diff_gray = rgb2gray(diff_color);         % grayscale difference

% Enhanced grayscale: increase contrast and brightness
enhanced_gray = diff_gray .^ 0.6;         % gamma correction (approx. +40% contrast)
enhanced_gray = enhanced_gray * 2;        % brighten by factor of 2
enhanced_gray(enhanced_gray > 1) = 1;     % clip values above 1

% Display differences
figure(2), clf;
subplot(1,3,1), imshow(diff_color), title('Color Difference', "fontsize", FS);
subplot(1,3,2), imshow(diff_gray), title('Grayscale Difference', "fontsize", FS);
subplot(1,3,3), imshow(enhanced_gray), title('Enhanced Grayscale', "fontsize", FS);

% Save the result
saveas(2, 'Image_Difference_Enhanced.jpg');
