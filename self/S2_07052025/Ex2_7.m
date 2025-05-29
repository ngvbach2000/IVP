% multiplying two or more image
clear, clc, close all;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pkg load image; %load image package in Octave

%Load test image
I1 = im2double(imread('earth1.jpg'));
I2 = im2double(imread('earth2.jpg'));
I = immultiply(immultiply(immultiply(I1, I2), I1), I2);

%plot image
FS = 15
figure, clf;

subplot(1, 2, 1), imshow(I1, [0, 1]), title('earth 2D Image', "fontsize", FS);
subplot(1, 2, 2), imshow(I, [0, 1]), title('earth 3D Image', "fontsize", FS);

saveas(gcf, 'earth_multiply.jpg');

