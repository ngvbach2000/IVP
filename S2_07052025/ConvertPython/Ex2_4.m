%Ex2_4 Contrast Enhancement
clear, clc, close all;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%load test image
Img = im2double(imread('waterfall.jpg'));

%contrast enhancement by changing a 'gamma' characteristic
gamma = 0.2; %gamma=1: unchanged; gamma>1: increase; gamma<1: decrease
enhanced_Img = Img .^ gamma;

%plot image
FS = 15; %fontsize of caption
figure, clf;
subplot(1,2,1), imshow(Img, [0 1]), title('Original Image', "fontsize", FS);
subplot(1,2,2), imshow(enhanced_Img, [0 1]), title('Decrease Contrast', "fontsize", FS);

%save image
saveas(gcf, 'Decrease.png');
