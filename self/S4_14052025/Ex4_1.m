% histogram
clear, clc, close all;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pkg load image;
img = imread('bay.jpg');

[count, bins] = imhist(img)

FS = 15;

%plot histogram
figure, clf;
subplot(1,2,1), imshow(img), title('Origin image', "fontsize", FS);
subplot(1, 2, 2), bar(bins, count);
set(gca, "fontsize", FS);
xlim([0 255]); ylim([0 max(count(:))+500]);
xlabel('Gray level'); ylabel('# of pixel');

saveas(gcf, 'Histogram.jpg');
