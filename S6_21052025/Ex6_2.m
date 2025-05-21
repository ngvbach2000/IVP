%Ex6_2a Butterworth Noise Reduction and Deblurring
clear, clc, close all;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pkg load image;
pkg load signal;
%load test image
Img = im2double(imread('eagle.jfif'));

%add blurry effect
LEN = 3; THETA = 5;
PSF = fspecial('motion', LEN, THETA);
blurred_Img = imfilter(Img, PSF, 'conv', 'symmetric');

%add noise effect
noise_mean = 0; noise_var = 0.05;
noisy_blurred_Img = imnoise(blurred_Img, 'gaussian', noise_mean, noise_var);

%plot images
FS = 15; %fontsize of caption
figure(1), clf;
subplot(1,3,1), imshow(Img), title('Original Image', "fontsize", FS);
subplot(1,3,2), imshow(blurred_Img), title('Blurry Image', "fontsize", FS);
subplot(1,3,3), imshow(noisy_blurred_Img), title('Noisy Blurry Image', "fontsize", FS);
saveas(1, 'Noisy Blurry Image.jpg');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%compare Mean Square Error (mse) between the noisy blurry image and original image
mse1 = 255 * (noisy_blurred_Img - Img);
fprintf("Mean Square Error before restoration: %.2f\n", rms(mse1(:)));

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%denoise and deblur (sharpen)
h = butter(5, 0.4);
filtered_Img = imfilter(noisy_blurred_Img, h, 'replicate');

figure(2), clf;
subplot(1,2,1), imshow(noisy_blurred_Img), title('Noisy Blurry Image', "fontsize", FS);
subplot(1,2,2), imshow(filtered_Img), title('Denoise Deblurring Image', "fontsize", FS);
saveas(2, 'Denoise Deblurring Image using Butterworth.jpg');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%compare Mean Square Error (mse) between the denoise deblur image and original image
mse2 = 255 * (filtered_Img - Img);
fprintf("Mean Square Error after restoration: %.2f\n", rms(mse2(:)));
