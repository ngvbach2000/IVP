%Ex7_6 Boundary Detection using Dilation and Erosion
clear, clc, close all;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pkg load image;
%load test image
Img = im2double(imread('cliparts.png'));

%perform dilation and erosion
se = strel('disk', 5, 0);
Img_dilated = imdilate(Img, se);
Img_eroded = imerode(Img, se);

%extract boundary
ext_edge = Img_dilated - Img;
int_edge = Img - Img_eroded;
edge = Img_dilated - Img_eroded;

%show images
FS = 15; %fontsize of caption
figure, clf;
subplot(2,2,1), imshow(Img), title('Original Image', "fontsize", FS);
subplot(2,2,2), imshow(ext_edge), title('Edge\_1 = External', "fontsize", FS);
subplot(2,2,3), imshow(int_edge), title('Edge\_2 = Internal', "fontsize", FS);
subplot(2,2,4), imshow(edge), title('Edge\_3 = External + Internal', "fontsize", FS);
saveas(gcf, 'Boundary Detection using Dilation and Erosion.jpg');
