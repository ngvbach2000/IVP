% Contrast enhancement
clear, clc, close all;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Load test image
Img = im2double(imread('waterfall.jpg'));

%contrast enhancement by changing a 'gamma' characteristic
gamma = 1.9; % =1: no change; >1 increase contrast; <1 decrease contrast
enhancement_Img = Img .^ gamma;

%plot image
FS = 15
figure, clf;

subplot(1, 2, 1), imshow(Img, [0, 1]), title('Original Image', "fontsize", FS);
subplot(1, 2, 2), imshow(enhancement_Img, [0, 1]), title('Contrast Image', "fontsize", FS);

saveas(gcf, 'waterfall_contrast.jpg');
