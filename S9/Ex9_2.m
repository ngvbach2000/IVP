%Ex9_2 Ants Counting
clear, clc, close all;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pkg load image;
%load test image
Img = imread('ants.jpg');

%binarize the input image
level = graythresh(Img);
BW = 1 - im2bw(Img, level);

%region labelling
[L, ants] = bwlabel(BW, 6);
rgblabel = label2rgb(L, 'jet', 'k');
printf("Number of ants: %d\n", ants);

%ignore small regions
suspended_regions = L > 1;
minSize = 6; %minimum size of pixels to be considered as an ant
ants = regionprops(suspended_regions, 'Area', 'Centroid', 'PixelIdxList');
%remove all regions with the size below minimum
ants(vertcat(ants.Area) < minSize) = [];

%plot image with ants counting and labelling
FS = 15; %fontsize of caption
figure(1), clf;
subplot(1,2,1), imshow(Img), title('Original Image', "fontsize", FS);
subplot(1,2,2), imshow(BW), title('Binary Image', "fontsize", FS);
saveas(1, 'Origin vs. Binary Images.jpg');

figure(2), clf;
imshow(rgblabel); title('Labelled Ants', "fontsize", FS);
for k = 1 : numel(ants)
  text(ants(k).Centroid(1), ants(k).Centroid(2), num2str(k), ...
    'Color', 'w', 'HorizontalAlignment', 'center');
end
saveas(2, 'Ants Counting.jpg');
