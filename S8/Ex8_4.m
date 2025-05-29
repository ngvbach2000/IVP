%Ex8_4 Hough Transform
clear, clc, close all;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pkg load image;
%load test image
%Img = imread('dots.png');
%Img = imread('dashline.png');
Img = imread('line.png');

%show images
FS = 15; %fontsize of caption
figure, clf;
imshow(Img), title('Original Image', "fontsize", FS);

[H, theta, rho] = hough(Img, 'Theta', -90 : 1 : 90, 'RhoResolution', 1);
%show Hough Transform in 2-D plane
h = figure; imagesc(theta, rho, H);
axis on, axis normal, hold on;
colormap(hot), colorbar;
xlabel('\theta', "fontsize", FS); ylabel('\rho', "fontsize", FS);
set(gca, "fontsize", FS);
print(h, 'Hough Transform in 2-D.png');
