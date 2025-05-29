% Hough transform application
clear, clc, close all;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pkg load image;

%load test image
img = imread('paper.jpg');

%binarize the imput image
level = graythresh(img);
bw_img = 1 - im2bw(img, level);

%show image
FS = 15;
figure(1), clf;
subplot(1, 2, 1), imshow(img), title('Origin Image', "fontsize", FS);
subplot(1, 2, 2), imshow(bw_img), title('Binary Image', "fontsize", FS);
saveas(1, 'Origin vs. Binary Images.jpg');

%compute hough transform
[H, theta, rho] = hough(bw_img, 'Theta', -90: 1 : 90, 'RhoResolution', 1);
figure(2), clf;
imagesc(theta, rho, H);
axis on, axis normal, hold on;
colormap(hot), colorbar;
set(gca, "fontsize", FS);
saveas(2, 'Hough Transfrom rotation.jpg');

%detect peaks in Hough Transform
peakNum = 8;
p = houghpeaks(H, peakNum, 'threshold', ceil(0.2*max(H(:))));
lines = houghlines(bw_img, theta, rho, p, 'FillGap', 5, 'MinLength', 1);
thetaPeaks = theta(p(:,2));
rhoPeaks = rho(p(:,1));
plot(thetaPeaks, rhoPeaks, 'o', 'color', 'Y', 'LineWidth', 1.5);

angle = median(thetaPeaks);
deskewed_img = imrotate(img, 90 + angle, 'bicubic', 'crop');
figure(3), clf;
imshow(deskewed_img), title('Deskewed Paper using Hough Transform', "fontsize", FS);
saveas(3, 'Deskewed Paper using Hough Transform.jpg');



