%Ex2_1 Read and display an image with different types and quality
clear, clc, close all;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pkg load image; %load image package in Octave

Img = imread('nature.jpg'); %color image
Img_grayscale = rgb2gray(Img); %grayscale image
Img_bw = im2double(im2bw(Img_grayscale, 0.5));

%display image in different quality
FS = 15; %fontsize of caption
figure, clf;
subplot(1,3,1), imshow(Img), title('Original Image', "fontsize", FS);
subplot(1,3,2), imshow(Img_grayscale), title('Grayscale Image', "fontsize", FS);
subplot(1,3,3), imshow(Img_bw), title('Binary Image', "fontsize", FS);
saveas(gcf, 'Image in Different Types.jpg');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%save the origin color image in different quality
imwrite(Img, 'nature100.jpg'); %save as default
imwrite(Img, 'nature75.jpg', 'quality', 75); %save as 75% of the origin
imwrite(Img, 'nature10.jpg', 'quality', 10); %save as 10% of the origin
