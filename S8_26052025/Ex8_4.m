% Hough transform
clear, clc, close all;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pkg load image;

%load test image
img = imread('dashline.png');

%show image
FS = 15;
figure, clf;
imshow(img), title('Origin Image', "fontsize", FS);

[H, theta, rho] = hough(img, 'Theta', -90: 1 : 90, 'RhoResolution', 1);
%show hough transform in 2D plane
h = figure; imagesc(theta, rho, H);
axis on, axis normal, hold on;
colormap(hot), colorbar;
xlabel('\theta\', "fontsize", FS);
ylabel('\rho\', "fontsize", FS);
set(gca, "fontsize", FS);
print(h, 'Hough Transform');
