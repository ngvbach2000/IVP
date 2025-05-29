%Ex2_3 Brightness Adjustment
clear, clc, close all;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%load test image
Img = im2double(imread('rose.jpg'));

%brightness adjustment by an intensity scaling
scale = 0.75; %scale=1: unchanged; scale>1: brighter; scale<1: darker
scaled_Img = Img .* scale;

%plot image
FS = 15; %fontsize of caption
figure, clf;
subplot(1,2,1), imshow(Img, [0 1]), title('Original Image', "fontsize", FS);
subplot(1,2,2), imshow(scaled_Img, [0 1]), title('Darker Image', "fontsize", FS);

%save image
saveas(gcf, 'Darker.jpg');
