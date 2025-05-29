%Ex2_6 Multiplying two or more images
clear, clc, close all;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pkg load image;
%load test image
I1 = im2double(imread('earth1.jpg'));
I2 = im2double(imread('earth2.jpg'));
I = immultiply(immultiply(immultiply(I1,I2),I1),I2);

%plot images
FS = 15; %fontsize of caption
figure, clf;
subplot(1,2,1), imshow(I1), title('2-D Image', "fontsize", FS);
subplot(1,2,2), imshow(I), title('3-D Image', "fontsize", FS);

%save image
saveas(gcf, '3-D Effect.png');
