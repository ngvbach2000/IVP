%Ex4_1 Histogram
clear, clc, close all;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pkg load image;
%load test image
%Img = imread('brain.jpg');
Img = imread('bay.jpg');

[count, bins] = imhist(Img);
FS = 15; %fontsize of caption

%plot the histogram of the original image
figure, clf;
subplot(1,2,1), imshow(Img), title('Original Image', "fontsize", FS);
subplot(1,2,2), bar(bins, count);
set(gca, "fontsize", FS); grid on;
xlim([0 255]); ylim([0 max(count(:)+500)]);
xlabel('Gray Level'); ylabel('# of pixels');

%save image
saveas(gcf, 'Histogram.png');
