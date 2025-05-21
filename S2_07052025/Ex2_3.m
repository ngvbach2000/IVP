% Brightness Adjusment
clear, clc, close all;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Load test image
Img = im2double(imread('rose.jpg'));

%brightness ajusment by an intensity scalling

scale = 0.5; %scale = 1:unchange, > 1: brigher
scale_Img = Img .* scale;

%plot image
FS = 15
figure, clf;

subplot(1, 2, 1), imshow(Img, [0, 1]), title('Original Image', "fontsize", FS);
subplot(1, 2, 2), imshow(scale_Img, [0, 1]), title('Brighter Image', "fontsize", FS);

saveas(gcf, 'rose_darker.jpg');
