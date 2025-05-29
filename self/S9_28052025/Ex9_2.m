% Ants Counting
clear, clc, close all;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pkg load image;

%load test image
img = imread('ants.jpg');

%binarize the input image
level = graythresh(img);
BW = 1- im2bw(img, level);

%region labelling
[L, ants] = bwlabel(BW, 6);
rgbLabel = label2rgb(L, 'jet', 'k');
printf("number of ants %d\n", ants);

%ignore small regions
suspended_regions = L > 1;
minSize = 6; %minimun size of pixel to be considered as an ant
ants = regionprops(suspended_regions, 'Area', 'Centroid', 'PixelIdxList');
%remove all region with size below minium size
ants(vertcat(ants.Area) < minSize) = [];

%display plot image with ants counting and labelling
FS = 15;
figure, clf;
subplot(1, 2, 1), imshow(img), title('Origin Image', "fontsize", FS);
subplot(1, 2, 2), imshow(BW), title('Binary Image', "fontsize", FS);
saveas(gcf, "Ants Counting color vs binary.jpg");

figure(2), clf;
imshow(rgbLabel); title('Label Ants', "fontsize", FS);
for k = 1 : numel(ants)
  text(ants(k).Centroid(1), ants(k).Centroid(2), num2str(k), ...
    'Color', 'w', 'HorizontalAlignment', 'Center');
end
saveas(2, "Ants Counting.jpg");





