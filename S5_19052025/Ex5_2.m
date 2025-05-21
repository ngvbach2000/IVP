% Subsampling an image
clear, clc, close all;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pkg load image;
img = im2double(imread('bike.png'));

% perform subsampling by a matrix multiplication
[row,col] = size(img);
a = eye(row / 2);
b = [1;0];
c = [0.5;0.5];
h1 = kron(a, b);
h2 = kron(a, c);

%perfrom convolving on the image
sub_img1 = h1' * img * h1;
sub_img2 = h2' * img * h2;

%show image
FS = 15;
figure(1), clf;

subplot(1,3,1), imshow(img), title('Origin image', "fontsize", FS);
subplot(1,3,2), imshow(sub_img1), title('Method 1', "fontsize", FS);
subplot(1,3,3), imshow(sub_img2), title('Method 2', "fontsize", FS);
saveas(1, 'Subsampling filtering.jpg');
