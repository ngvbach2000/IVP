%Ex3_3 Cropping and Zooming an image
clear, clc, close all;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pkg load image;
FS = 15; %fontsize of caption

%a. Cropping an image
%Img = imread('mandrill.tif');

%x1 = 150; x2 = 450; y1 = 100; y2 = 500;
%xmin = x1; ymin = y1; width = x2 - x1; height = y2 - y1;
%Img_cropped = imcrop(Img, [xmin ymin width height]);

%figure(1), clf;
%subplot(1,2,1), imshow(Img), title('Original Image', "fontsize", FS);
%subplot(1,2,2), imshow(Img_cropped), title('Cropped Image', "fontsize", FS);

%save image
%saveas(1, 'Cropping Image.png');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%b. Zooming an image with different interpolation methods
Img = imread('bird.jpg');

Img_z1 = imresize(Img, 4); %by default, bicubic
Img_z2 = imresize(Img, 3, 'nearest'); %zero-order
Img_z3 = imresize(Img, 2, 'bilinear'); %first-order

figure(2), clf;
subplot(2,2,1), imshow(Img), title('Original Image', "fontsize", FS);
subplot(2,2,2), imshow(Img_z1), title('Bicubic', "fontsize", FS);
subplot(2,2,3), imshow(Img_z2), title('Nearest', "fontsize", FS);
subplot(2,2,4), imshow(Img_z3), title('Bilinear', "fontsize", FS);

%save image
saveas(2, 'Zooming with Different Interpolation Methods.png');
