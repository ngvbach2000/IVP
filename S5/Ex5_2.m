%Ex5_2 Subsampling an image
clear, clc, close all;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pkg load image;
%load test image
Img = im2double(imread('bike.png'));

%perform subsampling by a matrix multiplication
[row,col] = size(Img);
a = eye(row / 2);
b = [1; 0];
c = [0.5; 0.5];
h1 = kron(a,b);
h2 = kron(a,c);
%375x750 750x1124
sub_Img1 = h1' * Img * h1; %h1' is the transpose matrix of h1
sub_Img2 = h2' * Img * h2;

%show images
FS = 15; %fontsize of caption
figure, clf;
subplot(1,3,1), imshow(Img), title('Original Image', "fontsize", FS);
subplot(1,3,2), imshow(sub_Img1), title('Method 1', "fontsize", FS);
subplot(1,3,3), imshow(sub_Img2), title('Method 2', "fontsize", FS);
saveas(gcf, 'Subsampling 2:1 in Different Methods.jpg');
