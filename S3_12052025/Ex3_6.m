% noise reduction
clear, clc, close all;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pkg load image;
% load test img
img = im2double(imread('quadnight.jfif'));
% load color img then convert to gray scale then convert to double

%repeat over different number of sample images
nImg = [1 2 8 16 64 128 256 512];
FS = 15
for i = 1 : numel(nImg)
  N = nImg(i); %number of img to calculate the average
  avg_img = zeros(size(img));

  % add Gaussian noise, accumulate each image to the total image
  for j = 1 : N
    noisy_img = imnoise(img, 'gaussian', 0, 0.5);
    avg_img = avg_img + noisy_img;
  end

  % calculate the average image and show it
  avg_img = avg_img / N;
  subplot(2, numel(nImg) / 2, i);
  imshow(avg_img), title([num2str(N), 'image(s)'], "fontsize", FS);

  imwrite(avg_img, ['Image Averaging_', num2str(N), 'avg.jpeg']);

end
