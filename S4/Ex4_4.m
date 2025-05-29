%Ex4_4 Local Histogram Equalization
clear, clc, close all;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pkg load image;
%load test image
Img = rgb2gray(imread('newspaper.jpg'));

%perform global histogram equalization
eq_Img = histeq(Img);
%perform local histogram equalization
lc_Img = blockproc(Img, [98 294], @histeq);

%show image
FS = 15; %fontsize of caption
figure(1), clf;
subplot(1,3,1), imshow(Img), title('Original Image', "fontsize", FS);
subplot(1,3,2), imshow(eq_Img), title('Global Equal.', "fontsize", FS);
subplot(1,3,3), imshow(lc_Img), title('Local Equal.', "fontsize", FS);
%show histogram before and after equalization

