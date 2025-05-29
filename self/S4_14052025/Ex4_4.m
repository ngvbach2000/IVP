% local hítogram equalization
clear, clc, close all;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pkg load image;
FS = 15;
img = rgb2gray(imread('newspaper.jpg'));

eq_img = histeq(img);

lc_img = blockproc(img, [294 98], @histeq);


FS = 15;

%plot histogram
figure, clf;
subplot(1,3,1), imshow(img), title('Origin image', "fontsize", FS);
subplot(1,3,2), imshow(eq_img), title('Global Equal.', "fontsize", FS);
subplot(1,3,3), imshow(lc_img), title('Local Equal.', "fontsize", FS);

% show histogram

saveas(gcf, 'Local Histogram.jpg');


