%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Display RGB components of a color image
clear; clc; close all;

pkg load image;  % Load image processing package

% Read the color image
img = imread('sea.jpg');  % Make sure 'sea.jpg' is in the working directory

% Extract Red, Green, and Blue channels
R = img(:, :, 1);  % Red channel
G = img(:, :, 2);  % Green channel
B = img(:, :, 3);  % Blue channel

% Prepare individual channel images (with other channels set to zero)
img_R = cat(3, R, zeros(size(R), 'uint8'), zeros(size(R), 'uint8'));
img_G = cat(3, zeros(size(G), 'uint8'), G, zeros(size(G), 'uint8'));
img_B = cat(3, zeros(size(B), 'uint8'), zeros(size(B), 'uint8'), B);

% Display original image and its RGB components
FS = 15; % Font size for titles
figure(1), clf;

subplot(2,3,2), imshow(img), title('Original Image', "fontsize", FS);
subplot(2,3,4), imshow(img_R), title('Red Channel', "fontsize", FS);
subplot(2,3,5), imshow(img_G), title('Green Channel', "fontsize", FS);
subplot(2,3,6), imshow(img_B), title('Blue Channel', "fontsize", FS);

% Save the figure
saveas(1, 'sea_RGB_channels.jpg');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Reorder RGB components to BRG
BRG_img = cat(3, B, R, G);  % Concatenate in the order: BluFS, Red, Green

% Display the newly created BRG image in figure(2)
figure(2), clf;
subplot(1,2,1), imshow(img), title('Original Image', "fontsize", FS);
subplot(1,2,2), imshow(BRG_img), title('Reorder Image', "fontsize", FS);

% Save the reordered image
saveas(2, 'sea_RGB.jpg');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Load original image
img = im2double(img);  % Convert to double for processing

% Step 1: Gamma correction (increase contrast)
gamma = 1.2;
img_gamma = img .^ gamma;  % Apply gamma correction

% Step 2: Darken by 80% => only 20% brightness remains
scale = 0.2;
img_darker = img_gamma * scale;

% Display original, gamma corrected, and darkened image
figure(3), clf;
subplot(1, 2, 1), imshow(img), title('Original Image', "fontsize", FS);
subplot(1, 2, 2), imshow(img_darker), title('Enhanced Image', "fontsize", FS);

% Save the result
saveas(3, 'sea_enhanced.jpg');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Convert to double for calculations
img_double = im2double(img);

figure(4), clf;

% Loop through bit depths
bit_depths = [2, 4, 6, 8];

for i = 1:length(bit_depths)
  NumOfBit = bit_depths(i);           % Current bit depth
  NumOfLevel = 2 ^ NumOfBit;          % Number of quantization levels

  % Quantize the image to the specified number of gray levels
  quantized_Img = floor(img_double * NumOfLevel) / (NumOfLevel - 1);

  % Scale to 8-bit range for display and saving
  quantized_Img_uint8 = uint8(quantized_Img * 255);

  % Display the quantized image
  subplot(2, 2, i);
  imshow(quantized_Img_uint8);
  title([num2str(NumOfBit) '-bit'], "fontsize", FS);

  % Save the quantized image
  imwrite(quantized_Img_uint8, ['Quantized_' num2str(NumOfBit) 'bit.jpg']);
end

% Save final visualization
saveas(4, 'sea_grayscale_quantization.jpg');
