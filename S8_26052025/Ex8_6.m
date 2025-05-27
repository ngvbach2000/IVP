% Hough transform application
clear, clc, close all;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pkg load image;

%load test image
img = imread('coins.png');

FS = 15;
figure, clf;
subplot(1, 3, 1), imshow(img), title('Origin Image', "fontsize", FS);

% using prewitt
bw = edge(img, 'prewitt', 0.15);
subplot(1, 3, 2), imshow(bw), title('Prewitt Image', "fontsize", FS);

%using hough transform
[centers, redii, metric] = imfindcircles(bw, [40 200], 'Sensitivity', 0.9);
subplot(1, 3, 3), imshow(img), title('Hough Transform Image', "fontsize", FS);
hold on; plot(centers(:,1), centers(:, 2), 'xr', 'MarkerSize', 2, 'LineWidth', 0.5);
viscircles(centers, radii, 'EdgeColor', 'Y', 'LineWidth', 0.25);
saveas(gcf, "Coin Center Findings using HT.jpg");

