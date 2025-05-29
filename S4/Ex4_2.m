%Ex4_2 Global Histogram Equalization
clear, clc, close all;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pkg load image;
%load test image
%Img = imread('brain.jpg');
%Img = imread('bay.jpg');
Img = imread('moon.jpg');

FS = 15; %fontsize of caption
%show image before and after histogram equalization
figure(1), clf;
subplot(1,2,1), imshow(Img), title('Original Image', "fontsize", FS);
[count, bins] = imhist(Img);
subplot(1,2,2), bar(bins, count);
set(gca, "fontsize", FS); grid on;
xlim([0 255]); ylim([0 max(count(:))+500]);
xlabel('Gray Levels'); ylabel('# of pixels');
title('Histogram before Equalization', "fontsize", FS);
saveas(1, 'Before Equalization.jpg');

eq_Img = histeq(Img);
figure(2), clf;
subplot(1,2,1), imshow(eq_Img), title('Equalized Image', "fontsize", FS);
[count, bins] = imhist(eq_Img); %return in double (0.0000 to 1.0000)
bins *= 255;
subplot(1,2,2), bar(bins, count);
set(gca, "fontsize", FS); grid on;
xlim([0 255]); ylim([0 max(count(:))+500]);
xlabel('Gray Levels'); ylabel('# of pixels');
title('Histogram after Equalization', "fontsize", FS);
saveas(2, 'After Equalization.jpg');
