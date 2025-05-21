% Ex2: Geometric Operations and Histogram Equalization
clear; clc; close all;
pkg load image; % Required for image processing functions

% 1. Read grayscale image
img = imread('apple.jpeg');
if size(img, 3) == 3
  img = rgb2gray(img); % Convert to grayscale if not already
endif

FS = 15; % Font size for display

% 1a. Logarithmic Transformation
c = 256 / log(512);
x = 0:255;
y_log = c * log(x + 1); % Mapping function
log_img = uint8(c * log(double(img) + 1));

% 1b. Piecewise Linear Transformation
% Initialize LUT (Look-Up Table)
LUT = zeros(1, 256);
for r = 0:255
  if r > 0 && r <= 93
    LUT(r+1) = 2 * r + 10;
  elseif r > 93 && r <= 168
    LUT(r+1) = r - 5;
  elseif r > 168 && r <= 214
    LUT(r+1) = r;
  elseif r > 214
    LUT(r+1) = 255;
  else
    LUT(r+1) = r;
  endif
end
y_piecewise = LUT;
piecewise_img = intlut(img, uint8(LUT));

% Show original and transformed images
figure, clf;

subplot(3,2,[1,2]), imshow(img);
title('Original Image', "fontsize", FS);

subplot(3,2,3), plot(x, y_log, 'LineWidth', 1.5); grid on;
xlim([0 255]); ylim([0 255]);
title('Log Mapping Function', "fontsize", FS);

subplot(3,2,4), imshow(log_img);
title('Adjusted Image using LMF', "fontsize", FS);

subplot(3,2,5), plot(x, y_piecewise, 'LineWidth', 1.5); grid on;
xlim([0 255]); ylim([0 255]);
title('Piecewise Linear Mapping Function', "fontsize", FS);

subplot(3,2,6), imshow(piecewise_img);
title('Adjusted Image using PLMF', "fontsize", FS);

saveas(gcf, 'Log_vs_Piecewise.jpg');

% 2a. Flip image left to right
img_flipped = fliplr(img);

% 2b. Rotate 180 degrees clockwise
img_rotated = imrotate(img, -180);

% 2c. Crop central half
[h, w] = size(img);
x = w/4; y = h/4; width = w/2; height = h/2;
img_cropped = imcrop(img, [x, y, width, height]);

% Show geometric operations
figure, clf;
subplot(1,3,1), imshow(img_flipped), title('Flipped Left - Right Image', "fontsize", FS);
subplot(1,3,2), imshow(img_rotated), title('Rotated 180-deg Image', "fontsize", FS);
subplot(1,3,3), imshow(img_cropped), title('Cropped 1/2 Center Image', "fontsize", FS);
saveas(gcf, 'Geometric Image.jpg');

% 3. Histogram and Global Histogram Equalization
[count, bins] = imhist(img);
eq_img = histeq(img);

% Show histogram and equalized image
figure, clf;
subplot(2,2,1), bar(bins, count), title('Histogram before equalized', "fontsize", FS);
subplot(2,2,2), imshow(img), title('Image before equalized', "fontsize", FS);
subplot(2,2,3), bar(imhist(eq_img)), title('Histogram adter equalized', "fontsize", FS);
subplot(2,2,4), imshow(eq_img), title('Image after equalized', "fontsize", FS);
saveas(gcf, 'Histograms Image.jpg');

% 4. CLAHE (Contrast Limited Adaptive Histogram Equalization)
[count, bins] = imhist(img);
maxCount = max(count(:));

% Set clipping ratio to 0.3
clipRatio = 0.3;
clipLimit = clipRatio * maxCount;

% Clip histogram
clippedCount = (count < clipLimit) .* count + (count >= clipLimit) * clipLimit;

% Construct a virtual image from clipped histogram
clipped_img = [];
for level = 0:255
  clipped_img = [clipped_img, level * ones(1, round(clippedCount(level+1)))];
end

% Apply modified histogram equalization
[temp, T] = histeq_modified(uint8(clipped_img));

% Map original image using LUT
LUT = uint8(T * 255);
limited_img = intlut(img, LUT);

% Display results
figure, clf;
subplot(1,2,1), imshow(img), title('Original Image', "fontsize", FS);
subplot(1, 2, 2), imshow(limited_img), title('clip at 0.3', "fontsize", FS);
saveas(1, 'CLAHE_clip_0.3.jpg');
