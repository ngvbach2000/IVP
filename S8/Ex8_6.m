%Ex8_6 Hough Transform Application
clear, clc, close all;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pkg load image;
%load test image
Img = imread('coins.png');

FS = 15; %fontsize of caption
figure, clf;
subplot(1,3,1), imshow(Img), title('Original Image', "fontsize", FS);

%extract edges using Prewitt Operator
bw = edge(Img, 'prewitt', 0.15);
subplot(1,3,2), imshow(bw), title('Edge Detection by Prewitt', "fontsize", FS);

%find edges using Hough Transform
[centers, radii, metric] = imfindcircles(bw, [40 200], 'Sensitivity', 0.9);
subplot(1,3,3), imshow(Img), title('Edge Detection by HT', "fontsize", FS);
hold on; plot(centers(:,1), centers(:,2), 'xr', 'MarkerSize', 2, 'LineWidth', 0.5);
viscircles(centers, radii, 'EdgeColor', 'y', 'LineWidth', 0.25);
saveas(gcf, 'Coin Center Findings using HT.jpg');
