%Ex8_3 Canny Edge Detector
clear, clc, close all;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pkg load image;
%load test image
Img = imread('bike.png');

%repeat with different 'Standard Deviation' (sigma) of Gaussian
sigmaValues = [sqrt(2), 2*sqrt(2), 4*sqrt(2)];
threshold = 0.2; %threshold value = 20%

%perform Canny edge detection and show images
FS = 15; %fontsize of caption
figure, clf;
subplot(2,2,1), imshow(Img), title('Original Image', "fontsize", FS);
for i = 1 : numel(sigmaValues)
  %compute and show Canny edges
  sigma = sigmaValues(i);
  bw = edge(Img, 'canny', threshold, sigma);
  subplot(2,2,i+1), imshow(bw);
  title(sprintf('sigma = %.2f', sigma));
end
saveas(gcf, 'Canny Edge Detector.jpg');
