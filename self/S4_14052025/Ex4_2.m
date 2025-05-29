% global histogram
clear, clc, close all;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pkg load image;
FS = 15;
img = imread('moon.jpg');

[count, bins] = imhist(img)

%plot histogram
figure, clf;
subplot(1,2,1), imshow(img), title('Origin image', "fontsize", FS);

subplot(1, 2, 2), bar(bins, count);
set(gca, "fontsize", FS); grid on;
xlim([0 255]); ylim([0 max(count(:))+500]);
xlabel('Gray level'); ylabel('# of pixel');
title("Histogram before equalization", "fontsize", FS);
saveas(1, 'Before Equalizaiton Global Histogram.jpg');

eq_img = histeq(img);
[count, bins] = imhist(eq_img)
bins = bins * 255;
figure, clf;
subplot(1,2,1), imshow(eq_img), title('Equalizaiton image', "fontsize", FS);

subplot(1, 2, 2), bar(bins, count);
set(gca, "fontsize", FS); grid on;
xlim([0 255]); ylim([0 max(count(:))+500]);
xlabel('Gray level'); ylabel('# of pixel');
title("Histogram after equalization", "fontsize", FS);

saveas(2, 'After Equalizaiton Global Histogram.jpg');
