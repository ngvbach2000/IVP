% Bordering Detection using Dilation and Erosion
clear, clc, close all;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pkg load image;

%load test image
img = im2double(imread('cliparts.png'));

%perform dilation and erosion
se = strel('disk', 5, 0);
img_dilated = imdilate(img, se);
img_eroded = imerode(img, se);

%extract boundary
ext_edge = img_dilated - img;
int_edge = img - img_eroded;
edge = img_dilated - img_eroded;

%plot images
FS = 15;
figure(1), clf;
subplot(2,2,1), imshow(img), title('Origin Image', "fontsize", FS);
subplot(2,2,2), imshow(ext_edge), title('External Edge', "fontsize", FS);
subplot(2,2,3), imshow(int_edge), title('Internal Edge', "fontsize", FS);
subplot(2,2,4), imshow(edge), title('Edge', "fontsize", FS);
saveas(1, 'Bordering Detection using Dilation and Erosion.jpg');
