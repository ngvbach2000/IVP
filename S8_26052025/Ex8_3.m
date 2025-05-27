% Edge detection: Canny Edge Operator
clear, clc, close all;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pkg load image;

%load test image
%img = double(imread('man_face.png'));
img = imread('bike.png');

%rêpat diferent "SD" sigma of Gaussian
sigmaValues = [sqrt(2), 2*sqrt(2), 4*sqrt(2)];
threshold = 0.2; %20%

%show image
FS = 15;
figure(1), clf;

subplot(2,2,1), imshow(img), title('Origin image', "fontsize", FS);

for i = 1 : numel(sigmaValues)
  sigma = sigmaValues(i);
  bw = edge(img, 'canny', threshold, sigma);
  subplot(2, 2, i+1), imshow(bw);
  title(sprintf('sigma = %.2f', sigma));
end

saveas(1, 'canny Operator.jpg');
